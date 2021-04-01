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
public class ImageProxy extends Graphic {
    private String filename;
    private Extent extent;
    private Image image;

    public ImageProxy(String filename) {
        this.filename = filename;
        this.extent = new Extent(200, 200);
    }
    
    

    @Override
    public void draw() {
        if (this.image == null){
            this.image = new Image();
        }
        this.image.draw();
    }

    @Override
    public Extent getExtent() {
        if (image == null){
            return this.extent;
        }
        return image.getExtent();
           
    }

    @Override
    public void store() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void load() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
