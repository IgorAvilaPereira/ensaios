/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author iapereira
 */
public class ExportHTML extends Export {

    @Override
    public void export() {
        String html = "<table border='1'>";
        for (int i = 0; i < vetContato.size(); i++) {
            Contato contato = vetContato.get(i);
            html += "<tr> <td> " + contato.getCpf() + "</td> <td> " + contato.getNome() + "</td> </tr>";

        }
        html += "</table>";
        
        
        FileWriter arq;
        try {
            arq = new FileWriter("/home/iapereira/contatos.html");
            PrintWriter gravarArq = new PrintWriter(arq);
            gravarArq.printf(html);
            arq.close();
        } catch (IOException ex) {
            Logger.getLogger(ExportHTML.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
