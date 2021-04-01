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
public class TvOnOffLightOnOffCommand implements Command {
    
    Tv tv;
    Light light;
    
    public TvOnOffLightOnOffCommand(Tv tv, Light light){
        this.tv =  tv;
        this.light = light;
    }

    @Override
    public void btnOn() {
        this.tv.on();
        this.light.off();

    
    }

    @Override
    public void btnMiddle() {
        this.tv.infoChannel();
    }

    @Override
    public void btnOff() {
        this.tv.off();
        this.light.on();
    }
    
}
