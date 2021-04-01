/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package session;

import java.io.Serializable;
import javax.enterprise.context.SessionScoped;

/**
 *
 * @author iapereira
 */

@SessionScoped
public class ChuvaSession implements Serializable {
 
    private boolean granizo;
    private String ondeTo;
    
    public ChuvaSession(){
        this.granizo = false;
        this.ondeTo = "IFRS";
    }

    public boolean isGranizo() {
        return granizo;
    }

    public void setGranizo(boolean granizo) {
        this.granizo = granizo;
    }

    public String getOndeTo() {
        return ondeTo;
    }

    public void setOndeTo(String ondeTo) {
        this.ondeTo = ondeTo;
    }
    
    
    
    
}
