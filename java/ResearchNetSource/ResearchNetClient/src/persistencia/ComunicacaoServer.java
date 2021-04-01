package persistencia;

import configuracao.Configuracao;
import java.io.*;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lucas
 */
public class ComunicacaoServer {
    private final String server = Configuracao.ADDRESS_SERVER;
    private Socket client = null;
    private Thread rcv;
    public volatile boolean receiving;
    public volatile String msg;
    
    //strings de mensagens
    
    //cliente
    public static final String CONNECT = "connect";
    public static final String LOGIN = "login";
    public static final String REFRESH = "refresh";
    public static final String REQUEST_NETWORKS = "requestnetworks";
    public static final String CREATE_NETWORK = "createnetwork";
    public static final String CREATE_USER = "createuser";
    public static final String SEARCH_MEMBERS = "searchmember";
    public static final String SEARCH_NETWORKS = "searchnetworks";
    public static final String REQUEST_PACKAGE = "requestpackage";
    public static final String DELETE_NETWORK = "deletenetwork";
    public static final String MODIFY_NETWORK = "modifynetwork";
    
    //servidor
    public static final String LOGIN_ACCEPTED = "loginaccepted";
    public static final String LOGIN_FAILED = "loginfailed";
    public static final String PACKAGE = "package";
    public static final String USER_NETWORKS = "usernetworks";
    public static final String PUBLIC_NETWORKS = "publicnetworks";
    public static final String USER_CREATED = "usercreated";
    public static final String USED_EMAIL = "usedemail";
    public static final String NETWORK_CREATED = "networkcreated";
    public static final String NETWORK_DELETED = "networkdeleted";
    public static final String MODIFIED_NETWORK = "modifiednetwork";
    
    public boolean conectar() {
        if(client == null){
            try {
                client = new Socket(server, 3210);
                return true;
            } catch (UnknownHostException ex) {
                Logger.getLogger(ComunicacaoServer.class.getName()).log(Level.SEVERE, null, ex);
                return false;
            } catch (IOException ex) {
                Logger.getLogger(ComunicacaoServer.class.getName()).log(Level.SEVERE, null, ex);
                return false;
            }
        }else{
            return true;
        }
    }

    public void send(String str, String tipo) {
        PrintStream ps;
        try {
            ps = new PrintStream(client.getOutputStream());
            System.out.println("Cliente enviando....");
            System.out.println("Mensagem enviada:"+tipo + "#" + str);
            ps.println(tipo + "#" + str);
            receiving = true;
            rcv = null;
            rcv = new Thread(
                        new Runnable() {

                            @Override
                            public void run() {
                                receive();
                            }
                        });
            rcv.start();
        } catch (IOException ex) {
            Logger.getLogger(ComunicacaoServer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void receive() {
        try {
            receiving = true;
            DataInputStream entrada = new DataInputStream(client.getInputStream());
            System.out.println("Cliente recebendo.......");
            String str = entrada.readUTF();
            System.out.println("Mensagem recebida:"+str);
            String[] split = str.split("#");
            if (split.length > 0) {
                msg = split[0];
                if(msg.equals(PACKAGE)){
                    int cont = 0;
                    byte b[] = new byte[1];
                    int fsize = Integer.parseInt(split[1]);
                    String nomeXML = split[2];
                    int l;

                    FileOutputStream arq = new FileOutputStream(nomeXML);
                    while (cont < fsize) {
                        l = entrada.read(b);
                        if(l > 0){
                            arq.write(b, 0, l);
                            cont += l;
                        }else{
                            break;
                        }
                    }
                    arq.close();
                }
            } else {
                System.out.println("Cliente recebeu uma mensagem incompleta:"+str);
            }
        } catch (UnknownHostException e) {
        } catch (IOException e) {
        } finally {
            receiving = false;
            rcv.interrupt();
        }
    }
}
