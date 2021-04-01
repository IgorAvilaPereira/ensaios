/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.util.ArrayList;

/**
 *
 * @author iapereira
 */
public class FestaConcreteSubject implements Subject {
    private String nome;
    private double area;
    private int capacidade;
    private double preco;
    
    private ArrayList<Observer> convidados;

    public FestaConcreteSubject() {
        this.convidados = new ArrayList();
    }  
    

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public int getCapacidade() {
        return capacidade;
    }

    public void setCapacidade(int capacidade) {
        this.capacidade = capacidade;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public ArrayList<Observer> getConvidados() {
        return convidados;
    }

    public void setConvidados(ArrayList<Observer> convidados) {
        this.convidados = convidados;
    }   

    @Override
    public void addObserver(Observer observer) {
        this.convidados.add(observer);
        this.notifyObservers();       
    }
    
    @Override
    public void removerObserver(int i) {
        this.convidados.remove(i);
    }

    @Override
    public void removerObserver(Observer observer) {
        this.convidados.remove(observer);
    }

    @Override
    public void notifyObservers() {        
        for (int i = 0; i < convidados.size() - 1 ; i++) {
            Observer convidado = convidados.get(i);
            convidado.update(this.convidados.get(this.convidados.size() - 1).getNome());            
        }
    }    
}
