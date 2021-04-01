/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.time.LocalDate;
import java.time.Month;
import negocio.Carro;
import negocio.CarroProxy;
import negocio.IVeiculo;
import negocio.Empregado;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Empregado empregado = new Empregado();
        empregado.setDataNascimento(LocalDate.of(1987, Month.JANUARY, 20));
        empregado.setNome("Igor Pereira");
        empregado.setNumeroCarteiraMotorista("00000000");  
        //System.out.println("Anos:"+empregado.anosDeIdade());
        
        Carro carro = new Carro();
        carro.setAno(2015);
        carro.setMarca("Renault");
        carro.setModelo("Sandero");
        carro.setPlaca("ISF1259");
        
         
        CarroProxy carroProxy = new CarroProxy(carro, empregado);
        carroProxy.manobrar();
    }
    
}
