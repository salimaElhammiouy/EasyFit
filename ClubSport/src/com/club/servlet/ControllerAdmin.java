package com.club.servlet;


import java.io.IOException;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.text.DateFormat;
import java.text.spi.DateFormatProvider;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.swing.text.DateFormatter;
import java.util.regex.Pattern;
import org.apache.taglibs.standard.tag.rt.fmt.ParseDateTag;


import com.club.dao.*;

import com.club.metie.*;




@WebServlet({"/ControllerAdmin","*.da"})
public class ControllerAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AdminDAO metier;
	AdherentinterfaceDAO metier1;
	
	  		
    public ControllerAdmin() {
        super();      
    }
    
	public void init() throws ServletException {		
		metier = new ImplementeAdminDAO();
		metier1=new AdherentImplementDAO();
	}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Boolean etat=false;
		String alerte="";
		String path=request.getServletPath();
		if(path.equals("/accueil")) {
			request.getRequestDispatcher("accueil.jsp").forward(request, response);			
		}
		
		else if(path.equals("/contacter1.da")) {
			String nom=request.getParameter("name");
			String email=request.getParameter("email");
			String subject=request.getParameter("subject");
			Subject su=metier.saveSubject(new Subject(nom,email,subject));
			request.setAttribute("subject", su);
			if( !nom.isEmpty() && !email.isEmpty() ) 
			{	etat=true;
				alerte="Votre message a bien été envoyé !!";				
			}
			else {etat=false;}
			request.setAttribute("etat", etat);
			request.setAttribute("alerte", alerte);
			request.getRequestDispatcher("accueil.jsp").forward(request, response);			
		}

		else if(path.equals("/logout.da")) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("index.jsp");	
		}
		
		else if(path.equals("/reserverPlace.da")) {
			String nomA = request.getParameter("nom");
			String prenomA = request.getParameter("prenom");
			String sexeA = request.getParameter("radio");
			String gsmA = request.getParameter("gsm");
			String emailA = request.getParameter("email");
			String pass1A = request.getParameter("password1");
			String pass2A = request.getParameter("password2");
			String motpassIncorrect = "";
			String gsmInvalide = "";
			Inscription in = new Inscription(nomA, prenomA, sexeA, gsmA, emailA, pass1A);
			if (gsmA.startsWith("06") || gsmA.startsWith("07")) {
				if (pass2A.equals(pass1A)) {
					metier.saveAdherant(in);
					int Id = in.getIdinscrir();
					String name = in.getNomA() + " " + in.getPrenomA();
					request.setAttribute("inscription", in);
					HttpSession session = request.getSession();
					session.setAttribute("sessionUtilisateur", Id);
					session.setAttribute("nomAdherent", name);
					request.getRequestDispatcher("preparerCompte.jsp").forward(request, response);
				 } else {
					motpassIncorrect = "Votre mot de passe est Incorrecte !! ";
					request.setAttribute("confirm", motpassIncorrect);
					request.setAttribute("in", in);
					request.getRequestDispatcher("reserverPlace.jsp").forward(request, response);
				}
			}	
			else {
				gsmInvalide = "Votre numéro de téléphone est erroné !";
				request.setAttribute("confirm2", gsmInvalide);
				request.setAttribute("in", in);
				request.getRequestDispatcher("reserverPlace.jsp").forward(request, response);
			}
		}
		
		else if(path.equals("/addEquipement.da")) {	//
			String nom=request.getParameter("nomma");
			String marque=request.getParameter("marque");
			Date date_installe=Date.valueOf(request.getParameter("installe") );
			Equipement eq=metier.ajouterEquip(new Equipement(nom,marque,date_installe));			
			request.setAttribute("equipements", eq);
			if( !nom.isEmpty() && !marque.isEmpty() ) 
				{	etat=true;
					alerte="La machine est ajoutée avec succès !!";				
				}
			else {etat=false;}
			request.setAttribute("etat", etat);
			request.setAttribute("alerte", alerte);
			request.getRequestDispatcher("addEquipement.jsp").forward(request, response);		
		}
		
		else if(path.equals("/suppEquipement.da")) {
			int id= Integer.parseInt(request.getParameter("id"));
			metier.deleteEquipement(id);
			if( id!=0 ) 
			{	etat=true;
				alerte="L'équipement a été supprimé !!";				
			}
			else {etat=false;}
			request.setAttribute("etat", etat);
			request.setAttribute("alerte", alerte);
			request.getRequestDispatcher("voirEquips.da").forward(request, response);	
		}
		
		else if (path.equals("/chercherEquip.da"))	{
			String motCle=request.getParameter("motCle");
			ModelAdmin model= new ModelAdmin();
			model.setMotCle(motCle);
			List<Equipement> prods = metier.equipementsParMC(motCle);
			model.setEquips(prods);
			int a=01;
			request.setAttribute("a", a);
			request.setAttribute("modele", model);
			request.getRequestDispatcher("listes.jsp").forward(request,response);
		}
		
		else if(path.equals("/ajouterActivite.da")) {
	    	String file=request.getParameter("file");
	    	String file2="images/"+file;
	    	String nom=request.getParameter("nom");
	    	String categorie=request.getParameter("categorie");
	    	String niveau=request.getParameter("niveau");
	    	int duree=Integer.parseInt(request.getParameter("duree"));
	    	String description=request.getParameter("description");
	    	int calories=Integer.parseInt(request.getParameter("calori"));
	    	double prix = Double.parseDouble(request.getParameter("prix"));
	    	Activite activite= metier.ajouterActivite(new Activite(nom,categorie,description,duree,niveau,calories,prix),new Images(file2) );	    	
	    	request.setAttribute("activites", activite);
	    	if( !nom.isEmpty() && !description.isEmpty() ) 
			{	etat=true;
				alerte="L'activité est ajoutée avec succès !!";				
			}
			else {etat=false;}
			request.setAttribute("etat", etat);
			request.setAttribute("alerte", alerte);
	    	request.getRequestDispatcher("addActivite.jsp").forward(request, response);
	    }
		
		else if(path.equals("/deleteActivity.da")) {
			int id= Integer.parseInt(request.getParameter("id"));
			String nom=request.getParameter("noma");
			metier.deleteActivite(id);
			if( id!=0 ) 
			{	etat=true;
				alerte="L'activité "+nom+" a été supprimée !!";				
			}
			else {etat=false;}
			request.setAttribute("etat", etat);
			request.setAttribute("alerte", alerte);
			request.getRequestDispatcher("voirActivs.da").forward(request, response);
		}
		
		else if (path.equals("/editImage1.da") )		{
			int id= Integer.parseInt(request.getParameter("id"));
			Images im=metier.getImage(id);			
			request.setAttribute("image", im);		
			request.getRequestDispatcher("modifierImageActi.jsp").forward(request,response);
		}
		
		else if (path.equals("/editImage2.da") )		{
			String file=request.getParameter("file");
	    	String file2="images/"+file;
	    	int idimg=Integer.parseInt(request.getParameter("idd"));
	    	metier.updateImage(new Images(idimg,file2));	
	    	if( !file.isEmpty() ) 
			{	etat=true;
				alerte="L'image de l'activité a été modifiée !!";				
			}
			else {etat=false;}
			request.setAttribute("etat", etat);
			request.setAttribute("alerte", alerte);
			request.getRequestDispatcher("modifierImageActi.jsp").forward(request,response);
		}
		
		else if (path.equals("/editActivity.da") )		{
			int id= Integer.parseInt(request.getParameter("id"));
			Activite a= metier.getActivite(id);			
			request.setAttribute("activite", a);
			request.getRequestDispatcher("modifierActivite.jsp").forward(request,response);
		}
		
		else if (path.equals("/editActivity1.da") )	{		
	    	String nom=request.getParameter("nom");
	    	String niveau=request.getParameter("niveau");
	    	String categ=request.getParameter("categorie");
	    	int duree=Integer.parseInt(request.getParameter("duree"));
	    	String description=request.getParameter("description");
	    	int calories=Integer.parseInt(request.getParameter("calori"));
	    	double prix = Double.parseDouble(request.getParameter("prix"));
	    	String disp=request.getParameter("dispo");    	
	    	int idimg=Integer.parseInt(request.getParameter("idd"));
	    	int ida=Integer.parseInt(request.getParameter("ida"));	    		    			    	
	    	Activite activite= new Activite(ida,nom,categ,description,duree,niveau,calories,prix,disp,idimg);
	    	metier.updateActivite(activite);
		    request.setAttribute("activite", activite);
		    if( !nom.isEmpty() ) 
			{	etat=true;
				alerte="Les informations de l'activité ont été modifiées !!";				
			}
			else {etat=false;}
			request.setAttribute("etat", etat);
			request.setAttribute("alerte", alerte);
			request.getRequestDispatcher("modifierActivite.jsp").forward(request,response);
		}
		
		else if(path.equals("/addMoniteur.da")) {		
			String nom=request.getParameter("nom");
			String prenom=request.getParameter("prenom");
			String mail=request.getParameter("addresse");
			String password=request.getParameter("passe");
			String sport=request.getParameter("sel");
			int ida=metier.getIDsport(sport);
			User eq=metier.ajouterMoniteur(new User(nom,prenom,mail,password,ida));			
			request.setAttribute("equipements", eq);
			if( !nom.isEmpty() && !prenom.isEmpty() ) 
			{	etat=true;
				alerte="Le moniteur est ajoutée avec succès !!";				
			}
			else {etat=false;}
			ModelAdmin mod = new ModelAdmin();
			List<Activite> activs = metier.getAllActivities();
			mod.setActivs(activs);
			request.setAttribute("modele", mod);
			request.setAttribute("etat", etat);
			request.setAttribute("alerte", alerte);
			request.getRequestDispatcher("addMoniteur.jsp").forward(request, response);		
		}
		
		else if(path.equals("/deleteMoniteur.da")) {
			int id= Integer.parseInt(request.getParameter("id"));
			String nom=request.getParameter("nom");
			String prenom=request.getParameter("prenom");
			metier.deleteMoniteur(id);
			if(id!=0) 
			{	etat=true;
				alerte="Le moniteur "+nom+" "+prenom+" a été supprimé !!";				
			}
			else {etat=false;}
			request.setAttribute("etat", etat);
			request.setAttribute("alerte", alerte);
			request.getRequestDispatcher("voirMoniteurs.da").forward(request, response);
		}
		
		else if (path.equals("/affecterSeance.da")) {
			int id= Integer.parseInt(request.getParameter("id"));
			String noma=request.getParameter("noma");
			Seance sea =metier.getSeanceID(id);
			ModelAdmin mod=new ModelAdmin();
			List<Activite> activs = metier.ConcatNames(noma);
			mod.setActivs(activs);

			request.setAttribute("modele", mod);
			request.setAttribute("s", sea);
			request.getRequestDispatcher("affectationSeance.jsp").forward(request,response);
		}
		
		else if(path.equals("/affecterSeanceMonit.da")) {
			int ids=Integer.parseInt(request.getParameter("id"));
			String nom =request.getParameter("nom");			
			String[] parts = nom.split(Pattern.quote("."));
			String part1 = parts[0]; 
			String part2 = parts[1];			
			metier.affecterMoniteur(ids,part1,part2);
			Seance sea=metier.getInfoSeance(ids);
			String phrase="EASY-FIT vous propose une nouvelle séance de "+sea.getNom_activite()+" le "+sea.getJour()+" à : "+sea.getHoraire()+", essayez dès maintenant !";	
			metier.addNotif1(ids, phrase);//ici inserer dans notification l'ajout de la seance
			if(ids!=0) 
			{	etat=true;
				alerte="Le moniteur a été affecté à la séance avec succès !!";				
			}
			else {etat=false;}
			ModelAdmin mod = new ModelAdmin();
			List<Activite> activs = metier.getAllActivities();
			mod.setActivs(activs);
			request.setAttribute("modele", mod);
			request.setAttribute("etat", etat);
			request.setAttribute("alerte", alerte);
			request.getRequestDispatcher("addSeance.jsp").forward(request,response);
		}
		
		else if(path.equals("/addSeance.da")) {				
			String jour=request.getParameter("day");
			String time=request.getParameter("time");
			String noma=request.getParameter("sel");//nom de l'activite
			Seance sea=metier.addSeance(new Seance(jour,time));						
			int ids=sea.getId_seance();

			String url="affecterSeance.da?id="+ids+"&noma="+noma;			
			request.getRequestDispatcher(url).forward(request, response);		
		}
		
		else if(path.equals("/deleteSeance.da")) {
			int id= Integer.parseInt(request.getParameter("id"));
			String nom=request.getParameter("noma");
			metier.deleteSeance(id);
			if( id!=0 ) 
			{	etat=true;
				alerte="La séance de "+nom+" a été supprimée !!";				
			}
			else {etat=false;}
			request.setAttribute("etat", etat);
			request.setAttribute("alerte", alerte);
			request.getRequestDispatcher("voirSeance.da").forward(request, response);		
		}
		
		else if (path.equals("/ReporterSeance1.da")) {
			int id= Integer.parseInt(request.getParameter("id"));
			Seance sea=metier.getSeanceID(id);
			request.setAttribute("seance", sea);
			request.getRequestDispatcher("reporterSeance.jsp").forward(request, response);
		}
		
		else if (path.equals("/reporterSeance2.da")) {
			int ids= Integer.parseInt(request.getParameter("id"));
			String date=request.getParameter("datetime");
			metier.reporterSeance(ids, date);
			Seance sea=metier.getInfoSeance(ids);
			String phrase= "EASY-FIT vous informe que pour l'activité "+sea.getNom_activite()+" : la séance du "+sea.getJour()+" à : "+sea.getHoraire()+" a été reportée au : "+date+" \r\n excusez nous pour ce ";	
			metier.addNotif2(ids, phrase);//ici inserer dans notification l'ajout de la seance
			if( ids!=0 ) 
			{	etat=true;
				alerte="La séance a été mentionnée reportée !!";				
			}
			else {etat=false;}
			request.setAttribute("etat", etat);
			request.setAttribute("alerte", alerte);
			request.getRequestDispatcher("reporterSeance.jsp").forward(request, response);
		}	
		
		else if (path.equals("/editerArt.da") )		{
			int id= Integer.parseInt(request.getParameter("id"));
			Article p = metier.getNews(id);
			request.setAttribute("article", p);
			request.getRequestDispatcher("modifierArticle.jsp").forward(request,response);
		}
		
		else if (path.equals("/modifierArticle.da") )	{
			int id = Integer.parseInt(request.getParameter("id"));
			String titre=request.getParameter("titre");
			String contenu =request.getParameter("contenu");
			Article p = new Article();
			p.setId_n(id);
			p.setTitre_n(titre);
			p.setContenu_n(contenu);
		    metier.updateArticle(p);
		    request.setAttribute("article", p);
		    if( id!=0 ) 
			{	etat=true;
				alerte="La newsletter a bien été modifiée !!";				
			}
			else {etat=false;}
			request.setAttribute("etat", etat);
			request.setAttribute("alerte", alerte);
		    request.getRequestDispatcher("modifierArticle.jsp").forward(request,response);
		}
		
		else if(path.equals("/deleteNews.da")) {
			int id= Integer.parseInt(request.getParameter("id"));
			metier.deleteArticle(id);
			if(id!=0) 
			{	etat=true;
				alerte="La Newsletter a été supprimée !!";				
			}
			else {etat=false;}
			request.setAttribute("etat", etat);
			request.setAttribute("alerte", alerte);
			request.getRequestDispatcher("voirNews.da").forward(request, response);
		}
		
		else if(path.equals("/ajouterArticle.da")) {		
			String file=request.getParameter("file");
	    	String file2="images/"+file;
			String titre=request.getParameter("titre");
			String texte =request.getParameter("contenu");
			Article news=metier.ajouterArticle(new Article(titre,texte),new Images(file2) );	
			if( !titre.isEmpty() && !texte.isEmpty() ) 
			{	etat=true;
				alerte="La newsletter est ajoutée avec succès !!";				
			}
			else {etat=false;}
			request.setAttribute("etat", etat);
			request.setAttribute("alerte", alerte);
			request.getRequestDispatcher("addNews.jsp").forward(request, response);		
		}
		
		else if (path.equals("/chercherArticle.da"))	{
			String motCle=request.getParameter("motCle");
			ModelAdmin model= new ModelAdmin();
			model.setMotCle(motCle);
			List<Article> activs = metier.articlesParMC(motCle);
			model.setArticle(activs);
			request.setAttribute("modele", model);
			request.getRequestDispatcher("news.jsp").forward(request,response);
		}
		
		else if (path.equals("/editEmailAdmin.da")) {
			int id=Integer.parseInt(request.getParameter("id1"));
			String email1=request.getParameter("email1");
			String email=request.getParameter("verif");
			String email2=request.getParameter("email2");
			if (email1.equals(email)) {
				System.out.println(email);
				metier.modifierEmail1(id, email2);
				etat=true;
				alerte="L'adress email a bien été modifiée !!";
				request.setAttribute("etat", etat);
				request.setAttribute("alerte", alerte);
				request.getRequestDispatcher("compte1.jsp").forward(request,response);
			}
			else
				request.getRequestDispatcher("compte1.jsp").forward(request,response);				
		}
		
		else if (path.equals("/editPasswordAdmin.da")) {
			int id=Integer.parseInt(request.getParameter("id2"));
			String pass1=request.getParameter("pass1");
			String pass=request.getParameter("verifi");
			String pass2=request.getParameter("pass2");
			if (pass1.equals(pass)) {
				metier.modifierPass1(id,pass2);
				etat=true;
				alerte="Le mot de passe a bien été modifié !!";
				request.setAttribute("etat", etat);
				request.setAttribute("alerte", alerte);
				request.getRequestDispatcher("compte1.jsp").forward(request,response);
			}
			else
				request.getRequestDispatcher("compte1.jsp").forward(request,response);				
		}
		
		else if (path.equals("/voirPaie.da")){
			int x=11;
			int id=Integer.parseInt(request.getParameter("id"));
			ModelAdmin model= new ModelAdmin();
			List<Paiement> activs = metier.getPaiement(id);
			User adher=metier.getAdherent(id);
			model.setPaiement(activs);	
			request.setAttribute("modele", model);
			request.setAttribute("adherent", adher);
			request.setAttribute("x", x);
			request.getRequestDispatcher("AdhsView.jsp").forward(request,response);
		}
		else if (path.equals("/nomActivs.da")) {
			ModelAdmin mod = new ModelAdmin();
			List<Activite> activs = metier.getAllActivities();
			mod.setActivs(activs);
			request.setAttribute("modele", mod);
			request.getRequestDispatcher("addMoniteur.jsp").forward(request,response);		
		}	
		
		else if (path.equals("/nomActivsMoniteur.da")) {
			ModelAdmin mod = new ModelAdmin();
			List<Activite> activs = metier.getAllActivities();
			mod.setActivs(activs);
			request.setAttribute("modele", mod);
			request.getRequestDispatcher("addSeance.jsp").forward(request,response);		
		}	
		
		else if (path.equals("/voirEquips.da")) {
			ModelAdmin mod = new ModelAdmin();
			String mc="*";
			List<Equipement> prods = metier.getAllEquipements(mc);
			mod.setEquips(prods);
			int a=01;
			request.setAttribute("a", a);
			request.setAttribute("modele", mod);
			request.getRequestDispatcher("listes.jsp").forward(request,response);		
		}
		
		else if (path.equals("/voirActivs.da")) {
			ModelAdmin mod = new ModelAdmin();
			List<Activite> activs = metier.getAllActivities();
			mod.setActivs(activs);
			int a=02;
			request.setAttribute("a", a);
			request.setAttribute("modele", mod);
			request.getRequestDispatcher("listes.jsp").forward(request,response);		
		}
		
		else if (path.equals("/voirMoniteurs.da")) {
			ModelAdmin mod = new ModelAdmin();
			List<User> activs = metier.getAllMoniteurs();
			mod.setUser(activs);
			int a=03;
			request.setAttribute("a", a);
			request.setAttribute("modele", mod);
			request.getRequestDispatcher("listes.jsp").forward(request,response);				
		}
		else if (path.equals("/voirSeance.da")){
			ModelAdmin model= new ModelAdmin();
			List<Seance> activs = metier.getAllseances();
			model.setSeance(activs);
			int a=04;
			request.setAttribute("a", a);
			request.setAttribute("modele", model);
			request.getRequestDispatcher("listes.jsp").forward(request,response);	
		}
			
		
		else if (path.equals("/voirNews.da")) {
			ModelAdmin mod = new ModelAdmin();
			List<Article> activs = metier.getAllArticles();
			mod.setArticle(activs);
			int a=05;
			request.setAttribute("a", a);
			request.setAttribute("modele", mod);
			request.getRequestDispatcher("listes.jsp").forward(request,response);	
		}
		
		else if (path.equals("/voirMsg.da")){
			ModelAdmin model= new ModelAdmin();
			List<Subject> activs = metier.getAllMessages();
			model.setSubject(activs);
			int a=06;
			request.setAttribute("a", a);
			request.setAttribute("modele", model);
			request.getRequestDispatcher("listes.jsp").forward(request,response);	
		}
		
		
		
	}
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path=request.getServletPath();	
		if (path.equals("/login.da")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			User utilisateur = new User(nom,prenom,email,password);       
			try {
				if (metier.logging(utilisateur)==1) {
					ModelAdmin model=new ModelAdmin();
					List<User> users=metier.getAdmin(email, password);
					model.setUser(users);
					User u=users.get(0);
					HttpSession session = request.getSession();
					session.setAttribute("admin",u);					 
					response.sendRedirect("adminlogged.jsp");
                }
                else if (metier.logging(utilisateur)==2){
                    
                     int nb=0;
                	 User userA=metier.getAdherentt(email, password);
                	 int id_ad=userA.getIdu();
                	 String nomm=userA.getNom()+" "+userA.getPrenom();
                	 String emailA=userA.getEmail();
                	HttpSession session = request.getSession();
                    session.setAttribute("sessionUtilisateur",id_ad); 
                    session.setAttribute("nom", nomm);
                     session.setAttribute("emailA", emailA);
                         int comp=1; 
                         int re=0;
                     String has="";
                     if(metier1.hasNotifs(id_ad)) {
                    	 has="yes";
                    	 ModelAdmin modelNot1 = new ModelAdmin(); 
        		    	 List<Notification> not1=metier1.getNotif1(id_ad); 
        		    	 for(Notification no: not1) {
        		    		 comp++;
        		    	 }
        		    	 modelNot1.setNotification(not1);
        		    	  request.setAttribute("modelNot1", modelNot1); 
        		    	  System.out.println("not1"+comp);
        		    	  
        				  ModelAdmin modelNot2 = new ModelAdmin();
        				  List<Notification> not2=metier1.getNotif2(id_ad);
        				  for(Notification noo : not2) {
        			    		 comp++;
        			    	 }
        				  modelNot2.setNotification(not2);
        				  request.setAttribute("modelNot2",modelNot2);
        				  System.out.println("not2"+comp);
        				
                    	 
                     }else {
                    	 has="no";
                     }
                
                     int nombre=metier1.retardPaiement(id_ad);
         			if(nombre>31) {
         			         comp++;
         			         re=1;
         			       
         			}
         			  
         			 System.out.println("nombre de notif:"+comp);
                     System.out.println(has);
                   session.setAttribute("has", has);
                   session.setAttribute("re", re);
                   session.setAttribute("comp", comp);
            		String url="adherentlogged.de?id="+id_ad   ; 
                	 request.getRequestDispatcher(url).forward(request, response);
                
                }
                else if (metier.logging(utilisateur)==3){
                	HttpSession session = request.getSession();
                    session.setAttribute("email",email); 
                	response.sendRedirect("moniteurlogged.jsp");               
                } 
                else if (metier.logging(utilisateur) != 1 && metier.logging(utilisateur) != 2 && metier.logging(utilisateur) != 3 ) {
                	String message="Adresse email ou mot de passe erroné !!";
                	request.setAttribute("message", message);
                	request.setAttribute("utilisateur", utilisateur);
                	request.getRequestDispatcher("login.jsp").forward(request,response);
            	}
			
			}catch (Exception e) {
				e.printStackTrace();
			}
		}               
		
		else if (path.equals("/voirAdhs.da")) {
			ModelAdmin mod =new ModelAdmin();
			List<Inscription> adhs=metier.getAllAdh();
			mod.setAdhs(adhs);
			request.setAttribute("modele", mod);
			request.getRequestDispatcher("AdhsView.jsp").forward(request,response);
		}
			
		else if (path.equals("/voirAdh1.da")) {
			Boolean etat1=true;
			ModelAdmin mod=new ModelAdmin();
			List<User> adhs=metier.getAllAdhActivite();
			mod.setUser(adhs);
			request.setAttribute("modele", mod);
			request.setAttribute("etat1", etat1);
			request.getRequestDispatcher("AdhsView.jsp").forward(request,response);
		}
			
		else if (path.equals("/voirAdh2.da")) {
			int x=1;
			ModelAdmin mod=new ModelAdmin();
			List<User> adhs=metier.getAllAdhProgramme();
			mod.setUser(adhs);
			request.setAttribute("modele", mod);
			request.setAttribute("x", x);
			request.getRequestDispatcher("AdhsView.jsp").forward(request,response);
		}		
			

	
	
		
		
	}
}

