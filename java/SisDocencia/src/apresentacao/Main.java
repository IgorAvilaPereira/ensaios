package apresentacao;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Main {

    public static void main(String[] args) {

        Main obj = new Main();        
        String command = "./sisDocencia.sh";
        String output = obj.executeCommand(command);        
        //String command = "";
        //String output = obj.executeCommand(command);        
        //command = "php -S localhost:8081";
        //output = obj.executeCommand(command);        
        command = "google-chrome http://localhost:8081";
        output = obj.executeCommand(command);
        System.out.println(output);
    }

    private String executeCommand(String command) {

        StringBuffer output = new StringBuffer();

        Process p;
        try {
            p = Runtime.getRuntime().exec(command);
            p.waitFor();
            BufferedReader reader
                    = new BufferedReader(new InputStreamReader(p.getInputStream()));

            String line = "";
            while ((line = reader.readLine()) != null) {
                output.append(line + "\n");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return output.toString();

    }

}
