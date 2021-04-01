/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import com.sun.prism.Graphics;
import negocio.Graphic;
import negocio.ImageProxy;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String filename = "photo.jpg";
        ImageProxy imageProxy = new ImageProxy(filename);
        
        System.out.println("Without Image Object");
        System.out.println("Filename:"+imageProxy.getFileName());
        System.out.println("Extent Default:"+imageProxy.getExtent().toString());
        System.out.println("=================================");
        System.out.println("Draw...");
        imageProxy.draw();
        System.out.println("Extent Actual:"+imageProxy.getExtent().toString());
        
    }
    
}
