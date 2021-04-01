
package apresentacao;

import modelo.Normal;
import modelo.DvD;
import modelo.Liquidacao;
import modelo.Produto;
import modelo.Regular;

public class Main {

    public static void main(String[] args) {
        DvD dvd = new DvD();
        dvd.setNome("Gretchen");
        dvd.setCapa("capa feia...");
        dvd.setPreco(2.0);
        dvd.setPromocao(new Normal());
        System.out.println("Preço:"+dvd.calcPreco());
        System.out.println("Ocorreu algo...");
        dvd.setPromocao(new Regular());
        System.out.println("Preço:"+dvd.calcPreco());


        
        
        
    }
    
}
