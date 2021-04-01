package modelo;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author iapereira
 */
public class Cliente {
    public static final String ID = "id";
    private int id;
    public static final String NOME = "nome";
    private String nome;
    private List<Endereco> vetEndereco;
    
    public Cliente(){
        this.vetEndereco = new ArrayList();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public List<Endereco> getVetEndereco() {
        return vetEndereco;
    }

    public void setVetEndereco(List<Endereco> vetEndereco) {
        this.vetEndereco = vetEndereco;
    }
    
    
    
    
    
}
