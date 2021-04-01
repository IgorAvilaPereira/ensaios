
package modelo;

public class Produto {
    protected String nome;
    protected double preco;
    protected Promocao promocao;

    public Promocao getPromocao() {
        return promocao;
    }

    public void setPromocao(Promocao promocao) {
        this.promocao = promocao;
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
    
    public double calcPreco(){
        return this.preco * this.promocao.descontar();
    }
    
}
