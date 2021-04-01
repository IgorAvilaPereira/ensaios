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
public class CarroProxy implements IVeiculo {
    private IVeiculo carro;
    private Empregado motorista;

    public CarroProxy(IVeiculo carro, Empregado motorista) {
        this.carro = carro;
        this.motorista = motorista;
    }
    
    
    

    @Override
    public void manobrar() {
        if (motorista.anosDeIdade() > 18 && motorista.getNumeroCarteiraMotorista().length() > 0){           
            System.out.println("O Empregado tem mais de 18 e possui Habilitação. Assim, pode monobrar os carros da garagem...");
            this.carro.manobrar();
        }
        else {
            System.out.println("Não pode monobrar nenhum carro...Ou não é maior de 18 anos ou não tem carteira de habilitação");
        }
    }
    
    
    
}
