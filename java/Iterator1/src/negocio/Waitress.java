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
    PancakeHouseMenu pancakeHouseMenu;
    DinerMenu dinerMenu;

    public Waitress(PancakeHouseMenu pancakeHouseMenu, DinerMenu dinerMenu) {
        this.pancakeHouseMenu = pancakeHouseMenu;
        this.dinerMenu = dinerMenu;
    }
    
    
    
    public void printMenu(){
        ArrayList menuItems = pancakeHouseMenu.getMenuItems();
        for (int i = 0; i < menuItems.size(); i++) {
            MenuItem menuItem = (MenuItem) menuItems.get(i);
            System.out.println(menuItem.getName());            
        }
        
        MenuItem menuItems2[] = dinerMenu.getMenuItems();
        
        for (int i = 0; i < dinerMenu.numberOfItems; i++) {            
            MenuItem menuItem = menuItems2[i];
            System.out.println(menuItem.getName());                       
        }        
    }

    // demais metodos....
    
}
