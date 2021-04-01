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
public class PancakeHouseMenuIterator implements Iterator{
    ArrayList menuItems;
    int position = 0;
    
    public PancakeHouseMenuIterator(ArrayList items){
        this.menuItems =  items;
    }

    @Override
    public boolean hasNext() {
        if (position < menuItems.size()) {
            return true;
        }
        return false;
                
    }

    @Override
    public Object next() {
        Object objeto = menuItems.get(position);
        position++;
        return objeto;
    }
    
}
