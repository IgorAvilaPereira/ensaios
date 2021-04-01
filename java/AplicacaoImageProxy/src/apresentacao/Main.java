/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Image;
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
        String nmImage = "thammy.jpg";
        ImageProxy imageProxy = new ImageProxy(nmImage);
        System.out.println("Só pelo proxy:"+imageProxy.GetExtent().getAltura());
        
        
        imageProxy.Draw();
        
        System.out.println("Só pela imagem (obj real):"+imageProxy.GetExtent().getAltura());

        
        
    }
    
}
