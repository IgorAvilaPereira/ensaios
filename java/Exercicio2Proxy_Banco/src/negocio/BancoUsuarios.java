package negocio;

/**
 *
 * @author iapereira
 */
public class BancoUsuarios {
    private int quantidadeDeUsuarios;
    private int usuariosConectados;
    
    

    public BancoUsuarios() {
        this.quantidadeDeUsuarios = (int) (Math.random() * 100);
        this.usuariosConectados = (int) (Math.random() * 10);
    }

    public String getNumeroDeUsuarios() {
        return "Total de usuarios: " + quantidadeDeUsuarios;
    }

    public String getUsuariosConectados() {
        return "Usuarios conectados: " + usuariosConectados;
    }
}
