package telas;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Toolkit;
import javax.swing.JFrame;
import javax.swing.JScrollPane;
import java.awt.List;

/**
 * @author Paulo Collares
 * www.paulocollares.com.br
 */
public class Status extends JFrame {    
    private static Status instance;    
    private final List ja;
    
    private Status() {           
        
        Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();        
        super.setTitle("Status - Controle Remoto");
        super.setVisible(true);
        
        super.setBounds(350,250,350, 350);
        super.setResizable(true);
        super.setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        super.setLocation((dim.width/2),(dim.height/2)-200);
        
        ja = new List();        
        
        super.add(ja);
        
    }
    
    public void addMensagem(String texto){
        //System.out.println("Adicionando mensagem...."+texto);
        //ja.append("\n"+texto+"\n");
        ja.add("\n"+texto+"\n");
        //ja.setCaretPosition( ja.getText().length() ); 
    }
    
    public static Status getInstance(){
        
        if (instance==null)
            instance=new Status();
        
        return instance;
    }
    
    
    
    
}
