package apresentacao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import negocio.PessoaFisica;
import negocio.PessoaJuridica;

/**
 *
 * @author iapereira
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("TesteJPAHerancaPU");
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        PessoaFisica fisica = new PessoaFisica();
        PessoaJuridica juridica = new PessoaJuridica();


        
        // Exemplo Inserir
        entityManager.getTransaction().begin();
        fisica.setCpf("01763917037");
        fisica.setNome("Igor Pereira");
        entityManager.persist(fisica);
        entityManager.getTransaction().commit();        
        
        
        entityManager.getTransaction().begin();
        juridica.setCnpj("01763917037");
        juridica.setNome("Igor Pereira LTDA");
        entityManager.persist(juridica);
        entityManager.getTransaction().commit();  
       
        
        // Exemplo Obter
        entityManager.getTransaction().begin();
        PessoaFisica fisica2 = entityManager.find(PessoaFisica.class, 2);
        System.out.println("Nome:"+fisica2.getNome());
        System.out.println("Cpf:"+fisica2.getCpf());        
        entityManager.getTransaction().commit();      
        
        
        // Exemplo editar
        entityManager.getTransaction().begin();
        PessoaFisica fisica3 = entityManager.find(PessoaFisica.class, 2);
        fisica3.setNome("Igor Avila Pereira");        
        entityManager.merge(fisica3);
        entityManager.getTransaction().commit();        
        
        
        entityManager.getTransaction().begin();
        List<PessoaFisica> vet = entityManager.createQuery("Select p from PessoaFisica p").getResultList();
        for (int i = 0; i < vet.size(); i++) {
            PessoaFisica p = vet.get(i);
            System.out.println("P:"+p.getNome());            
        }
        fisica3.setNome("Igor Avila Pereira");        
        entityManager.merge(fisica3);
        entityManager.getTransaction().commit(); 
        
        
        
        entityManager.close();
        
        
        
    }
    
}
