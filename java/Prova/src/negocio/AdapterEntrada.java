package negocio;

public class AdapterEntrada extends EntradaUSB {
    private final EntradaPS2 entradaPS2;

    public AdapterEntrada(EntradaPS2 entradaPs2) {
        this.entradaPS2 = entradaPs2;
    }
   
    @Override
    public void conectarEntradaUSB() {
        entradaPS2.conectarEntradaPS2();
    }
}
