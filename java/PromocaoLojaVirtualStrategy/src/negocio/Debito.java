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
public class Debito implements Pagamento {

    @Override
    public void invocandoModulo() {
        System.out.println("Debitado em Conta");    
    }
    
    
}
