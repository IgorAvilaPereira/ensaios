/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.util.List;

/**
 *
 * @author iapereira
 */
public class Pedido {

    private int id;
    private List<Item> items;
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public List<Item> getItems() {
        return items;
    }
    
    public void setItems(List<Item> items) {
        this.items = items;
    }
    
    public void addItem(Item item) {
        item.setPedido(this);
        this.items.add(item);
    }
    
}
