/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.example.controller.Database;
import com.google.appengine.api.datastore.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author Ali
 */
public class RecipeDao {

    public static void addRecipe(String username, String name, String description, Blob image) throws ClassNotFoundException, SQLException {

        EntityManager em = Database.getEntityManager();

        em.getTransaction().begin();
        System.out.println("\n\n\n\n\n recipe presist \n\n\n\n\n\n");
        em.persist(new Recipe(username, name, description, image));
        em.getTransaction().commit();
        em.close();
    }

    public static List<Recipe> getRecipe(String user) throws ClassNotFoundException, SQLException {
        List<Recipe> myList = new ArrayList<Recipe>();
        
        EntityManager em = Database.getEntityManager();
        em.getTransaction().begin();
        List<Recipe> result = em
                .createQuery("FROM Recipe", Recipe.class)
                .getResultList();
        for (Recipe g : result) {
            //System.out.println("\n\n\n\n\n"+g.getUsername()+"\n\n\n\n\n\n");
            if (g.getUsername().equals(user) == true) {
                //System.out.println("\n\n\n\n\n"+g.getUsername()+"\n\n\n\n\n\n");
                myList.add(g);
             
            }
        }
        em.getTransaction().commit();
        em.close();
        return myList;

    }
}
