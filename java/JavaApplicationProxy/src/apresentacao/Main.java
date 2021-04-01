/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.CommandExecutor;
import negocio.CommandExecutorImpl;
import negocio.CommandExecutorProxy;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        // TODO code application logic here
        
        //CommandExecutor commandExecutor =  new CommandExecutorImpl();
        //commandExecutor.runCommand("ls");
        
        CommandExecutorProxy commandExecutorProxy =  new CommandExecutorProxy("iapereira", "senha");
        commandExecutorProxy.runCommand("rm igor_proxy.txt");
    }
    
}
