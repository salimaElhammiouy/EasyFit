package com.club.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.club.dao.AdminDAO;
import com.club.dao.ImplementeAdminDAO;



@WebServlet("/mail")
public class MailApp extends HttpServlet{

	private static final long serialVersionUID = 1L;
	AdminDAO metier;
	
	public void init() throws ServletException {	
		metier = new ImplementeAdminDAO();
		super.init();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		      throws ServletException, IOException {
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        
	        String to = request.getParameter("email");
	        String nom = request.getParameter("nom");
	        String prenom = request.getParameter("prenom");
	        int gsm = Integer.parseInt(request.getParameter("gsm"));
	        String password= nom+"30Fit";
	        
	        String subject = "Récupération du mot de passe #EASYFIT";
	        String message =  "Votre nouveau mot de passe est : "+password+" \r\nVeuillez modifier votre mot de passe dès votre première connection. \r\n #EASYFIT ";	
	        String user = "chaimae.errebiai@usmba.ac.ma";
	        String pass = "J131272178";
	        SendMail.send(to,subject, message, user, pass);
	        
	        metier.editAdherentPassword(nom, prenom, gsm, password);
	        Boolean etatt=true;
	        String alerte="Le nouveau mot de passe vous a été envoyé par email !!";
			request.setAttribute("etatt", etatt);
			request.setAttribute("alerte", alerte);
	        
	        request.getRequestDispatcher("index.jsp").forward(request,response);
	    }   

}
