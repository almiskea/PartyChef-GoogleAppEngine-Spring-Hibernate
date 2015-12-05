/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.example.controller.Database;
import com.google.appengine.api.datastore.Blob;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import javax.persistence.EntityManager;

/**
 *
 * @author Ali
 */
public class MyImageDao implements Serializable{
    
    public static void addImage(MyImages image) throws ClassNotFoundException, SQLException{
        
        EntityManager em = Database.getEntityManager();
        
        em.getTransaction().begin();
        em.persist(new MyImages(image.getImage()));
        em.getTransaction().commit();
        em.close();  
    }
    
    public static MyImages getImage(int id) throws ClassNotFoundException, SQLException {
        EntityManager em = Database.getEntityManager();
        em.getTransaction().begin();
        List<MyImages> result = em
                .createQuery("FROM MyImages", MyImages.class)
                .getResultList();
        for (MyImages g : result) {

            if (g.getId() == id) {
                em.getTransaction().commit();
                em.close();
                return g;
            }
        }
        em.getTransaction().commit();
        em.close();
        return null;
    }
}
