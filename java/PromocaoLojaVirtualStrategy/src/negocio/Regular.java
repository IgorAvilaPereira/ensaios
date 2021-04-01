/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author iapereira
 */
public class Regular implements Promocao {

    @Override
    public double descontar() {
        java.util.Date date = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int month = cal.get(Calendar.MONTH);
        //System.out.println("m:"+month);
        if (month == 9) {
            System.out.println("Caiu no mes de out....");
            return 0.8;
        }
        return 0.9;
    }

}
