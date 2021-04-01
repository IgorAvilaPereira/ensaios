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
public class Document {
    private ImageProxy imageProxy;
    private Text text;

    
    public Document() {
        this.text = new Text();
    }
    
    
    
   

    public ImageProxy getImageProxy() {
        return imageProxy;
    }

    public void setImageProxy(ImageProxy imageProxy) {
        this.imageProxy = imageProxy;
    }

    public Text getText() {
        return text;
    }

    public void setText(Text text) {
        this.text = text;
    }

    public void show() {
        for (int i = 0; i < this.text.getWords().size(); i++) {
            String word = this.text.getWords().get(i);
            System.out.println(word);           
            
        }
        System.out.println(imageProxy.getExtent().toString());
    }
    
    
    
    
}
