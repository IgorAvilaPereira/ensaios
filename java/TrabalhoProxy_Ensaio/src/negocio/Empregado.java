/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.time.LocalDate;
import java.time.Month;
import java.time.Period;

/**
 *
 * @author iapereira
 */
public class Empregado {
    private String nome;
    private LocalDate dataNascimento;
    private String numeroCarteiraMotorista;
    
    public Empregado(){
        this.numeroCarteiraMotorista = "";
        this.dataNascimento = LocalDate.now();
        this.nome = "";
    }

    public int anosDeIdade() {           
        LocalDate today = LocalDate.now();
        LocalDate birthday = this.dataNascimento;
        Period p = Period.between(birthday, today);
        /*
        System.out.println(p.getDays());
        System.out.println(p.getMonths());
        System.out.println(p.getYears());
         */
        return p.getYears();
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public LocalDate getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(LocalDate dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getNumeroCarteiraMotorista() {
        return numeroCarteiraMotorista;
    }

    public void setNumeroCarteiraMotorista(String numeroCarteiraMotorista) {
        this.numeroCarteiraMotorista = numeroCarteiraMotorista;
    }

}
