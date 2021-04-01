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
public class CarroMotoAdapter extends Carro {
    protected Moto moto;
    
    public CarroMotoAdapter(Moto moto) {
        super(moto.getModelo(), moto.getMarca(), moto.getAno());
        this.moto = moto;
    }
    
    public String direcao(){
        return moto.guidao();
    }
    
    public int qtdeRodas(){
        return moto.qtdeRodas();
    }
    
    
    
    
}
