/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

/**
 *
 * @author iapereira
 */
public abstract class Produto {
    protected String nome;
    protected double preco;
    protected Promocao p;
    protected Pagamento pag;

    public Pagamento getPag() {
        return pag;
    }

    public void setPag(Pagamento pag) {
        this.pag = pag;
    }
    public Produto(){
        this.p = new Liquidacao();
        this.pag = new Debito();
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public Promocao getPromocao() {
        return p;
    }

    public void setPromocao(Promocao p) {
        this.p = p;
    }
    
    public double calcPreco(){
        this.pag.invocandoModulo();
        return this.preco * this.p.descontar();
    }
    
  
}
