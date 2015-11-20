package com.example.controller;

import com.example.controller.Database;
import static com.example.controller.Database.updateUser;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import dao.Users;
import dao.UsersDao;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.bind.annotation.ModelAttribute;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.appengine.api.datastore.Blob;

import dao.MyImage;
import javax.persistence.EntityManager;

@Controller
public class PartyChefController {

    @RequestMapping("/")
    public String home() {
        return "index";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/Error")
    public String Error() {
        return "Error";
    }

    @RequestMapping("/EmailSend")
    public String EmailSend() {
        return "EmailSend";
    }

    @RequestMapping("/signUp")
    public String signUp() {
        return "signUp";
    }

    @RequestMapping("/Home")
    public String Home() {
        return "Home";
    }

    @RequestMapping("/about")
    public String about() {
        return "about";
    }

    @RequestMapping("/index")
    public String index() {
        return "index";
    }

    @RequestMapping("/profile")
    public String profile() {
        return "profile";
    }

    @RequestMapping("/images")
    public String images() {
        return "images";
    }

    @RequestMapping("/profileUpdate")
    public String profileMethod(HttpSession session, @RequestParam Map<String, String> reqPar) throws ClassNotFoundException, SQLException {
        String uesrname = (String) session.getAttribute("username");
        String city = reqPar.get("city");
        String name = reqPar.get("name");
        String country = reqPar.get("country");
        String cuisine = reqPar.get("cuisine");
        String zip = reqPar.get("zip");
        String phone = reqPar.get("phone");
        String email = reqPar.get("email");
        String state = reqPar.get("state");
        Users user = new Users();
        // Users u.get
        user.setUsername(uesrname);
        user.setCity(city);
        user.setCountry(country);
        user.setCuisine(cuisine);
        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setState(state);
        updateUser(user);

        return "profile";
    }

    @RequestMapping("/doUpload")
    public String doUpload(HttpServletRequest req) throws FileUploadException, IOException, ClassNotFoundException, SQLException {
        // Get the image representation

        // Get the image representation
        ServletFileUpload upload = new ServletFileUpload();
        FileItemIterator iter = upload.getItemIterator(req);
        FileItemStream imageItem = iter.next();
        InputStream imgStream = imageItem.openStream();

            // construct our entity objects
        // original, but appengine does not support sun.misc.IOUtils.
        //Blob imageBlob = new Blob(IOUtils.toByteArray(imgStream));
        //Blob imageBlob = new Blob(IOUtils.readFully(imgStream, -1, true));
        com.google.appengine.api.datastore.Blob imageBlob = new com.google.appengine.api.datastore.Blob(stream2byte(imgStream));

        MyImage myImage = new MyImage(imageBlob);

        Database.insertImages(myImage);
            // persist image
        // respond to query
        System.out.println("\n\n\n\n\nI am Converting to Byte\n\n\n\n");
        return "Home";
    }

    @RequestMapping("/loginMethod")
    public String loginMethod(
            @RequestParam(required = true, value = "username") String username,
            @RequestParam(required = true, value = "password") String password, HttpSession session,
            Model model) throws ClassNotFoundException, SQLException {

        boolean exist = false;

        exist = Database.getValidUserAndPass(username, password);

        //PrintWriter out = response.getWriter();
        if (exist) {
            List<Users> UList = null;

            UList = UsersDao.getUsers();

            //HttpSession session = req.getSession();
            session.setAttribute("username", username);

            model.addAttribute("UList");
            return "Home";
            //req.setAttribute("UList", UList);
            //RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
            //rd.forward(req, response);
            //response.sendRedirect("Home.jsp");
        } else {
            model.addAttribute("msg", "username or password is invalid");
            return "login";
            //req.setAttribute("error", "username or password is invalid");
            //RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            //rd.forward(req, response);
        }

    }

    @RequestMapping("/signUpMethod")
    public String signUpMethod(@ModelAttribute("user") Users user, Model model) throws ClassNotFoundException, SQLException {

        //these two lines to check if the user and email entered are valid
        boolean existUser = Database.getValidUser(user.getUsername());
        boolean existEmail = Database.getValidEmail(user.getEmail());

        if (existUser) {

            model.addAttribute("msgUser", "username already exists");
            return "signUp";
            // req.setAttribute("error", "username already exists");
            //RequestDispatcher rd = req.getRequestDispatcher("signUp.jsp");
            // rd.forward(req, response);

        } else if (existEmail) {

            model.addAttribute("msgEmail", "email already exists");
            return "signUp";

        } else {

            Database.insertUser(user.getUsername(), user.getPassword(), user.getName(), user.getCountry(), user.getCity(), user.getState(), user.getZip(), user.getEmail(), user.getPhone(), user.getCuisine());

            return "login";
        }

    }

    @RequestMapping("/logoutMethod")
    public String logoutMethod(HttpSession session) {
        // session.removeAttribute("username");
        session.invalidate();

        return "login";
    }

    private byte[] stream2byte(InputStream is) throws IOException {

        ByteArrayOutputStream buffer = new ByteArrayOutputStream();

        int nRead;
        byte[] data = new byte[16384];

        while ((nRead = is.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }

        buffer.flush();

        return buffer.toByteArray();
    }
}
