/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import negocio.Ka;
import negocio.Onix;
import negocio.Polo;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws ClassNotFoundException, InstantiationException, IllegalAccessException, NoSuchMethodException, IllegalArgumentException, InvocationTargetException {
        // TODO code application logic here
        
        Polo poloPrototype = new Polo();
        System.out.println(poloPrototype.exibirInfo());
        poloPrototype.setValorCompra(40000);
        System.out.println(poloPrototype.exibirInfo());

        
        Polo poloEx = (Polo) poloPrototype.clonar();
        poloEx.setAno(2018);
        System.out.println(poloEx.exibirInfo());
        //System.out.println(poloEx.exibirInfo());
        
        
        Ka kaPrototype = new Ka();
        kaPrototype.setValorCompra(10000);        
        Ka kaEx1 = (Ka) kaPrototype.clonar();
        kaEx1.setValorCompra(20000);
        Ka kaEx2 = (Ka) kaEx1.clonar();
        
        
        Onix onixPrototype = new Onix();
        onixPrototype.setAno(2015);
        onixPrototype.setValorCompra(10000);
        
        Onix onixUsado = (Onix) onixPrototype.clonar();
        System.out.println(onixUsado.exibirInfo());
        
        
        /*
        Class c = Class.forName("negocio.Ka");
        Object o = c.newInstance();
        //System.out.println(o.getClass().getSimpleName());
        Method m = c.getMethod("exibirInfo");
        System.out.println(m.invoke(o));
        */
        

        
    }
    
}
