package comandos;

import objetos.Light;

/**
 * @author Paulo Collares
 * www.paulocollares.com.br
 */
public class LightOnComand implements Command{

    Light light;
    
    public LightOnComand(Light light){
        this.light=light;
    }
    
    @Override
    public void execute() {
        //System.out.println("Luz acesa...");
        light.on();
    }

    @Override
    public void undo() {
        //System.out.println("Luz apagada...");
        light.off();
    }
    
}
