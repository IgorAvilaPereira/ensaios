/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import modelo.Garota;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import modelo.Sauna;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author iapereira
 */
public class SaunaDAO implements Serializable {

    public SaunaDAO(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Sauna sauna) {
        if (sauna.getGarotaCollection() == null) {
            sauna.setGarotaCollection(new ArrayList<Garota>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Collection<Garota> attachedGarotaCollection = new ArrayList<Garota>();
            for (Garota garotaCollectionGarotaToAttach : sauna.getGarotaCollection()) {
                garotaCollectionGarotaToAttach = em.getReference(garotaCollectionGarotaToAttach.getClass(), garotaCollectionGarotaToAttach.getId());
                attachedGarotaCollection.add(garotaCollectionGarotaToAttach);
            }
            sauna.setGarotaCollection(attachedGarotaCollection);
            em.persist(sauna);
            for (Garota garotaCollectionGarota : sauna.getGarotaCollection()) {
                Sauna oldSaunaIdOfGarotaCollectionGarota = garotaCollectionGarota.getSaunaId();
                garotaCollectionGarota.setSaunaId(sauna);
                garotaCollectionGarota = em.merge(garotaCollectionGarota);
                if (oldSaunaIdOfGarotaCollectionGarota != null) {
                    oldSaunaIdOfGarotaCollectionGarota.getGarotaCollection().remove(garotaCollectionGarota);
                    oldSaunaIdOfGarotaCollectionGarota = em.merge(oldSaunaIdOfGarotaCollectionGarota);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Sauna sauna) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Sauna persistentSauna = em.find(Sauna.class, sauna.getId());
            Collection<Garota> garotaCollectionOld = persistentSauna.getGarotaCollection();
            Collection<Garota> garotaCollectionNew = sauna.getGarotaCollection();
            Collection<Garota> attachedGarotaCollectionNew = new ArrayList<Garota>();
            for (Garota garotaCollectionNewGarotaToAttach : garotaCollectionNew) {
                garotaCollectionNewGarotaToAttach = em.getReference(garotaCollectionNewGarotaToAttach.getClass(), garotaCollectionNewGarotaToAttach.getId());
                attachedGarotaCollectionNew.add(garotaCollectionNewGarotaToAttach);
            }
            garotaCollectionNew = attachedGarotaCollectionNew;
            sauna.setGarotaCollection(garotaCollectionNew);
            sauna = em.merge(sauna);
            for (Garota garotaCollectionOldGarota : garotaCollectionOld) {
                if (!garotaCollectionNew.contains(garotaCollectionOldGarota)) {
                    garotaCollectionOldGarota.setSaunaId(null);
                    garotaCollectionOldGarota = em.merge(garotaCollectionOldGarota);
                }
            }
            for (Garota garotaCollectionNewGarota : garotaCollectionNew) {
                if (!garotaCollectionOld.contains(garotaCollectionNewGarota)) {
                    Sauna oldSaunaIdOfGarotaCollectionNewGarota = garotaCollectionNewGarota.getSaunaId();
                    garotaCollectionNewGarota.setSaunaId(sauna);
                    garotaCollectionNewGarota = em.merge(garotaCollectionNewGarota);
                    if (oldSaunaIdOfGarotaCollectionNewGarota != null && !oldSaunaIdOfGarotaCollectionNewGarota.equals(sauna)) {
                        oldSaunaIdOfGarotaCollectionNewGarota.getGarotaCollection().remove(garotaCollectionNewGarota);
                        oldSaunaIdOfGarotaCollectionNewGarota = em.merge(oldSaunaIdOfGarotaCollectionNewGarota);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = sauna.getId();
                if (findSauna(id) == null) {
                    throw new NonexistentEntityException("The sauna with id " + id + " no longer exists.");
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
            Sauna sauna;
            try {
                sauna = em.getReference(Sauna.class, id);
                sauna.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The sauna with id " + id + " no longer exists.", enfe);
            }
            Collection<Garota> garotaCollection = sauna.getGarotaCollection();
            for (Garota garotaCollectionGarota : garotaCollection) {
                garotaCollectionGarota.setSaunaId(null);
                garotaCollectionGarota = em.merge(garotaCollectionGarota);
            }
            em.remove(sauna);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Sauna> findSaunaEntities() {
        return findSaunaEntities(true, -1, -1);
    }

    public List<Sauna> findSaunaEntities(int maxResults, int firstResult) {
        return findSaunaEntities(false, maxResults, firstResult);
    }

    private List<Sauna> findSaunaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Sauna.class));
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

    public Sauna findSauna(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Sauna.class, id);
        } finally {
            em.close();
        }
    }

    public int getSaunaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Sauna> rt = cq.from(Sauna.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
