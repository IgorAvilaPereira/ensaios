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
public class Mario {
    private int qtdeFichas;
    private int nrVidas;
    private MarioState estado;

    public Mario() {
        this.estado = new MarioPequeno();
        this.nrVidas = 2;
        this.qtdeFichas = 0;
    }
    
    
    public void pegarCogumelo(){
        this.estado = estado.pegarCogumelo();
    }
    
    public void levouDano(){
        this.estado = estado.levouDano();
        if (this.estado.getClass().getSimpleName().equals("MarioMorto")){
            System.out.println("Morreu...");
            this.nrVidas--;
            if (this.nrVidas > 0){
                this.estado = new MarioPequeno();
            } else {
                System.out.println("Game Over");
            }
        }
    }
    
    public void pegarPena(){
        this.estado = this.estado.pegarPena();
    }
    
    public void pegarFlor(){
        this.estado = this.estado.pegarFlor();
    }    
    

    public int getQtdeFichas() {
        return qtdeFichas;
    }

    public void setQtdeFichas(int qtdeFichas) {
        this.qtdeFichas = qtdeFichas;
    }

    public int getNrVidas() {
        return nrVidas;
    }

    public void setNrVidas(int nrVidas) {
        this.nrVidas = nrVidas;
    }

    public MarioState getEstado() {
        return estado;
    }

    public void setEstado(MarioState estado) {
        this.estado = estado;
    }
    
    
    
    
    
    
}
