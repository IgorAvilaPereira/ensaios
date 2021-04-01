/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apresentacao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import negocio.Endereco;
import negocio.PessoaFisica;
import negocio.PessoaJuridica;
import negocio.Usuario;
import persistencia.UsuarioJpaController;

/**
 *
 * @author iapereira
 */
public class Main {
    
    private static final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("PU");
    
    public static void main(String[] args) {
//        
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        
//        
        entityManager.getTransaction().begin();        
//        Usuario usuario = new Usuario();        
//        usuario.setNome("Igor");
//        usuario.setEmail("igor.pereira@riogrande.ifrs.edu.br");
//        usuario.setPreferencias('M');   
        Endereco e = new Endereco();
        e.setRua("Av. Pres. Vargas");
        entityManager.getTransaction().commit();  
        
        entityManager.getTransaction().begin();  
        PessoaFisica pessoaFisica = new PessoaFisica("Igor", "01763917037");
        pessoaFisica.setEndereco(e);
        entityManager.persist(pessoaFisica);          
        entityManager.getTransaction().commit();  

//        entityManager.persist(new PessoaJuridica("IFRS", "CNPJS IFRS"));
                
//        
//        
        entityManager.close();
//        
//        
//              
//        entityManager.getTransaction().begin();        
//        List<Usuario> vetUsuario = entityManager.createQuery("select u from Usuario u", Usuario.class).getResultList();
//        entityManager.getTransaction().commit();          
//        entityManager.close();
//
//        for (int i = 0; i < vetUsuario.size(); i++) {
//            Usuario u = vetUsuario.get(i);
//            System.out.println(u);
//            
//        }
//        

        UsuarioJpaController usuarioJpaController = new UsuarioJpaController(entityManagerFactory);
        List<Usuario> vetUsuario = usuarioJpaController.findUsuarioEntities();
        for (int i = 0; i < vetUsuario.size(); i++) {
            Usuario u = vetUsuario.get(i);
            System.out.println(u);
            
        }
    }
    
}
