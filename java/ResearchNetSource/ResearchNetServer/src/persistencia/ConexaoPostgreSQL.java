package persistencia;

import configuracao.Configuracao;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Date;

public class ConexaoPostgreSQL {

    private Connection conn;
    private ResultSet rs;
    private Statement st;
    private int c = 0;

    public ConexaoPostgreSQL() {
        try {
            //Class.forName("org.postgresql.Driver");

            String url = "jdbc:postgresql://" + Configuracao.HOST_POSTGRES + "/" + Configuracao.DBNAME_POSTGRES + "?user=" + Configuracao.USER_POSTGRES + "&password=" + Configuracao.PASSWORD_POSTGRES;
            //String url = "jdbc:postgresql://localhost/lattes?user=postgres&password=postgres";
            conn = DriverManager.getConnection(url);

        } catch (SQLException e) {
        }
//        catch (ClassNotFoundException ex) 
//        {
//                ex.printStackTrace();
//        }
    }

    public ResultSet executeQuery(String query) {
        try {
            log(query);
            st = conn.createStatement();
            rs = st.executeQuery(query);
        } catch (SQLException e) {
            log(e.getMessage());
        }
        return rs;
    }

    public void executeUpdate(String query) {
        try {
            log(query);
            st = conn.createStatement();
            st.executeUpdate(query);
        } catch (SQLException e) {
            log(e.getMessage());
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

    private void log(String str) {
        FileOutputStream f = null;
        try {
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();

            f = new FileOutputStream(Configuracao.DIR_SERVER_DATA+"log.sql", true);
            OutputStreamWriter o = new OutputStreamWriter(f);

            o.write(dateFormat.format(date) + " SQL: ");
            o.write(str);
            o.write(System.getProperty("line.separator"));
            o.close();
            f.close();
        } catch (IOException ex) {
            Logger.getLogger(ConexaoPostgreSQL.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                f.close();
            } catch (IOException ex) {
                Logger.getLogger(ConexaoPostgreSQL.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
