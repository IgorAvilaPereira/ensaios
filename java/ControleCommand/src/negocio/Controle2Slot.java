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
public class Controle2Slot {

    Command slot1;
    Command slot2;

    public Controle2Slot() {
        this.slot1 = new NoCommand();
        this.slot2 = new NoCommand();
    }

    public Controle2Slot(Command slot1, Command slot2) {

        this.slot1 = slot1;
        this.slot2 = slot2;
    }

    public void buttonOn(int slot) {
        if (slot == 1) {
            this.slot1.btnOn();
        } else if (slot == 2) {
            this.slot2.btnOn();
        }
    }

    public void buttonOff(int slot) {
        if (slot == 1) {
            this.slot1.btnOff();
        } else if (slot == 2) {
            this.slot2.btnOff();
        }
    }

    public void setSlot1(Command slot) {
        this.slot1 = slot;
    }

    public void setSlot2(Command slot) {
        this.slot2 = slot;
    }

    public void buttonMiddle(int slot) {
        if (slot == 1) {
            this.slot1.btnMiddle();
        } else if (slot == 2) {
            this.slot2.btnMiddle();
        }
    }

}
