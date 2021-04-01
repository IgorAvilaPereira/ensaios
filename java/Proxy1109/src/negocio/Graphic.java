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
public abstract class Graphic {
    public abstract void draw();
    public abstract Extent getExtent();
    public abstract void store();
    public abstract void load();
    
}
