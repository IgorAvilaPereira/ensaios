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
public class Waitress {
    Menu pancakeHouseMenu;
    Menu dinerMenu;

    public Waitress(Menu pancakeHouseMenu, Menu dinerMenu) {
        this.pancakeHouseMenu = pancakeHouseMenu;
        this.dinerMenu = dinerMenu;
    }
    
        
    public void printMenu(){
        Iterator pancakeIterator = pancakeHouseMenu.createIterator();
        Iterator dinerMenuIterator = dinerMenu.createIterator();
        
        printMenu(pancakeIterator);
        
        printMenu(dinerMenuIterator);

        
        
        /*
        ArrayList menuItems = pancakeHouseMenu.getMenuItems();
        for (int i = 0; i < menuItems.size(); i++) {
            MenuItem menuItem = (MenuItem) menuItems.get(i);
            System.out.println(menuItem.getName());            
        }
        
        MenuItem menuItems2[] = dinerMenu.getMenuItems();
        
        for (int i = 0; i < menuItems2.length; i++) {
            MenuItem menuItem = menuItems2[i];
            System.out.println(menuItem.getName());                       
        } */       
        
        
    }

    // demais metodos....

    private void printMenu(Iterator iterator) {
        while(iterator.hasNext()){
            MenuItem  menuItem = (MenuItem) iterator.next();
            System.out.println(menuItem.getName());
        }
    }
    
}
