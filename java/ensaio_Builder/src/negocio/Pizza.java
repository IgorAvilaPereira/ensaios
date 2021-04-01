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
public class Pizza {
    private int tamanho;
    private boolean queijo;
    private boolean tomate;
    private boolean bacon;

    public Pizza(int tamanho) {
        this.tamanho = tamanho;
    }

    public Pizza(int tamanho, boolean queijo) {
        this.tamanho = tamanho;
        this.queijo = queijo;
    }

    public Pizza(int tamanho, boolean queijo, boolean tomate, boolean bacon) {
        this.tamanho = tamanho;
        this.queijo = queijo;
        this.tomate = tomate;
        this.bacon = bacon;
    }

    @Override
    public String toString() {
        return "Pizza{" + "tamanho=" + tamanho + ", queijo=" + queijo + ", tomate=" + tomate + ", bacon=" + bacon + '}';
    }
    
    

    public static class Builder {
        // obrigatorio
        private final int tamanho;
        // opcional
        private boolean queijo = false;
        private boolean tomate = false;
        private boolean bacon = false;

        public Builder(int tamanho) {
            this.tamanho = tamanho;
        }

        public Builder queijo() {
            this.queijo = true;
            return this;
        }

        public Builder bacon() {
            this.bacon = true;
            return this;
        }

        public Builder tomate() {
            this.tomate = true;
            return this;
        }

        public Pizza build() {
            return new Pizza(this);
        }

    }

    private Pizza(Builder builder) {
        this.tamanho = builder.tamanho;
        this.queijo = builder.queijo;
        this.tomate = builder.tomate;
        this.bacon = builder.bacon;
    }

}
