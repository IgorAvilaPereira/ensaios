package apresentacao;

import java.io.FileNotFoundException;
import java.io.IOException;
import negocio.Export;
import negocio.ExportHTML;

/**
 *
 * @author iapereira
 */
public class Main {

    public static void main(String[] args) throws FileNotFoundException, IOException {
        
        Export exportHTML = new ExportHTML();
        exportHTML.runExport();
        
    }

}
