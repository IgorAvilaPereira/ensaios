package main;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.List;
import server.ThreadCliente;

/**
 *
 * @author lucas
 */
public class MainServer {

    private static List<ThreadCliente> Threads;

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            System.out.println("Iniciando o Servidor...");
            if (System.getProperty("os.name").equals("Linux")) {
                System.out.println(System.getProperty("user.dir") + "/data/");
            } else {
                System.out.println(System.getProperty("user.dir") + "\\data\\");

            }
            ServerSocket server = new ServerSocket(3210);

            while (true) {
                Socket conn = server.accept();
                ThreadCliente tmp = new ThreadCliente(conn);
                tmp.start();
            }
        } catch (IOException e) {
        }
    }
}
