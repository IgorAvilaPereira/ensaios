/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

/**
 *
 * @author iapereira
 */
public class Configuracao {
    private String nomeAplicacao;
    private String titulo;
    private static Configuracao uniqueInstance;
    
    private Configuracao(){
        this.nomeAplicacao =  "";
        this.titulo = "";
        
    }
    
    public static synchronized Configuracao getInstance(){
        if (Configuracao.uniqueInstance == null){
            Configuracao.uniqueInstance = new Configuracao();
        }
        return Configuracao.uniqueInstance;
    }

    public String getNomeAplicacao() {
        return nomeAplicacao;
    }

    public void setNomeAplicacao(String nomeAplicacao) {
        this.nomeAplicacao = nomeAplicacao;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    
    
    
    
}
