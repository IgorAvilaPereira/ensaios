
package apresentacao;

import negocio.condiment.Sugar;
import negocio.Beverage;
import negocio.beverages.DarkRoast;
import negocio.beverages.Espresso;
import negocio.condiment.Milk;
import negocio.condiment.Mocha;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Beverage cafe = new Espresso();
        System.out.println("O que tu eh:"+cafe.getDescription());
        System.out.println("Qte:"+cafe.qtde());
        System.out.println("Espresso roots:"+cafe.cost());
        System.out.println("=====================");
        
        cafe = new Milk(cafe);
        System.out.println("Qte:"+cafe.qtde());
        System.out.println("Descricao:"+cafe.getDescription());
        System.out.println("Valor:"+cafe.cost());
    
        System.out.println("==================");
        cafe = new Sugar(cafe);
        System.out.println("Qte:"+cafe.qtde());
        System.out.println("Descricao:"+cafe.getDescription());
        System.out.println("Valor:"+cafe.cost());
        System.out.println("==================");
        
        System.out.println("+ Sugar");
        cafe = new Sugar(cafe);
        System.out.println("Qte:"+cafe.qtde());
        System.out.println("Descricao:"+cafe.getDescription());
        System.out.println("Valor:"+cafe.cost());
        System.out.println("==================");
        
        System.out.println("==============");
        System.out.println("DarkRoast + Mocha");
        Beverage darkroast = new DarkRoast();
        darkroast = new Mocha(darkroast);
        System.out.println("Qte:"+darkroast.qtde());
        System.out.println("Descricao:"+darkroast.getDescription());
        System.out.println("Valor:"+darkroast.cost());
       
        
    }
    
}
