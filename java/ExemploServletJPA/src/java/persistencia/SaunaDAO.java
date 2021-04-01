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
        if (sauna.getGarotas() == null) {
            sauna.setGarotas(new ArrayList<Garota>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Collection<Garota> attachedGarotas = new ArrayList<Garota>();
            for (Garota garotasGarotaToAttach : sauna.getGarotas()) {
                garotasGarotaToAttach = em.getReference(garotasGarotaToAttach.getClass(), garotasGarotaToAttach.getId());
                attachedGarotas.add(garotasGarotaToAttach);
            }
            sauna.setGarotas(attachedGarotas);
            em.persist(sauna);
            for (Garota garotasGarota : sauna.getGarotas()) {
                Sauna oldSaunaOfGarotasGarota = garotasGarota.getSauna();
                garotasGarota.setSauna(sauna);
                garotasGarota = em.merge(garotasGarota);
                if (oldSaunaOfGarotasGarota != null) {
                    oldSaunaOfGarotasGarota.getGarotas().remove(garotasGarota);
                    oldSaunaOfGarotasGarota = em.merge(oldSaunaOfGarotasGarota);
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
            Collection<Garota> garotasOld = persistentSauna.getGarotas();
            Collection<Garota> garotasNew = sauna.getGarotas();
            Collection<Garota> attachedGarotasNew = new ArrayList<Garota>();
            for (Garota garotasNewGarotaToAttach : garotasNew) {
                garotasNewGarotaToAttach = em.getReference(garotasNewGarotaToAttach.getClass(), garotasNewGarotaToAttach.getId());
                attachedGarotasNew.add(garotasNewGarotaToAttach);
            }
            garotasNew = attachedGarotasNew;
            sauna.setGarotas(garotasNew);
            sauna = em.merge(sauna);
            for (Garota garotasOldGarota : garotasOld) {
                if (!garotasNew.contains(garotasOldGarota)) {
                    garotasOldGarota.setSauna(null);
                    garotasOldGarota = em.merge(garotasOldGarota);
                }
            }
            for (Garota garotasNewGarota : garotasNew) {
                if (!garotasOld.contains(garotasNewGarota)) {
                    Sauna oldSaunaOfGarotasNewGarota = garotasNewGarota.getSauna();
                    garotasNewGarota.setSauna(sauna);
                    garotasNewGarota = em.merge(garotasNewGarota);
                    if (oldSaunaOfGarotasNewGarota != null && !oldSaunaOfGarotasNewGarota.equals(sauna)) {
                        oldSaunaOfGarotasNewGarota.getGarotas().remove(garotasNewGarota);
                        oldSaunaOfGarotasNewGarota = em.merge(oldSaunaOfGarotasNewGarota);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = sauna.getId();
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

    public void destroy(int id) throws NonexistentEntityException {
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
            Collection<Garota> garotas = sauna.getGarotas();
            for (Garota garotasGarota : garotas) {
                garotasGarota.setSauna(null);
                garotasGarota = em.merge(garotasGarota);
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

    public Sauna findSauna(int id) {
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
