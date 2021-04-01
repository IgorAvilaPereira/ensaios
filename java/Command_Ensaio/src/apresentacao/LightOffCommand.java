package apresentacao;

import command.Command;
import eletricdevices.Light;

/**
 *
 * @author iapereira
 */
class LightOffCommand implements Command {
    Light light;

    public LightOffCommand(Light newlight) {
        this.light = newlight;
    }

    @Override
    public void execute() {
        this.light.off();
    }
    
}
