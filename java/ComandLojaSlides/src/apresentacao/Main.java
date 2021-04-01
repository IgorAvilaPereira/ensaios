package apresentacao;

import negocio.PagamentoCartaoDebito;
import negocio.PagamentoCartaoCredito;
import negocio.Loja;
import negocio.PagamentoBoleto;

public class Main {

    public static void main(String[] args) {
        Loja lojasAfricanas = new Loja("Afriacanas");
        lojasAfricanas.executarCompra(999.00, new PagamentoCartaoCredito());
        lojasAfricanas.executarCompra(49.00, new PagamentoBoleto());
        lojasAfricanas.executarCompra(99.00, new PagamentoCartaoDebito());

        Loja exorbitante = new Loja("Exorbitante");
        exorbitante.executarCompra(19.00, new PagamentoCartaoCredito());

    }
}
