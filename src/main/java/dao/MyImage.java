/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.Serializable;
import java.sql.Blob;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Ali
 */
@Entity
@Table(name = "MyImage")
public class MyImage implements Serializable{

    @Id
    @GeneratedValue
    private int id;

    private com.google.appengine.api.datastore.Blob image;

    public MyImage() {
    }
    /*public MyImage(String name, Blob image) {
     this.name = name; 
     this.image = image;
     }*/

    public MyImage(com.google.appengine.api.datastore.Blob imageBlob) {

        this.image = imageBlob;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // JPA getters and setters and empty contructor
    // ...
    public com.google.appengine.api.datastore.Blob getImage() {
        return image;
    }

    public void setImage(com.google.appengine.api.datastore.Blob image) {
        this.image = image;
    }
}
