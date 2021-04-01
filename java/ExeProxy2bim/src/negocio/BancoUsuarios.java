package negocio;

/**
 *
 * @author iapereira
 */
public class BancoUsuarios {
    private final int quantidadeDeUsuarios;
    private final int usuariosConectados;

    public BancoUsuarios() {
        this.quantidadeDeUsuarios = (int) (Math.random() * 100);
        this.usuariosConectados = (int) (Math.random() * 10);
    }

    public String getNumeroDeUsuarios() {
        return "Total de usuários: " + quantidadeDeUsuarios;
    }

    public String getUsuariosConectados() {
        return "Usuários conectados: " + usuariosConectados;
    }
}
