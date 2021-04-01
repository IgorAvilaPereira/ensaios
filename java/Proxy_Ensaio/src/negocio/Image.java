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
    private Extent extent;
    private String filename;

    public Image(String filename) {
        this.filename = filename;
        this.load();
    }   

    @Override
    public void draw() {
        System.out.println("Draw image....");
    }

    @Override
    public Extent getExtent() {
        return this.extent;
    }

    @Override
    public void store() {
        System.out.println("Store....");
    }

    @Override
    public void load() {
        System.out.println("Load Image from disk....");
        System.out.println("Setting real dimensions:");
        this.extent = new Extent(200, 300);
    }

    @Override
    public String getFileName() {
        return this.filename;
    }
    
}
