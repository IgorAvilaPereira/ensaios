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
public class DinerMenu implements Menu {
    static final int MAX_ITEMS = 6;
    int numberOfItems = 0;
    MenuItem[] menuItems;
    
    public DinerMenu(){
        this.menuItems =  new MenuItem[MAX_ITEMS];
        addItem("Item1", "descrição - item 1", true, 2.99);

    }

    private void addItem(String name, String description, boolean vegetarian, double price) {
        MenuItem menuItem =  new MenuItem(name, description, vegetarian, price);
        if (numberOfItems >= MAX_ITEMS){
            System.out.println("Sorry");
        } else{
            menuItems[numberOfItems] = menuItem;
            numberOfItems = numberOfItems + 1;
        }
    }

    //public MenuItem[] getMenuItems() {
     //   return menuItems;
    //}
    
    @Override
    public Iterator createIterator(){
        return new DinerMenuIterator(menuItems);
    }    
    
}
