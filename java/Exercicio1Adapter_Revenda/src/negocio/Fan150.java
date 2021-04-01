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
public class Fan150 implements Moto {

    @Override
    public void duasRodas() {
        System.out.println("Fan é MOTO. Aqui é motoca. Logo, 2 rodinhas...");
    }

    @Override
    public void guidao() {
        System.out.println("Aqui é GUIDÃO. #profissaomotoboy");
    }
    
}
