/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio.sauna;

import java.util.ArrayList;

/**
 *
 * @author iapereira
 */
public class Sauna {
    private final String rua;
    private final String numero;
    private final String complemento;
    private ArrayList<Cliente> clientes;
    private ArrayList<Garota> garotas;

    public ArrayList<Cliente> getClientes() {
        return clientes;
    }

    public void setClientes(ArrayList<Cliente> clientes) {
        this.clientes = clientes;
    }

    public ArrayList<Garota> getGarotas() {
        return garotas;
    }

    public void setGarotas(ArrayList<Garota> garotas) {
        this.garotas = garotas;
    }
    
    

    public Sauna(String rua, String numero, String complemento) {
        this.rua = rua;
        this.numero = numero;
        this.complemento = complemento;
        this.clientes = new ArrayList();
        this.garotas = new ArrayList();
    }

    public void comecaSacanagem() {
        for (int i = 0; i < clientes.size(); i++) {
            Cliente c = clientes.get(i);
            System.out.println("========");
            System.out.println("Cliente"+c.getApelido()+" vai pegar");
            for (int j = 0; j < garotas.size(); j++) {
                Garota g = garotas.get(j);
                System.out.println("Garota:"+g.getApelido());
                
            }
            System.out.println("=============");
            
        }
    }
    
    
    
}
