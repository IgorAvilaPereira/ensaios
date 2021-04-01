package negocio;

import javax.persistence.Column;
import javax.persistence.Entity;

/**
 *
 * @author iapereira
 */
@Entity
public class PessoaFisica extends Pessoa {
    
    @Column
    private String cpf;

    public PessoaFisica() {
    }
    
    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    
    
    
}
