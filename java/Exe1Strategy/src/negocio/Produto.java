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
    protected Promocao promocao;
    
    public Produto (String nome, double preco, Promocao  promocao){
        this.nome = nome;
        this.preco = preco;
        this.promocao = promocao;
        
    }
    
    
    public Produto(){
        this.promocao = new SemPromocao();
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
        return promocao;
    }

    public void setPromocao(Promocao promocao) {
        this.promocao = promocao;
    }
    
    public double calcPreco(){
        return this.preco * this.promocao.descontar();
    }
    
}
