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
public class TvOnOffCommand implements Command{
    Tv tv;
    
    public TvOnOffCommand(Tv tv){
        this.tv =  tv;
    }

    @Override
    public void btnOn() {
        this.tv.on();
    }

    @Override
    public void btnOff() {
        this.tv.off();
    }

    @Override
    public void btnMiddle() {
        this.tv.increaseVolume();
    }
    
}
