/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import negocio.Date;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        Date d1 = new Date(31, 12, 2015);
        //DataIgor d2 = new DataIgor(22, 5, 2019);
       // DataIgor d3 = new DataIgor(2015, 5, 23);
        
        //System.out.println("D1 eh antes de D2:" + d1.before(d2));
        //System.out.println("D1 eh depois de D2:" + d1.after(d2));
        //System.out.println("D3 eh igual a d2:" + d3.equals(d2));
        System.out.println("D1:"+d1);
        
        System.out.println("D1 + 40 days:" + d1.plusDays(60));
        
        /*
        System.out.println("===================");
        System.out.println("D1 + 1 day:" + d1.tomorrow());
        System.out.println("D1 + 1 year:" + d1.plusDays(365));
        System.out.println("===================");
        System.out.println("D1 - 1 day:" + d1.yesterday());
        System.out.println("D1 - 1 year:" + d1.minusDays(365));
        */
        //DataIgor d2 = d1.plusDays(366);
        
        //System.out.println("(D3 + 1 ano) - 1 ano:" + d4.);


        //System.out.println("D3 + x dias:"+d3.plusDays(20).toString());
        //System.out.println("D3 + x dias:" + d1.plusDays(365).toString());
        //System.out.println(dataIgor.toString());
        //System.out.println(dataIgor.yesterday().toString());
        //System.out.println("Eh bissexto:"+d1.ehBissexto());

    }

}
