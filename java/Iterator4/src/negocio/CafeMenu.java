/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.util.Hashtable;

/**
 *
 * @author iapereira
 */
public class CafeMenu implements Menu {
    Hashtable menuItems;
    int position = 0;
    
    public CafeMenu(){
        this.menuItems =  new Hashtable();
        addItem("Cafe", "description", true, 1.99);
    }
 

    private void addItem(String name, String description, boolean vegetarian, double price) {
        MenuItem menuItem =  new MenuItem(name, description, vegetarian, price);
        this.menuItems.put(position, menuItem);
        position++;
    }
    
    @Override
    public Iterator createIterator() {
        return new CafeMenuIterator(menuItems);
    }
    
    
    
}
