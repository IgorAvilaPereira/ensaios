package calculo_metricas;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import persistencia.ConexaoPostgreSQL;

/**
 *
 * @author lucas
 */
public class MainGeraGraphML {

    /**
     * @param args the command line arguments
     * @throws java.sql.SQLException
     * @throws java.io.IOException
     */
    public static void main(String[] args) throws SQLException, IOException {
        GeradorGraphML ml = new GeradorGraphML();
        SerializadorPublicacoes sp = new SerializadorPublicacoes();
        ConexaoPostgreSQL conn = new ConexaoPostgreSQL();
        ResultSet rs = conn.executeQuery("select id from rede order by id");
        while(rs.next()){
            ml.gerarGraphML(rs.getInt(1));
            sp.serializarPubsRede(rs.getInt(1));            
        }
        //ml.gerarGraphML(14);
        //sp.serializarPubsRede(14);
        
    }
}
