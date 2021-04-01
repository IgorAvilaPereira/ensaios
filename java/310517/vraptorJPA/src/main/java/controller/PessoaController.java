package controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import model.Pessoa;

@Controller
public class PessoaController {

	private final Result result;
        private EntityManager entityManager;
        private EntityManagerFactory entityManagerFactory;
           

	/**
	 * @deprecated CDI eyes only
	 */
	protected PessoaController() {
		this(null);
	}
	
	@Inject
	public PessoaController(Result result) {
                String persistenceUnitName = "PU";
                this.entityManagerFactory =  Persistence.createEntityManagerFactory(persistenceUnitName);
                this.entityManager = entityManagerFactory.createEntityManager();
		this.result = result;
	}

	@Path("/")
	public void index() {                
		result.include("vetPessoa", entityManager.createNamedQuery("Pessoa.findAll", Pessoa.class).getResultList());
	}
}