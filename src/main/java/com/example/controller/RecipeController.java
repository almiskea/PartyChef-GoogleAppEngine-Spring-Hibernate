/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.controller;

import com.google.appengine.api.datastore.Blob;
import dao.MyImageDao;
import dao.MyImages;
import dao.Recipe;
import dao.RecipeDao;
import dao.Users;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
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
import org.apache.commons.io.FileUtils;
//import com.liferay.portal.kernel.upload.UploadPortletRequest;



/**
 *
 * @author Ali
 */

@Controller
public class RecipeController {
    
    
    @RequestMapping(value = "/uploadRecipe", method = RequestMethod.POST)
    public String saveRecipe(HttpServletRequest req, HttpServletResponse res, HttpSession session,@RequestParam Map<String, String> reqPar) throws IOException, FileUploadException, ClassNotFoundException, SQLException {

        // Get the image representation
        //UploadPortletRequest uploadRequest = PortalUtil.getUploadPortletRequest(req);
        String name = reqPar.get("meal");
        String description = reqPar.get("description");

        // construct our entity objects
        Blob imageBlob = (Blob)session.getAttribute("image");
        session.removeAttribute("image");

        // persist image
        Users us = (Users) session.getAttribute("user");
        String user = us.getUsername();
        
        RecipeDao.addRecipe(user, name, description, imageBlob);

        // respond to query
        return "profile";
    }
    @RequestMapping(value = "/uploadRecipeImage", method = RequestMethod.POST)
    public String save(HttpServletRequest req, HttpServletResponse res, HttpSession session,@RequestParam Map<String, String> reqPar) throws IOException, FileUploadException, ClassNotFoundException, SQLException {

        // Get the image representation
        //UploadPortletRequest uploadRequest = PortalUtil.getUploadPortletRequest(req);
        //String name = reqPar.get("meal");
        //String description = reqPar.get("description");
        
        ServletFileUpload upload = new ServletFileUpload();
        FileItemIterator iter = upload.getItemIterator(req);
        FileItemStream imageItem = iter.next();
        InputStream imgStream = imageItem.openStream();

        // construct our entity objects
        Blob imageBlob = new Blob(IOUtils.toByteArray(imgStream));
        
        session.setAttribute("image", imageBlob);
        // persist image
        //Users us = (Users) session.getAttribute("user");
        //String user = us.getUsername();
        
        //RecipeDao.addRecipe(user, name, description, imageBlob);

        // respond to query
        return "recipe";
    }

    @RequestMapping(value = "/serveRecipeImage", method = RequestMethod.GET)
    public void serve(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws ClassNotFoundException, SQLException, IOException {

        //int id = Integer.parseInt((String) request.getParameter("id"));
        Users us = (Users) session.getAttribute("user");
        String user = us.getUsername();
        List<Recipe> ls = RecipeDao.getRecipe(user);
        byte[] image = ls.get(0).getImage().getBytes();
        System.out.println("\n\n\n\n\n"+ls.get(0).getUsername()+"\n\n\n\n\n\n\n");
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
