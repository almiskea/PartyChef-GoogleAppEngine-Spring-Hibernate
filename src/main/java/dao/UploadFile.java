package dao;
 
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
 
@Entity
@Table(name = "FILES_UPLOAD")
public class UploadFile {
    private long id;
    private String fileName;
    private byte[] data;

    public UploadFile(String fileName, long id, byte[] data) {
        this.fileName = fileName;
        this.id = id;
        this.data = data;
    }

    public UploadFile() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
 
    @Id
    @GeneratedValue
    @Column(name = "FILE_ID")
    public long getId() {
        return id;
    }
 
    public void setId(long id) {
        this.id = id;
    }
 
    @Column(name = "FILE_NAME")
    public String getFileName() {
        return fileName;
    }
 
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
 
    @Column(name = "FILE_DATA")
    public byte[] getData() {
        return data;
    }
 
    public void setData(byte[] data) {
        this.data = data;
    }
}