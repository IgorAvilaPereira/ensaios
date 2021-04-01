/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adapter;

import negocio.Duck;
import negocio.module.Turtle;

/**
 *
 * @author iapereira
 */
public class TurtleAdapter implements Duck {
    Turtle turtle;

    public TurtleAdapter(Turtle turtle) {
        this.setTurtle(turtle);
    }

    public void setTurtle(Turtle turtle) {
        this.turtle = turtle;
    }

    @Override
    public void quack() {
        this.turtle.bip();

    }

    @Override
    public void fly() {
        this.turtle.run();
    }

}
