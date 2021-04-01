/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import modelo.Garota;
import modelo.Sauna;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author iapereira
 */
public class GarotaDAO implements Serializable {

    public GarotaDAO(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Garota garota) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Sauna saunaId = garota.getSaunaId();
            if (saunaId != null) {
                saunaId = em.getReference(saunaId.getClass(), saunaId.getId());
                garota.setSaunaId(saunaId);
            }
            em.persist(garota);
            if (saunaId != null) {
                saunaId.getGarotaCollection().add(garota);
                saunaId = em.merge(saunaId);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Garota garota) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Garota persistentGarota = em.find(Garota.class, garota.getId());
            Sauna saunaIdOld = persistentGarota.getSaunaId();
            Sauna saunaIdNew = garota.getSaunaId();
            if (saunaIdNew != null) {
                saunaIdNew = em.getReference(saunaIdNew.getClass(), saunaIdNew.getId());
                garota.setSaunaId(saunaIdNew);
            }
            garota = em.merge(garota);
            if (saunaIdOld != null && !saunaIdOld.equals(saunaIdNew)) {
                saunaIdOld.getGarotaCollection().remove(garota);
                saunaIdOld = em.merge(saunaIdOld);
            }
            if (saunaIdNew != null && !saunaIdNew.equals(saunaIdOld)) {
                saunaIdNew.getGarotaCollection().add(garota);
                saunaIdNew = em.merge(saunaIdNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = garota.getId();
                if (findGarota(id) == null) {
                    throw new NonexistentEntityException("The garota with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Garota garota;
            try {
                garota = em.getReference(Garota.class, id);
                garota.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The garota with id " + id + " no longer exists.", enfe);
            }
            Sauna saunaId = garota.getSaunaId();
            if (saunaId != null) {
                saunaId.getGarotaCollection().remove(garota);
                saunaId = em.merge(saunaId);
            }
            em.remove(garota);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Garota> findGarotaEntities() {
        return findGarotaEntities(true, -1, -1);
    }

    public List<Garota> findGarotaEntities(int maxResults, int firstResult) {
        return findGarotaEntities(false, maxResults, firstResult);
    }

    private List<Garota> findGarotaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Garota.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Garota findGarota(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Garota.class, id);
        } finally {
            em.close();
        }
    }

    public int getGarotaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Garota> rt = cq.from(Garota.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
