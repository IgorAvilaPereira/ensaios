

public class Cliente {
	public static void main(String[] args) {
		PalioPrototype prototipoPalio = new PalioPrototype();

		CarroPrototype palioNovo = prototipoPalio.clonar();
		palioNovo.setValorCompra(2900.0);
                
		CarroPrototype palioUsado = prototipoPalio.clonar();
		//palioUsado.setValorCompra(palioNovo.getValorCompra() +  2100);

		System.out.println(palioNovo.exibirInfo());
                System.out.println("=================================");
		System.out.println(palioUsado.exibirInfo());
                System.out.println("====================================");                
                //FiestaPrototype prototipoFiesta = new FiestaPrototype();
                //CarroPrototype fiestaNovo = prototipoFiesta.clonar();
              //  CarroPrototype fiestaNovo2 = new FiestaPrototype();
      		//System.out.println(fiestaNovo.exibirInfo());
	}
}