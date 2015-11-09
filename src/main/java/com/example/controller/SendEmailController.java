/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.controller;

/**
 *
 * @author Ali
 */
import com.google.apphosting.api.ApiProxy;
import dao.Users;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/sendEmail.do")
public class SendEmailController {

    @Autowired
    private JavaMailSender mailSender;

    @RequestMapping(method = RequestMethod.POST)
    public String doSendEmail(HttpServletRequest request,Model model) throws ClassNotFoundException, SQLException {
        // takes input from e-mail form
        String recipientAddress = request.getParameter("email");
        String subject = "Email PartyChef";

        // prints debug info
        System.out.println("To: " + recipientAddress);

        // creates a simple e-mail object
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(recipientAddress);
        Users u = Database.getEmail(recipientAddress);
        if (u != null) {
            email.setFrom("none-reply@PartyChef.com");
            email.setSubject(subject);
            email.setText("PartyChef to : "+u.getName()+"\n\nUsername : "+u.getUsername()+"\n\n"+"Password : "+u.getPassword()+"\n\nBest regards,\nPartyChef team\n");
            // sends the e-mail
            /*com.google.apphosting.api.ApiProxy.Environment env = ApiProxy.getCurrentEnvironment();

            env.getAttributes().put("com.google.apphosting.api.ApiProxy.api_deadline_key", 9999 );*/
            mailSender.send(email);
            
            return "login";
        }

        // forwards to the view named "Result"
        model.addAttribute("error", "Email is invalid");
        return "EmailSend";
    }
}
