package negocio;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;

/**
 *
 * @author iapereira
 */
@Entity
public class PessoaJuridica extends Pessoa implements Serializable{
    @Column(name = "cnpj")
    private String cnpj;

    public PessoaJuridica() {
        super();
    }

    public PessoaJuridica(String nome, String cnpj) {        
        this.nome = nome;
        this.cnpj =  cnpj;
    }

    public String getCpf() {
        return cnpj;
    }

    public void setCpf(String cpf) {
        this.cnpj = cpf;
    }
    
    
    
}
