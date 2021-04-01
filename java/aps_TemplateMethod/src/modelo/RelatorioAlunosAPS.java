/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author iapereira
 */
public class RelatorioAlunosAPS extends Relatorio {

    @Override
    protected String conteudo() {
        return "Robinson\nBernardo\nRafaela\nMyreli\n";
    }
    
    protected String rodape(){
        return "Novo rodape";
    }
    
}
