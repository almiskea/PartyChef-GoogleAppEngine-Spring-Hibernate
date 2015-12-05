/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.google.appengine.api.datastore.Blob;
import java.io.Serializable;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

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
public class MyImages implements Serializable {
    private static final long serialVersionUID =1L ;
    
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Id
    private int id;

    Blob image;

    public MyImages() { }
    public MyImages( Blob image) {
        this.image = image;
    }


    public Blob getImage()              { return image; }
    public void setImage(Blob image)    { this.image = image; }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
