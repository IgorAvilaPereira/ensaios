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
public class Image implements Graphic {
    private String arquivo;
    private Extent extent;
    
    public Image(String nmImage){
        this.arquivo = nmImage;
        System.out.println("Carregando as dimensoes verdadeiras");
        this.extent = new Extent();
        this.extent.setAltura(500);
        this.extent.setLargura(500);
    }

    @Override
    public void Draw() {
        
        System.out.println("====================");
        System.out.println("Aqui eh o objeto imagem verdadeiro"+this.arquivo);
        System.out.println("Nao tem migue de proxy aqui...");
        System.out.println("Renderizando verdadeiramente a imagem...");
        System.out.println("====================");
    }

    @Override
    public Extent GetExtent() {
        return this.extent;
    }

    @Override
    public void Store() {
        System.out.println("Salvando a imagem....");
    }

    @Override
    public void Load() {
        System.out.println("Carregando a imagem...");
    }
    
}
