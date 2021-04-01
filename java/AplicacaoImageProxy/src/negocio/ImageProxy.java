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
public class ImageProxy implements Graphic {
    private Image image;
    private String nmImage;
    private Extent extent;
    
    public ImageProxy(String nmImage){
        this.nmImage = nmImage;        
        this.extent = new Extent();
        this.extent.setAltura(200);
        this.extent.setLargura(100);
    }

    @Override
    public void Draw() {
        if (image  == null){
            this.image = new Image(this.nmImage);
        }
        this.image.Draw();
    }

    @Override
    public Extent GetExtent() {
        if (this.image == null){
            return this.extent;
        }
        return this.image.GetExtent();
    }

    @Override
    public void Store() {
        System.out.println("Resolvendo o store dentro do proxy...");
        System.out.println("Dei um migue...nao instanciei o objeto de imagem ainda....");
        System.out.println("Nois eh f@d@");
        
    }

    @Override
    public void Load() {
        
    }
    
}
