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
public class Image extends Graphic {
    private Extent extent;
    private byte[] imageImple;
    
    public Image(){
        this.extent = new Extent(100, 100);
    }

    @Override
    public void draw() {
        System.out.println("Exibindo na tela...Operação custosa...");
    }

    @Override
    public Extent getExtent() {
        return this.extent;
    }

    @Override
    public void store() {
        System.out.println("Salvando arquivo");
    }

    @Override
    public void load() {
        System.out.println("Carregando arquivo...Operação custosa...");
    }
    
}
