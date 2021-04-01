package command;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import persistencia.UsuarioDAO;

/**
 *
 * @author iapereira
 */
public class ExcluirCommand extends Command {

    public ExcluirCommand(String pagina, HttpServletRequest request, HttpServletResponse response) {
        super(pagina, request, response);        
    }

    @Override
    public void execute() {
        try {
            new UsuarioDAO().excluir(Integer.parseInt(request.getParameter("id")));
        } catch (SQLException ex) {
            Logger.getLogger(ExcluirCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
