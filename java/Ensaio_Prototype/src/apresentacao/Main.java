/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.CarroPrototype;
import negocio.Dog;
import negocio.FiestaPrototype;
import negocio.Person;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        System.out.println("Exemplo 1: ");
        Person person1 = new Person("Fred");
        System.out.println("person 1:" + person1);
	Person person2 = (Person) person1.doClone();
	System.out.println("person 2:" + person2);
	System.out.println("===============");
        Dog dog1 = new Dog("Wooof!");
	System.out.println("dog 1:" + dog1);
	Dog dog2 = (Dog) dog1.doClone();
	System.out.println("dog 2:" + dog2);   
        System.out.println("=======================");
        
        System.out.println("Exemplo 2:");
        
        // Exemplo 2
        FiestaPrototype fiestaPrototype = new FiestaPrototype();        
        fiestaPrototype.setValorCompra(2000);
        System.out.println(fiestaPrototype.exibirInfo());
        System.out.println("===========================");          
        CarroPrototype fiestaNovo = (FiestaPrototype) fiestaPrototype.clonar();
        System.out.println(fiestaNovo.exibirInfo());        
        System.out.println("===========================");          
        fiestaNovo.setValorCompra(40000);        
        System.out.println(fiestaNovo.exibirInfo());
        
        
    }    
}