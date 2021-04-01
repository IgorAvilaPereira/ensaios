/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

/**
 *
 * @author iapereira
 */
public class CommandExecutorProxy implements CommandExecutor {
    private CommandExecutorImpl commandExecutorImpl;
    
    private boolean isAdmin;
            
    public CommandExecutorProxy(String login, String senha){        
        this.isAdmin = login.equals("iapereira") && senha.equals("senha");
    }
    
    
    

    @Override
    public void runCommand(String cmd) throws Exception {
        if (commandExecutorImpl == null){                
                commandExecutorImpl =  new CommandExecutorImpl();
        }
        if (!isAdmin && cmd.contains("rm")){
            throw new Exception("FOi mal...ops...");
        } else {        
            commandExecutorImpl.runCommand(cmd);
        }
    }
    
}
