/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;

/**
 *
 * @author iapereira
 */
public abstract class Export {

    protected ArrayList<Contato> vetContato;
    
    public Export(){
        this.vetContato =  new ArrayList();
    }

    public final void runExport() throws IOException {
        read();
        export();
    }

    private void read() throws FileNotFoundException, IOException {
        ArrayList<Contato> vetContatoAux = new ArrayList();
        
        Reader in = new FileReader("/home/iapereira/contatos.csv");
        Iterable<CSVRecord> records = CSVFormat.RFC4180.withDelimiter(';').parse(in);
        for (CSVRecord record : records) {
            String cpf = record.get(0);
            String nome = record.get(1);
            vetContatoAux.add(new Contato(cpf, nome));
        }

        this.vetContato = vetContatoAux;

    }

   public abstract void export();
}
