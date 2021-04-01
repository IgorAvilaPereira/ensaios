/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.util.HashMap;
import negocio.Iterator;
import negocio.Menu;

/**
 *
 * @author iapereira
 */
public class CoffeMenu implements Menu {
    HashMap menuItem;
    int position;

    public CoffeMenu() {
        this.menuItem = new HashMap();
        addItem("Espresso", "descrição", true, 1.0);
    }

    @Override
    public Iterator createIterator() {
        return new CoffeMenuIterator(this.menuItem);
    }

    private void addItem(String name, String description, boolean vegetarian, double price) {
        MenuItem item = new MenuItem(name, description, vegetarian, price);
        this.menuItem.put(this.position, item);
    }
    
}
