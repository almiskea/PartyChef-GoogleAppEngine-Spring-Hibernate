package com.example.controller;

import dao.Users;
import com.google.appengine.api.utils.SystemProperty;
import dao.UsersDao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Driver	apache_derby_net Database URL	jdbc:derby://localhost:1527/sample User
 * app
 *
 * @author almiskea
 */
public class Database {

    public static EntityManager getEntityManager() throws ClassNotFoundException, SQLException {
        EntityManagerFactory emf = null;
        Map<String, String> properties = new HashMap();

        if (SystemProperty.environment.value()
                == SystemProperty.Environment.Value.Production) {
            System.out.println("Google Production");
            properties.put("javax.persistence.jdbc.driver",
                    "com.google.appengine.api.rdbms.AppEngineDriver");
            properties.put("javax.persistence.jdbc.url",
                    System.getProperty("cloudsql.url"));
            emf = Persistence.createEntityManagerFactory(
                    "Demo1", properties);

        } else {
            System.out.println("Local Production");
            properties.put("javax.persistence.jdbc.driver",
                    "com.mysql.jdbc.Driver");
            properties.put("javax.persistence.jdbc.url",
                    System.getProperty("cloudsql.url.dev"));

            emf = Persistence.createEntityManagerFactory(
                    "Demo", properties);

        }

        return emf.createEntityManager();
    }

    
    public static void insertUser(String username, String password, String name, String country, String city, String state, String zip, String email, String phone, String cuisine) throws ClassNotFoundException, SQLException {
        UsersDao.addUser(username,  password, name, country,  city, state, zip, email, phone, cuisine);
    }

    public static boolean getValidUserAndPass(String username, String password) throws ClassNotFoundException, SQLException {

        EntityManager em = Database.getEntityManager();
        em.getTransaction().begin();
        List<Users> result = em
                .createQuery("FROM Users", Users.class)
                .getResultList();
        for (Users g : result) {

            if (g.getUsername().equals(username) && g.getPassword().equals(password)) {
                em.getTransaction().commit();
                em.close();
                return true;
            }
        }
        em.getTransaction().commit();
        em.close();
        return false;
    }

    public static boolean getValidUser(String username) throws ClassNotFoundException, SQLException {
        EntityManager em = Database.getEntityManager();
        em.getTransaction().begin();
        List<Users> result = em
                .createQuery("FROM Users", Users.class)
                .getResultList();
        for (Users g : result) {

            if (g.getUsername().equals(username) ) {
                em.getTransaction().commit();
                em.close();
                return true;
            }
        }
        em.getTransaction().commit();
        em.close();
        return false;
    }
    public static Users getEmail(String email) throws ClassNotFoundException, SQLException {
        EntityManager em = Database.getEntityManager();
        em.getTransaction().begin();
        List<Users> result = em
                .createQuery("FROM Users", Users.class)
                .getResultList();
        for (Users g : result) {

            if (g.getEmail().equals(email) ) {
                em.getTransaction().commit();
                em.close();
                return g;
            }
        }
        em.getTransaction().commit();
        em.close();
        return null;
    }

    /*public static void main(String[] args) throws ClassNotFoundException, SQLException{
     DataBaseClass.insertEmp("Ali");
     }*/
}
