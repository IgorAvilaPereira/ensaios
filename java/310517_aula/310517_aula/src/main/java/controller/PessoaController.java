package controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import model.Pessoa;

@Controller
public class PessoaController {

	private final Result result;
        private EntityManagerFactory entityManagerFactory;
        private EntityManager entityManager;

	/**
	 * @deprecated CDI eyes only
	 */
	protected PessoaController() {
		this(null);
	}
	
	@Inject
	public PessoaController(Result result) {
                String persistenceUnitName = "PU";
                this.entityManagerFactory = Persistence.createEntityManagerFactory(persistenceUnitName);
                this.entityManager = entityManagerFactory.createEntityManager();
		this.result = result;
	}

	@Path("/")
	public void index() {                
                this.entityManager.getTransaction().begin();
		result.include("vetPessoa", this.entityManager.createNamedQuery("Pessoa.findAll", Pessoa.class).getResultList());
                this.entityManager.getTransaction().commit();

	}
        
        @Get
        @Path("/pessoa/excluir/{id}")
        public void excluir(int id){
            this.entityManager.getTransaction().begin();
            Pessoa pessoa = this.entityManager.find(Pessoa.class, id);            
            this.entityManager.getTransaction().commit();
            
            this.entityManager.getTransaction().begin();
            this.entityManager.remove(pessoa);        
            this.entityManager.getTransaction().commit();
            
            result.redirectTo(this).index();
        }
}