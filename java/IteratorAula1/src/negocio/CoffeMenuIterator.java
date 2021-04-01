/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.util.HashMap;

/**
 *
 * @author iapereira
 */
public class CoffeMenuIterator implements Iterator {
    HashMap menuItem;
    int position = 0;

    public CoffeMenuIterator(HashMap menuItem) {
        this.menuItem = menuItem;
    }

    @Override
    public boolean hasNext() {
        return this.menuItem.containsKey(position);
    }

    @Override
    public Object next() {
        Object object = this.menuItem.get(position);
        position++;
        return object;
    }
    
}
