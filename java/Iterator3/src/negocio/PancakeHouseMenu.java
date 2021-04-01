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
public class PancakeHouseMenu implements Menu {
    ArrayList menuItems;
    
    public PancakeHouseMenu(){
        this.menuItems =  new ArrayList();
        
        addItem("Item1", "descrição - item 1", true, 2.99);
    }

    private void addItem(String name, String description, boolean vegetarian, double price) {
        MenuItem menuItem =  new MenuItem(name, description, vegetarian, price);
        this.menuItems.add(menuItem);
    }

  //  public ArrayList getMenuItems() {
   //     return menuItems;
    //}
    
    @Override
   public Iterator createIterator(){
        return new PancakeHouseMenuIterator(menuItems);
    }    
    
    
}
