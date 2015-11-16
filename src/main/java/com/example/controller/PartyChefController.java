package com.example.controller;

import com.example.controller.Database;
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
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.ModelAttribute;

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

        } else if (existEmail){

            model.addAttribute("msgEmail", "email already exists");
            return "signUp";
            
        }else {

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
}
