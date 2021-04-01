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
public class CafeMenuIterator implements Iterator {
    //Hashtable items;
    Hashtable items;
    int position;

    public CafeMenuIterator(Hashtable menuItems) {
        this.items =  menuItems;
    }

    @Override
    public boolean hasNext() {
        return !(position >= items.size() || items.get(position) == null);        
    }

    @Override
    public Object next() {
        MenuItem item = (MenuItem) items.get(position);
        position++;
        return item;
        
    }
    
}
