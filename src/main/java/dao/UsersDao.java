/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import com.example.controller.Database;
import com.google.appengine.api.utils.SystemProperty;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author almiskea
 */
public class UsersDao {

    
    
    public static void addUser(String username, String password,String name,String country, String city,String state,String zip,String email,String phone, String cuisine) throws ClassNotFoundException, SQLException{
        
        EntityManager em = Database.getEntityManager();
        
        em.getTransaction().begin();
        em.persist(new Users( username,  password, name, country,  city, state, zip, email, phone, cuisine));
        em.getTransaction().commit();
        em.close();
        
    }

    public static List<Users> getUsers() throws SQLException, ClassNotFoundException {
            
        EntityManager em = Database.getEntityManager();
        em.getTransaction().begin();
        List<Users> usersList = em
                .createQuery("FROM Users", Users.class)
                .getResultList();
        
        em.getTransaction().commit();
        em.close();

        return usersList;

    }
    public static Users getUser(String username) throws ClassNotFoundException, SQLException{
            
        return Database.getUsername(username);

    }

}
