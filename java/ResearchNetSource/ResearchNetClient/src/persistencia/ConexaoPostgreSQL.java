package persistencia;

import configuracao.Configuracao;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConexaoPostgreSQL {

    private Connection conn;
    private ResultSet rs;
    private Statement st;
    private int c = 0;

    public ConexaoPostgreSQL() {

        String url = "jdbc:postgresql://" + Configuracao.HOST_POSTGRES + "/" + Configuracao.DBNAME_POSTGRES + "?user=" + Configuracao.USER_POSTGRES + "&password=" + Configuracao.PASSWORD_POSTGRES;
        //String url = "jdbc:postgresql://localhost/lattes?user=postgres&password=postgres";
        try {
            conn = DriverManager.getConnection(url);
        } catch (SQLException ex) {
            Logger.getLogger(ConexaoPostgreSQL.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet executeQuery(String query) {
        try {
            st = conn.createStatement();
            rs = st.executeQuery(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    public void executeUpdate(String query) {
        try {
            st = conn.createStatement();
            st.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            conn.close();
            this.finalize();
        } catch (SQLException e) {
        } catch (Throwable e) {
        }

    }

}
