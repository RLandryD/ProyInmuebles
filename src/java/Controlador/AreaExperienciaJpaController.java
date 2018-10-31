/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Controlador.exceptions.NonexistentEntityException;
import Modelo.AreaExperiencia;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

/**
 *
 * @author win 10
 */
public class AreaExperienciaJpaController implements Serializable {

    public AreaExperienciaJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(AreaExperiencia areaExperiencia) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(areaExperiencia);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(AreaExperiencia areaExperiencia) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            areaExperiencia = em.merge(areaExperiencia);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = areaExperiencia.getId();
                if (findAreaExperiencia(id) == null) {
                    throw new NonexistentEntityException("The areaExperiencia with id " + id + " no longer exists.");
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
            AreaExperiencia areaExperiencia;
            try {
                areaExperiencia = em.getReference(AreaExperiencia.class, id);
                areaExperiencia.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The areaExperiencia with id " + id + " no longer exists.", enfe);
            }
            em.remove(areaExperiencia);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<AreaExperiencia> findAreaExperienciaEntities() {
        return findAreaExperienciaEntities(true, -1, -1);
    }

    public List<AreaExperiencia> findAreaExperienciaEntities(int maxResults, int firstResult) {
        return findAreaExperienciaEntities(false, maxResults, firstResult);
    }

    private List<AreaExperiencia> findAreaExperienciaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(AreaExperiencia.class));
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

    public AreaExperiencia findAreaExperiencia(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(AreaExperiencia.class, id);
        } finally {
            em.close();
        }
    }

    public int getAreaExperienciaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<AreaExperiencia> rt = cq.from(AreaExperiencia.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
