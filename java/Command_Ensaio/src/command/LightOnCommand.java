package command;

import eletricdevices.EletricDevice;
import eletricdevices.Light;

/**
 *
 * @author iapereira
 */
public class LightOnCommand implements Command{
    EletricDevice eletricDevice;

    public LightOnCommand(Light light) {
        this.eletricDevice = light;
    }

    @Override
    public void execute() {
        eletricDevice.on();
       
    }
    
}
