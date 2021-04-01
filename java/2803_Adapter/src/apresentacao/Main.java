/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.CarroMotoAdapter;
import negocio.Moto;
import negocio.Carro;
import persistencia.ConexaoPostgreSQL;
import persistencia.ConexaoPostgreSQLProxy;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
//        // adapter
//        Carro carro = new Carro("Fiesta", "Ford", 2015);        
//        Moto moto = new Moto("cg125", "Honda", 2017);        
//        CarroMotoAdapter carroMotoAdapter = new CarroMotoAdapter(moto);        
//        System.out.println(carro.direcao());
//        System.out.println(carro instanceof Carro);
//        System.out.println(carroMotoAdapter instanceof Carro);

        ConexaoPostgreSQL conexaoPostgreSQL = new ConexaoPostgreSQLProxy("postgres", "postgres");
        conexaoPostgreSQL.getConexao();
    }
    
}
