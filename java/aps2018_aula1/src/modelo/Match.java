/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author iapereira
 */
public class Match {
    private Perfil perfil1;
    private Perfil perfil2;
    
 

    public Match(Perfil p1, Perfil p2) {
        this.perfil1 = p1;
        this.perfil2 = p2;
    }

    public Perfil getPerfil1() {
        return perfil1;
    }

    public void setPerfil1(Perfil perfil1) {
        this.perfil1 = perfil1;
    }

    public Perfil getPerfil2() {
        return perfil2;
    }

    public void setPerfil2(Perfil perfil2) {
        this.perfil2 = perfil2;
    }

    public String imprime() {
        return perfil1.getNome() + " se interessou por " + perfil2.getNome();
    }
    
    
    
    
}
