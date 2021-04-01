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
public class Regular implements Promocao {
    protected DescontoMes descontoMes;
    
    public Regular(){
        this.descontoMes = new JaneiroDesconto();
    }
    
    public Regular(DescontoMes descontoMes){
        this.descontoMes = descontoMes;
    }
    
    public DescontoMes getDescontoMes() {
        return descontoMes;
    }

    public void setDescontoMes(DescontoMes descontoMes) {
        this.descontoMes = descontoMes;
    }
    
    
    @Override
    public double descontar() {
        return 0.9 - this.descontoMes.descontoMes();
    }
    
}
