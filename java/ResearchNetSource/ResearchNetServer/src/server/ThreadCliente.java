package server;

import persistencia.ConexaoPostgreSQL;
import configuracao.Configuracao;
import java.io.*;
import java.net.Socket;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import calculo_metricas.GeradorGraphML;
import calculo_metricas.SerializadorPublicacoes;

/**
 *
 * @author lucas
 */
public class ThreadCliente extends Thread {

    private final Socket conn;
    private ConexaoPostgreSQL conexao = null;
    public static final int LIMITE = 20;
    private int user;

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

    public ThreadCliente(Socket cliente) {

        this.conn = cliente;

    }

    @Override
    public void run() {
        Thread rcv = new Thread(
                new Runnable() {

            @Override
            public void run() {
                receive();
            }
        });
        rcv.start();
    }

    public void send(String str) {
        try {
            DataOutputStream saida = new DataOutputStream(conn.getOutputStream());
            System.out.println("Servidor enviando......");
            saida.writeUTF(str + "#");
            saida.flush();
        } catch (IOException ex) {
            Logger.getLogger(ThreadCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void sendXML(String xml) {
        System.out.println("Chamando o metodo sendXML....");
        try {
            DataOutputStream saida = new DataOutputStream(conn.getOutputStream());
            System.out.println("Xml:"+xml);
            System.out.println("Pq isso esta no cliente??");
            File file = new File(Configuracao.DIR_SERVER_DATA+xml);
            try (FileInputStream arq = new FileInputStream(file)) {
            //try (FileInputStream arq = new FileInputStream(xml)) {
                int fileSize = arq.available();
                byte[] buffer = new byte[fileSize];
                
                DataInputStream in = new DataInputStream(arq);
                saida.writeUTF(PACKAGE + "#" + fileSize + "#" + xml + "#" + System.getProperty("line.separator"));
                
                while (in.read(buffer) != -1) {
                    saida.write(buffer, 0, buffer.length);
                }
                System.out.println("EnviandoXML.....");
            } catch(IOException e){
                System.out.println("sendXML:fileInputStream....");
            }
            saida.flush();
        } catch (IOException ex) {
            System.out.println("sendXML: dataoutput stream... Servidor nao encontrou o xml....Caiu...aqui....");
            Logger.getLogger(ThreadCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void receive() {
        try {
            while (true) {
                BufferedReader entrada = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                String str = entrada.readLine();
                System.out.println("Servidor recebendo e chamando a rotina correta.........");
                System.out.println("Rotina a ser chamada:" + str);
                //if (!str.equals("null")) {
                
                // chamando a rotina a ser executada...
                call(str);
                //} else {
                //  System.out.println("Servidor recebeu null");
                //}
            }
        } catch (Exception ex) {
            Logger.getLogger(ThreadCliente.class.getName()).log(Level.WARNING, null, ex);
        }
    }

    private void call(String str) {
        if (str == null) { 
            System.out.println("Problema Servidor: mensagem nula...");
            System.out.println("Encerrando servidor...");
            System.exit(0);
        } else { 
            int begin = str.indexOf("#");
            if (begin >= 0) {
                String tipo = str.substring(0, begin);
                System.out.println("Rotina (Tipo):" + tipo);
                String valor = str.substring(begin + 1);
                System.out.println("Rotina (Valor):" + valor);
                if (tipo.equals(CREATE_USER)) {
                    String email = valor.substring(0, valor.indexOf("/"));
                    String hash = valor.substring(valor.indexOf("/") + 1);
                    createuser(email, hash);
                } else if (tipo.equals(LOGIN)) {
                    System.out.println("Rotina login dentro do servidor...thread login");
                    String email = valor.substring(0, valor.indexOf("/"));
                    System.out.println("email:" + email);
                    String hash = valor.substring(valor.indexOf("/") + 1);
                    System.out.println("Hash:" + hash);
                    login(email, hash);
                } else if (tipo.equals(SEARCH_MEMBERS)) {
                    searchMembers(valor);
                } else if (tipo.equals(CREATE_NETWORK)) {
                    createNetwork(valor);
                } else if (tipo.equals(REQUEST_NETWORKS)) {
                    requestNetworks();
                } else if (tipo.equals(REQUEST_PACKAGE)) {
                    requestPackage(valor);
                } else if (tipo.equals(DELETE_NETWORK)) {
                    deleteNetwork(valor);
                } else if (tipo.equals(MODIFY_NETWORK)) {
                    modifyNetwork(valor);
                } else if (tipo.equals(SEARCH_NETWORKS)) {
                    searchNetworks(valor);
                } else {
                    System.out.println("Problema Servidor: Caiu em nenhuma rotina");
                }
            } else {
                System.out.println("Problema Servidor: sem # na mensagem...");
            }
        }
    }

    private void searchNetworks(String str) {
        try {
            if (conexao == null) {
                conexao = new ConexaoPostgreSQL();
            }
            String query = "select nome, usuarios.email from rede, usuarios "
                    + "where rede.autor = usuarios.id and rede.visibilidade "
                    + "and nome ilike '%" + str + "%' limit " + LIMITE;
            ResultSet rs = conexao.executeQuery(query);
            String a = "";
            while (rs.next()) {
                a += rs.getString("nome");
                a += "+";
                a += rs.getString("email");
                a += "/";
            }
            if (a.equals("")) {
                a = " ";
            }
            this.send(a);

        } catch (SQLException ex) {
            Logger.getLogger(ThreadCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void modifyNetwork(String str) {
        String[] split = str.split("\\+");
        String publico, anoinicio, anofim, nome, id;
        id = split[0];
        nome = split[1];
        if (split[2].equals("0")) {
            anoinicio = "NULL";
        } else {
            anoinicio = split[2];
        }
        if (split[3].equals("0")) {
            anofim = "NULL";
        } else {
            anofim = split[3];
        }
        if (split[4].equals("public")) {
            publico = "true";
        } else {
            publico = "false";
        }
        //String query = "update(nome, autor, visibilidade, anoinicio, anofim) VALUES ('"+split[0]+"', "+user+", "+publico+", '"+split[1]+"', '"+split[2]+"') returning id";
        String query = "begin; update rede set nome = '" + nome + "', visibilidade = " + publico + ", anoinicio = " + anoinicio + ", anofim = " + anofim + " where id = " + id + " and autor = " + user + ";";
        if (conexao == null) {
            conexao = new ConexaoPostgreSQL();
        }
        try {
            ResultSet rs = conexao.executeQuery(query);
            rs.next();

            query = "delete from membrosrede where idrede = " + id + ";";
            query += "insert into membrosrede (idrede, idlattes) select " + id + ", id_lattes from membros where id_membro in (";
            for (int i = 5; i < split.length; i++) {
                query += split[i];
                if (i < split.length - 1) {
                    query += ", ";
                }
            }
            query += ");commit;";
            conexao.executeUpdate(query);
            createXML(Integer.parseInt(split[0]));
            this.send(NETWORK_CREATED);

        } catch (SQLException | IOException ex) {
            Logger.getLogger(ThreadCliente.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        }
    }

    private void deleteNetwork(String str) {
        String query = "delete from rede where id = " + str + " and autor = " + user;
        if (conexao == null) {
            conexao = new ConexaoPostgreSQL();
        }
        conexao.executeUpdate(query);
        this.send(NETWORK_DELETED);
    }

    private void requestPackage(String str) {
        String query = "select xml from rede where id = " + str;
        if (conexao == null) {
            conexao = new ConexaoPostgreSQL();
        }
        try {
            ResultSet rs = conexao.executeQuery(query);
            rs.next();
            String xml = rs.getString("xml");
            System.out.println("Encontrou?"+xml);
            this.sendXML(xml);
        } catch (SQLException ex) {
            Logger.getLogger(ThreadCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void requestNetworks() {

        String query = "select id, nome, visibilidade, anoinicio, anofim, xml from rede where autor = " + user + " order by nome";
        System.out.println("RequestNetWorks ConsultaSQL:" + query);
        String msg = "";
        if (conexao == null) {
            conexao = new ConexaoPostgreSQL();
        }
        try {
            ResultSet rs = conexao.executeQuery(query);
            ResultSet rsint;
            while (rs.next()) {
                msg += rs.getString("id") + "+" + rs.getString("nome") + "+";
                if (rs.getBoolean("visibilidade")) {
                    msg += "TRUE+";
                } else {
                    msg += "FALSE+";
                }
                msg += rs.getInt("anoinicio") + "+" + rs.getInt("anofim") + "+" + rs.getString("xml");
                query = "select id_membro, nome"
                        + " from membros, membrosrede"
                        + " where membros.id_lattes = membrosrede.idlattes"
                        + " and membrosrede.idrede = " + rs.getString("id") + ";";
                System.out.println("Query:"+query);
                rsint = conexao.executeQuery(query);
                while (rsint.next()) {
                    msg += "+" + rsint.getString("id_membro") + "+" + rsint.getString("nome");
                }
                msg += "/";
            }
            System.out.println("RequestNetWork: Mandando mensagem para o cliente:" + msg);
            this.send(msg);
        } catch (SQLException ex) {
            Logger.getLogger(ThreadCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void createNetwork(String str) {
        String[] split = str.split("\\+");
        String publico, anoinicio, anofim, nome;
        nome = split[0];
        if (split[1].equals("0")) {
            anoinicio = "NULL";
        } else {
            anoinicio = split[1];
        }
        if (split[2].equals("0")) {
            anofim = "NULL";
        } else {
            anofim = split[2];
        }
        if (split[3].equals("public")) {
            publico = "true";
        } else {
            publico = "false";
        }
        String query = "insert into rede (nome, autor, visibilidade, anoinicio, anofim) VALUES ('" + nome + "', " + user + ", " + publico + ", " + anoinicio + ", " + anofim + " ) returning id";
        if (conexao == null) {
            conexao = new ConexaoPostgreSQL();
        }
        try {
            ResultSet rs = conexao.executeQuery(query);
            rs.next();
            int idRede = rs.getInt(1);

            query = "insert into membrosrede (idrede, idlattes) select " + idRede + ", id_lattes from membros where id_membro in (";
            for (int i = 4; i < split.length; i++) {
                query += split[i];
                if (i < split.length - 1) {
                    query += ", ";
                }
            }
            query += ");";
            conexao.executeUpdate(query);
            createXML(idRede);
            this.send(NETWORK_CREATED);
        } catch (SQLException | IOException ex) {
            Logger.getLogger(ThreadCliente.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        }

    }

    private void createuser(String email, String hash) {
        try {
            if (conexao == null) {
                conexao = new ConexaoPostgreSQL();
            }
            String query = "select count(*) from usuarios where email = '" + email + "';";
            ResultSet rs = conexao.executeQuery(query);
            rs.next();
            if (rs.getInt("count") == 0) {
                query = "insert into usuarios (email, md5) values ('" + email + "', '" + hash + "');";
                conexao.executeUpdate(query);
                this.send(USER_CREATED);
            } else {
                this.send(USED_EMAIL);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ThreadCliente.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void login(String email, String hash) {
        try {
            if (conexao == null) {
                System.out.println("Criando conexao...");
                conexao = new ConexaoPostgreSQL();
            }
            String query = "select id from usuarios where email = '" + email + "' and md5 = '" + hash + "' ;";
            System.out.println("Consulta SQL login:" + query);
            ResultSet rs = conexao.executeQuery(query);
            if (rs.next()) {
                this.user = rs.getInt("id");
                System.out.println("Login Aceito...");
                this.send(LOGIN_ACCEPTED);
            } else {
                System.out.println("Login rejeitado...");
                this.send(LOGIN_FAILED);
            }
            //System.out.println("Entrou em nada....");

        } catch (SQLException ex) {
            Logger.getLogger(ThreadCliente.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void searchMembers(String str) {
        try {
            if (conexao == null) {
                conexao = new ConexaoPostgreSQL();
            }
            String query = "select id_membro, nome from membros where nome ilike '%" + str + "%' limit " + LIMITE;
            ResultSet rs = conexao.executeQuery(query);
            String a = "";
            while (rs.next()) {
                a += rs.getString("id_membro");
                a += "+";
                a += rs.getString("nome");
                a += "/";
            }
            if (a.equals("")) {
                a = " ";
            }
            this.send(a);

        } catch (SQLException ex) {
            Logger.getLogger(ThreadCliente.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void createXML(int idRede) throws SQLException, IOException {
        GeradorGraphML ml = new GeradorGraphML();
        SerializadorPublicacoes sp = new SerializadorPublicacoes();

        ml.gerarGraphML(idRede);
        sp.serializarPubsRede(idRede);
    }

}
