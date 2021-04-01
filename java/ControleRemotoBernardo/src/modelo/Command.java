/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author bernardo.silva
 */
public interface Command {
    
    void execute();
    void undo();
    
}
