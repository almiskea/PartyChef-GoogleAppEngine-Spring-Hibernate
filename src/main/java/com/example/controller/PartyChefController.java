package com.example.controller;

import static com.example.controller.Database.updateUser;

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
    @RequestMapping("/recipe")
    public String recipe() {
        return "recipe";
    }

    @RequestMapping("/profileUpdate")
    public String profileMethod(HttpSession session, @RequestParam Map<String, String> reqPar) throws ClassNotFoundException, SQLException {
        Users user = (Users) session.getAttribute("user");
        String username = user.getUsername();
        session.getAttribute("user");
        String city = reqPar.get("city");
        String name = reqPar.get("name");
        System.out.print("\n\n\n\n\n\n\n\n\n\n" + name + "\n\n\n\n\n\n\n\n");
        if(username.length() == 0){
            return "Home";
        }
        String country = reqPar.get("country");
        String cuisine = reqPar.get("cuisine");
        String zip = reqPar.get("zip");
        String phone = reqPar.get("phone");
        String email = reqPar.get("email");
        String state = reqPar.get("state");
        
        // Users u.get
        /*if (username.length() != 0) {
            user.setUsername(username);
        }*/
        if (city.length() != 0) {
            user.setCity(city);
        }
        if (country.length() != 0) {
            user.setCountry(country);
        }
        if (cuisine.length() != 0) {
            user.setCuisine(cuisine);
        }
        if (name.length() != 0) {
            user.setName(name);
        }
        /*if (email.length() != 0) {
            user.setEmail(email);
        }
        if (phone.length() != 0) {
            user.setPhone(phone);
        }*/
        if (state.length() != 0) {
            user.setState(state);
        }

        updateUser(user);

        return "profile";
    }

    @RequestMapping("/loginMethod")
    public String loginMethod(
            @RequestParam(required = true, value = "username") String username,
            @RequestParam(required = true, value = "password") String password, HttpSession session,
            Model model) throws ClassNotFoundException, SQLException {

        Users exist = null;

        exist = Database.getValidUserAndPass(username, password);

        //PrintWriter out = response.getWriter();
        if (exist != null) {
            List<Users> UList = null;

            UList = UsersDao.getUsers();

            //HttpSession session = req.getSession();
            session.setAttribute("user", exist);
            session.setAttribute("UList", UList);
            
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

            UsersDao.addUser(user.getUsername(), user.getPassword(), user.getName(), user.getCountry(), user.getCity(), user.getState(), user.getZip(), user.getEmail(), user.getPhone(), user.getCuisine());

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
