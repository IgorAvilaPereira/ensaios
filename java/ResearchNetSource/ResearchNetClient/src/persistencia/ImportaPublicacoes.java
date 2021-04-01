/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import negocio.Publicacao;
import java.beans.XMLDecoder;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lucas
 */
public class ImportaPublicacoes {

    public HashMap<String, List<Publicacao>> listaAutores;

    public void importaXML(String arq) {
        try {
            XMLDecoder decoder = new XMLDecoder(new BufferedInputStream(
                    new FileInputStream(arq)));

            listaAutores = new HashMap<String, List<Publicacao>>();

            try {
                Publicacao pub;
                while (true) {
                    pub = (Publicacao) decoder.readObject();
                    if (!listaAutores.containsKey(pub.nome_membro)) {
                        listaAutores.put(pub.nome_membro, new LinkedList<Publicacao>());
                    }
                    listaAutores.get(pub.nome_membro).add(pub);
                }
            } catch (ArrayIndexOutOfBoundsException e) {
            } finally {
                decoder.close();
            }

        } catch (FileNotFoundException ex) {
            Logger.getLogger(ImportaPublicacoes.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("ImportaPublicacoes: Tamanho do list Autores...:"+listaAutores.size());
    }

}
