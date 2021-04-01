/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.util.ArrayList;

/**
 *
 * @author iapereira
 */
public class Carrinho {
    private ArrayList<Item> vetItem;
    //private Comprador comprador;
    //private Vendedor vendedor;
    private FormaDePagamento formaDePagamento;
    
    
    public Carrinho(){
        this.vetItem =  new ArrayList();
    }
        
    public double valorTotal(){
        double valorTotal = 0;
        for (int i = 0; i < vetItem.size(); i++) {
            Item item = vetItem.get(i);
            valorTotal += item.getQtde()*item.getProduto().getPreco();            
        }
        return valorTotal;
    }
    
    public void gerarNota(){
        System.out.println("Nota Fiscal");        
        for (int i = 0; i < vetItem.size(); i++) {
            Item item = vetItem.get(i);
            System.out.println(item.getProduto().getNome() + ";" +  item.getProduto().getPreco() +  ";"+ item.getQtde() + ";" + item.getQtde()*item.getProduto().getPreco());                        
        }
        System.out.println("Valor Total:"+this.valorTotal()); 
        System.out.println("Modalidade de pagamento:");
        this.formaDePagamento.pagar(this);
    }

    public ArrayList<Item> getVetItem() {
        return vetItem;
    }

    public void setVetItem(ArrayList<Item> vetItem) {
        this.vetItem = vetItem;
    }

    public FormaDePagamento getFormaDePagamento() {
        return formaDePagamento;
    }

    public void setFormaDePagamento(FormaDePagamento formaDePagamento) {
        this.formaDePagamento = formaDePagamento;
    }
    
    
}
