/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.example.controller.Database;
import java.sql.SQLException;
import javax.persistence.EntityManager;

/**
 *
 * @author Ali
 */
public class MyImageDao {
    
    public static void addImage(MyImage image) throws ClassNotFoundException, SQLException{
        
        EntityManager em = Database.getEntityManager();
        
        em.getTransaction().begin();
        em.persist(new MyImage(image.getImage()));
        em.getTransaction().commit();
        em.close();
        
    }
}
