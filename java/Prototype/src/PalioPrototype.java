
public class PalioPrototype extends CarroPrototype {

    private PalioPrototype(PalioPrototype palioPrototype) {
        this.valorCompra = palioPrototype.getValorCompra();
    }

    public PalioPrototype() {
        valorCompra = 10.0;
    }

    @Override
    public String exibirInfo() {
        return "Modelo: Palio\n" + "Montadora: Fiat\n" + "Valor: R$"
                + getValorCompra();
    }

    @Override
    public CarroPrototype clonar() {
        return new PalioPrototype(this);
    }
}
