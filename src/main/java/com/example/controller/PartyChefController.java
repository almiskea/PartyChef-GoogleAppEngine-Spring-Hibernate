package com.example.controller;

import static com.example.controller.Database.updateUser;
import com.google.appengine.api.datastore.Blob;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.Users;
import dao.UsersDao;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
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

import dao.MyImages;
import dao.MyImageDao;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.OutputStream;
import javax.persistence.EntityManager;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.annotation.RequestMethod;

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

    @RequestMapping("/displayImage")
    public String displayImage() {
        return "displayImage";
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

    /*@RequestMapping(value = "/display", method = RequestMethod.GET)
    public void display(HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {

        byte[] image = MyImageDao.getImage(6).getBytes();
        ByteArrayInputStream bis = new ByteArrayInputStream(image);
        InputStream input = bis;
        OutputStream o = response.getOutputStream();
        response.setContentType("image/jpeg");
        o.write(image);
        o.flush();
        o.close();
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String save(HttpServletRequest req, HttpServletResponse res) throws IOException, FileUploadException, ClassNotFoundException, SQLException {

        // Get the image representation
        ServletFileUpload upload = new ServletFileUpload();
        FileItemIterator iter = upload.getItemIterator(req);
        FileItemStream imageItem = iter.next();
        InputStream imgStream = imageItem.openStream();

        // construct our entity objects
        Blob imageBlob = new Blob(IOUtils.toByteArray(imgStream));
        MyImage myImage = new MyImage(imageBlob);

        // persist image
        MyImageDao.addImage(myImage);

        return "displayImage";
    }*/

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
            //System.out.print("\n\n\n\n"+MyImageDao.getImage(8).toString()+"\n\n\n\n\n\n");
            
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
