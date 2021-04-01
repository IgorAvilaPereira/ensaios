package apresentacao;

import negocio.AdapterEntrada;
import negocio.EntradaPS2;

public class Main {

   public static void main(String[] args) {
        EntradaPS2 ps2 = new EntradaPS2();
        AdapterEntrada adaptador = new AdapterEntrada(ps2);
        adaptador.conectarEntradaUSB();
    }
    
}
