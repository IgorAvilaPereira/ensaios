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
public class PancakeHouseMenu implements Menu{
    ArrayList menuItems;
    
    public PancakeHouseMenu(){
        this.menuItems =  new ArrayList();
        
        addItem("Panquecas caseira xxx", "com amor", false, 69.0);
    }

   // public ArrayList getMenuItems() {
     //   return menuItems;
    //}
    
    @Override
    public Iterator createIterator(){
        return new PancakeHouseMenuIterator(this.menuItems);
    }

    private void addItem(String name, String description, boolean vegetarian, double price) {
         MenuItem menuItem =  new MenuItem(name, description, vegetarian, price);
         this.menuItems.add(menuItem);

    }
    
    
    
    
}
