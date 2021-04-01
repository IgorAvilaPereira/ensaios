/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package canal;

/**
 *
 * @author iapereira
 */
public class Canal {
    private int numero;
    private String nome;
    private boolean temHD;

    public Canal(String nome, int numero) {
        this.nome = nome;
        this.numero = numero;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public boolean isTemHD() {
        return temHD;
    }

    public void setTemHD(boolean temHD) {
        this.temHD = temHD;
    }
    
    
    
}
