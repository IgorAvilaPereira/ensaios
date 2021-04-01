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
public abstract class Relatorio {
    
    
    public final String gerar(){
        String relatorio = this.cabecalho();
        relatorio += this.conteudo();
        relatorio += this.rodape();
        return relatorio;
    }
    
    protected abstract String conteudo();
    
    protected String rodape(){
        return "Alfredo Huch";
    }

    private String cabecalho() {
           return "Relatorio APS";
    }
}
