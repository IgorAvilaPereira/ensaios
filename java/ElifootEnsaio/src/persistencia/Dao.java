package persistencia;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author iapereira
 * @param <Modelo>
 */
public interface Dao<Modelo> {
    
    public Modelo carregar(int id) throws SQLException;
       
    public boolean alterar(Modelo modelo) throws SQLException;
    
    public boolean excluir(int id) throws SQLException;
    
    public boolean adicionar(Modelo modelo) throws SQLException;
    
    public ArrayList<Modelo> listar() throws SQLException;
}
