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
public class DinerMenuIterator implements Iterator{
    int position = 0;
    MenuItem[] menuItems;
    
    public DinerMenuIterator(MenuItem[] items){
        this.menuItems =  items;
    }

    @Override
    public boolean hasNext() {
        if(position >= this.menuItems.length || this.menuItems[position] == null){
             return false;
        }        
        return true;
    }

    @Override
    public Object next() {
        MenuItem menuItem = this.menuItems[position];
        position++;
        return menuItem;
    }
    
}
