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
public class Oi {

    // falta controlar os valores negativos
    public int x(int z) {
        //int z = (int) x;
        // falta controlar os valores negativos
        //if (z < 0){
        //     throw new ArithmeticException("erro..");
        //}
        //if (z  == 0){
        //    return 1;
        //}
        if (z == 1 || z == 0) {
            return 1;
        } else {
            return z * x(z - 1);
        }
    }

    // falta controlar os numeros negativos e 1 e zero
    public boolean w(int z) {
        //int z = (int) x;
        // if (z <= 1 ) return false;
        if (z == 2) {
            return true;
        }
        if (z % 2 == 0) {
            return false;
        }
        int o = 1;
        while (z % o != 0 || o != z) {
            o++;
        }
        return o == z;

    }

    // falta controlar os valores negativos
    public int y(int z) {
        //int z = (int) x;
        // falta controlar os valores negativos
        //if (z < 0){
        //     throw new ArithmeticException("erro..");
        //}
        if (z == 0) {
            return 0;
        }
        if (z == 1 || z == 2) {
            return 1;
        } else {
            return y(z - 1) + y(z - 2);
        }
    }
}
