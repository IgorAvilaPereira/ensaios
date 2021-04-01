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
        this.menuItems = new MenuItem[MAX_ITEMS];
        addItem("lasanha", "descricao da lasanha", true, 10.0);
        addItem("bife", "descricao do bife", false, 20.0);
    }
    
    @Override
    public Iterator createIterator(){
        return new DinerMenuIterator(menuItems);
    }

   // public MenuItem[] getMenuItems() {
    //    return menuItems;
    //}

    public int getNumberOfItems() {
        return numberOfItems;
    }
    
    
    

    private void addItem(String name, String description, boolean vegetarian, double price) {
        MenuItem menuItem =  new MenuItem(name, description, vegetarian, price);
        
        if (numberOfItems>= MAX_ITEMS){
            System.out.println("Não dá mais...");
        } else {
            this.menuItems[numberOfItems] = menuItem;
            numberOfItems++;
        }
    }
}
