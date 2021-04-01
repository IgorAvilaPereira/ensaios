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
    private String filename;
    private Extent extent;
    private Graphic image;

    public ImageProxy(String filename) {
        this.filename = filename;
        this.extent = new Extent(100, 100);
    }
    
       
    @Override 
    public void draw() {
        if (this.image == null){
            System.out.println("Image will be instancead");
            this.image = new Image(filename);
        }
        this.image.draw();
    }

    @Override
    public Extent getExtent() {
        if (this.image == null){
            return this.extent;
        } else {
            return this.image.getExtent();
        }
        
    }

    @Override
    public void store() {
        if (this.image == null){
            this.image = new Image(filename);
        }
        this.image.store();
    }

    @Override
    public void load() {
        if (this.image == null){
            this.image = new Image(filename);
        }
        //this.image.load();
    }

    @Override
    public String getFileName() {
        return this.filename;
    }

   
}
