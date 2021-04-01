/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import negocio.Command;
import negocio.HotTube;

/**
 *
 * @author iapereira
 */
public class HotTubeOnOffCommand implements Command {
    HotTube hotTube;

    public HotTubeOnOffCommand(HotTube hotTube) {
        this.hotTube =  hotTube;
    }

    @Override
    public void btnOn() {
        this.hotTube.jetsOn();
    }

    @Override
    public void btnOff() {
        this.hotTube.jetsOff();
    }

    @Override
    public void btnMiddle() {
        this.hotTube.circulate();
    }
    
}
