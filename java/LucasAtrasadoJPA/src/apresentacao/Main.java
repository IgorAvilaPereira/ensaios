/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import modelo.Endereco;
import modelo.PessoaFisica;
import modelo.Professor;
//import persistencia.ProfessorDAO;

/**
 * ==
 *
 * @author iapereira
 */
public class Main {

    private static EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("PU");

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

//        Professor pintaFofinho = new Professor();
//        
//        pintaFofinho.setNome("Pinta Fofinho");
//        pintaFofinho.setSalario(50000);
//        
//        Endereco endereco1 = new Endereco();        
//        endereco1.setNumero("69");
//        endereco1.setRua("cassineiro");
//        endereco1.setProfessor(pintaFofinho);
//        
//        Endereco endereco2 = new Endereco();        
//        endereco2.setNumero("120");
//        endereco2.setRua("furg");
//        endereco2.setProfessor(pintaFofinho);
//        
//        pintaFofinho.getEnderecos().add(endereco1);
//        pintaFofinho.getEnderecos().add(endereco2);
//        entityManager.getTransaction().begin();
//        
//        entityManager.persist(pintaFofinho);
//        
//       entityManager.getTransaction().commit();
//       
//       entityManager.close();
        PessoaFisica zaza = new PessoaFisica();
        zaza.setNome("careca");
        zaza.setCpf("0100010101010");

        entityManager.getTransaction().begin();
//        
        entityManager.persist(zaza);
//        
        entityManager.getTransaction().commit();
//       
        entityManager.close();

    }
}
