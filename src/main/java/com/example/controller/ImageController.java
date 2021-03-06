/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.controller;

import com.google.appengine.api.datastore.Blob;
import dao.MyImageDao;
import dao.MyImages;
import dao.Users;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Ali
 */
@Controller
public class ImageController {

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String save(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws IOException, FileUploadException, ClassNotFoundException, SQLException {

        // Get the image representation
        ServletFileUpload upload = new ServletFileUpload();
        FileItemIterator iter = upload.getItemIterator(req);
        FileItemStream imageItem = iter.next();
        InputStream imgStream = imageItem.openStream();

        // construct our entity objects
        Blob imageBlob = new Blob(IOUtils.toByteArray(imgStream));
        MyImages myImage = new MyImages(imageBlob);

        // persist image
        Users us = (Users) session.getAttribute("user");
        String user = us.getUsername();
        if (MyImageDao.getImage(user) != null) {
            MyImageDao.updateImage(user, imageBlob);
            return "profile";
        } else {
            MyImageDao.addImage(user, myImage);
        }
        // respond to query
        return "Home";
    }

    @RequestMapping(value = "/serve", method = RequestMethod.GET)
    public void serve(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws ClassNotFoundException, SQLException, IOException {

        //int id = Integer.parseInt((String) request.getParameter("id"));
        Users us = (Users) session.getAttribute("user");
        String user = us.getUsername();

        byte[] image = MyImageDao.getImage(user).getImage().getBytes();
        ByteArrayInputStream bis = new ByteArrayInputStream(image);
        InputStream input = bis;
        OutputStream o = response.getOutputStream();
        response.setContentType("image/jpeg");
        o.write(image);
        o.flush();
        o.close();
       //  model.addAttribute("lenImg", MyImageDao.getImage(1).toString());

    }
}
