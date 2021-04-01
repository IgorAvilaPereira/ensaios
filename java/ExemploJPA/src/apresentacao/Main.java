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
import negocio.Pessoa;

/**
 *
 * @author iapereira
 */
public class Main {
    private static final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("MeuPU");

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        Pessoa pessoa = new Pessoa();
        //Pessoa pessoa = entityManager.find(Pessoa.class, 1);
        //pessoa.setNome("Ricardo");
        //pessoa.setSobrenome("Fonseca");
        //pessoa.setNome("Igor");
        //pessoa.setSobrenome("Pereira");
        //entityManager.merge(pessoa);
        List<Pessoa> vet = entityManager.createNamedQuery("Pessoa.findAll").getResultList();
        for (int i = 0; i < vet.size(); i++) {
            Pessoa p = vet.get(i);
            System.out.println("Nome:"+p.getNome());
            
        }
        entityManager.getTransaction().commit();
        entityManager.close();
    }
    
}
