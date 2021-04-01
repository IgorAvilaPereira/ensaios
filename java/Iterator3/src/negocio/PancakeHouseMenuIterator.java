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
public class PancakeHouseMenuIterator implements Iterator {
    ArrayList items;
    int position = 0;

    public PancakeHouseMenuIterator(ArrayList items) {
        this.items =  items;
    }

    @Override
    public boolean hasNext() {
        return !(position >= items.size() || items.get(position) == null);
                
    }

    @Override
    public Object next() {
        MenuItem menuItem = (MenuItem) this.items.get(position);
        position++;
        return menuItem;
    }
    
}
