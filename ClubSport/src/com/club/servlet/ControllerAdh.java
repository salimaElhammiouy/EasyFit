package com.club.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.club.dao.AdherentImplementDAO;
import com.club.dao.AdherentinterfaceDAO;
import com.club.dao.ClubDaoImpl;
import com.club.dao.InterClub;
import com.club.metie.*;

/**
 * Servlet implementation class ControllerAdh
 */
@WebServlet (name="c3",urlPatterns= {"/controleur3","*.de"})
public class ControllerAdh extends HttpServlet {
	private static final long serialVersionUID = 1L;
       AdherentinterfaceDAO metier;
       InterClub metier1;
       
       
	public ControllerAdh() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void init() throws ServletException {
		metier1 = new ClubDaoImpl();
		metier= new AdherentImplementDAO();
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path=request.getServletPath();
		
		if(path.equals("/planningAct.de")) {
			int id=Integer.parseInt(request.getParameter("id_ad"));
			boolean etat= false;
			String image="";
			String gender=metier.testerSexe(id);
			ModelAdmin model=new ModelAdmin();
			List<Activite> activites=metier.afficherActivité(id);
		
			
	if(activites != null && !activites.isEmpty()) {
				etat=true;
				model.setActivs(activites);
			    request.setAttribute("model", model);
			}
			else {  
				      if(gender.equals("femme")) {
				    	  etat= false;
				            image="images/activiteVide.png";
				                          
				      }else  {
				    	  etat= false;
				           image="images/programmeVide.png";
					     
				          
				      
				      }
			}
	ModelAdmin modelN=new ModelAdmin();
		List<Article> art=metier.afficherNews();
		modelN.setArticle(art);
		request.setAttribute("modelN", modelN);
	      request.setAttribute("image", image); 
			request.setAttribute("etat", etat);
			request.getRequestDispatcher("planActivite.jsp").forward(request, response);
			
			
		}else if(path.equals("/planningPro.de")) {
			int id=Integer.parseInt(request.getParameter("id_ad"));
			boolean etat= false;
			String image="";
			String gender=metier.testerSexe(id);
			ModelAdmin model=new ModelAdmin();
			List<Programme> programme=metier.afficherProgramme(id);
		
			
	if(programme != null && !programme.isEmpty()) {
				etat=true;
				model.setProgramme(programme);
			    request.setAttribute("model", model);
			}
			else {  
				      if(gender.equals("femme")) {
				    	  etat= false;
				            image="images/activiteVide.png";
				                          
				      }else  {
				    	  etat= false;
				           image="images/programmeVide.png";
					     
				          
				      
				      }
			}
	        request.setAttribute("image", image); 
			request.setAttribute("etat", etat);
			ModelAdmin modelN=new ModelAdmin();
			List<Article> art=metier.afficherNews();
			modelN.setArticle(art);
			request.setAttribute("modelN", modelN);
			request.getRequestDispatcher("planProgramme.jsp").forward(request, response);
		}
		
		else if(path.equals("/paiementEnLigne.de")) {
			int id=Integer.parseInt(request.getParameter("id_ad"));
			boolean etat= false;
		     String mois="";
			String img="";
			int nombre=metier.retardPaiement(id);
			if(nombre<=31) {
				etat=false;
			     img="images/facturePayer.png";
			     Date d=metier.lastPaiement(id);
				
				request.setAttribute("date", d);
			}
			else if(nombre>31) {
				ModelAdmin model= new ModelAdmin();
				List<Paiement> pai=metier.moisNonPayer(id);
					etat=true;
					model.setPaiement(pai);
					 Date dat=metier.getDatte(id);
						request.setAttribute("dernPai", dat);
					  request.setAttribute("model", model);
					  img="images/paiementRetard.png";
					  
					  mois=metier.getMois(id);
					  
				}
				
			ModelAdmin modelN=new ModelAdmin();
			List<Article> art=metier.afficherNews();
			modelN.setArticle(art);
			request.setAttribute("modelN", modelN);	
			request.setAttribute("mois", mois);	
			request.setAttribute("image", img);
			request.setAttribute("etat", etat);
			request.getRequestDispatcher("avantPayer.jsp").forward(request, response);
			
		}else if(path.equals("/historiquePro.de")) {
			
			int id=Integer.parseInt(request.getParameter("id"));
			Date date=Date.valueOf(request.getParameter("datte") );
			boolean etat=true;
			double m=0;
		 ModelAdmin modelA= new ModelAdmin();
		 ModelAdmin modelP= new ModelAdmin();
		 List<Activite> act=metier.getActiviter(id,date);
	
		 List<Programme> programme = metier.getProgramme(id,date);
		
		modelP.setProgramme(programme);
		 modelA.setActivs(act);
		 m=metier.getPaiement(id, date);
		 request.setAttribute("montant", m);
		 request.setAttribute("date", date);
         request.setAttribute("modelA", modelA);
         request.setAttribute("modelP", modelP);
         request.setAttribute("etat", etat);
         
         ModelAdmin modelN=new ModelAdmin();
 		List<Article> art=metier.afficherNews();
 		modelN.setArticle(art);
 		request.setAttribute("modelN", modelN);
 		
         request.getRequestDispatcher("historiqueProg.jsp").forward(request, response);
         
		}else if(path.equals("/chercherhisto.de")) {
			
			int id=Integer.parseInt(request.getParameter("id"));
			Date date=Date.valueOf(request.getParameter("date") );
			
			boolean etat=false;
			String gender=metier.testerSexe(id);
			String image="";
			double m=0;
		 ModelAdmin modelA= new ModelAdmin();
		 ModelAdmin modelP= new ModelAdmin();
		 List<Activite> act=metier.getActiviter(id, date);
		 List<Programme> programme = metier.getProgramme(id, date);
		 
		 if(programme.isEmpty() && act.isEmpty()) {
			
		            image="images/activiteVide.png";
		            
		                          
		      
		    	  etat= false;
		           
			     
		          
			 
		  
		 }else {
			 
				etat=true;
				modelP.setProgramme(programme);
				modelA.setActivs(act);
				m=metier.getPaiement(id, date);
				
		         request.setAttribute("modelA", modelA);
		         request.setAttribute("modelP", modelP);
				
			}

		 
		 ModelAdmin modelN=new ModelAdmin();
			List<Article> art=metier.afficherNews();
			modelN.setArticle(art);
			request.setAttribute("modelN", modelN);
			request.setAttribute("montant", m);
         request.setAttribute("date", date);
         request.setAttribute("image", image);
		 request.setAttribute("etat", etat);
         request.getRequestDispatcher("historiqueProg.jsp").forward(request, response);
			
			
			
		}
		
		
		
		
		
		
		else if (path.equals("/paiement.de")) {
			int id = Integer.parseInt(request.getParameter("id"));
			boolean etat;
			double montant = metier1.getMontant(id);
			if (montant == 0) {

				String img = "images/panierr.png";
				String vide = "Votre panier de Sport";
				String vide2 = "EST VIDE !";
				String vide3 = "Vous n'avez ajouté aucun Sport a votre panier";
				request.setAttribute("imagePanierVide", img);
				request.setAttribute("vide", vide);
				request.setAttribute("vide2", vide2);
				request.setAttribute("vide3", vide3);
				etat = false;

			} else {
				
				
				
				ModelAdmin modelA = new ModelAdmin();
				List<Activite> activite = metier1.getActiviterV(id);
				modelA.setActivs(activite);

				ModelAdmin modelP = new ModelAdmin();
				List<Programme> programme = metier1.getProgrammeV(id);
				modelP.setProgramme(programme);

				request.setAttribute("montant", montant);
				request.setAttribute("modelP", modelP);
				request.setAttribute("modelA", modelA);
				etat = true;
			}
			request.setAttribute("etat", etat);
			request.getRequestDispatcher("panier.jsp").forward(request, response);
		
		
		
		}else if(path.equals("/historiqueFac.de")) {
			int id = Integer.parseInt(request.getParameter("id"));
			ModelAdmin model = new ModelAdmin();
			List<Paiement> paie=metier.mesFactures(id);
			model.setPaiement(paie);
			request.setAttribute("model", model);
			ModelAdmin modelN=new ModelAdmin();
			List<Article> art=metier.afficherNews();
			modelN.setArticle(art);
			request.setAttribute("modelN", modelN);
			request.getRequestDispatcher("historiqueFacture.jsp").forward(request, response);
			
			
		}
	
		else if(path.equals("/moreNews.de")) {
			
			int id = Integer.parseInt(request.getParameter("idn"));
			Article article=metier.moreNews(id);
			request.setAttribute("article", article);
			ModelAdmin modelN=new ModelAdmin();
			List<Article> art=metier.afficherNews();
			modelN.setArticle(art);
			request.setAttribute("modelN", modelN);
			request.getRequestDispatcher("moreNews.jsp").forward(request, response);
		}
		else if(path.equals("/tousNews.de")) {
			ModelAdmin modeln=new ModelAdmin();
			List<Article> arti=metier.afficherAllNews();
			modeln.setArticle(arti);
			
			request.setAttribute("modeln", modeln);
			request.getRequestDispatcher("suitteNews.jsp").forward(request, response);
			
		}
		else if(path.equals("/validerPaiement.de")) {
			boolean etat3=false;
			int id = Integer.parseInt(request.getParameter("id"));
			double montant = Double.parseDouble(request.getParameter("mont"));
			Date date=Date.valueOf(request.getParameter("dat") );
			//insert into entrainer et entrainerPro
		
			List<Seance> seance=metier1.getAllSeanceAdh(id, date);
			 for(Seance s : seance) {
				 
				 Entrainer entrainer = new Entrainer();
					entrainer.setId_seance(s.getId_seance());
					System.out.println(s.getId_seance());
					entrainer.setId_cad(id);
					metier1.choisirSeance(entrainer);
			 }
			 List<Programme> programme=metier1.getAllprogAdh(id, date);
			 for(Programme s : programme) {
				 Programme pro=new Programme(); 
				 pro.setId_cad(id);
				 pro.setId_prog(s.getId_prog());
				 metier1.choisirProg(pro);
			 }

			Paiement p = new Paiement();
			p.setId_cad(id);
			p.setMontant(montant);
			metier.enregistrerPaement(p);
			request.setAttribute("etat3", etat3);
			 ModelAdmin modelN=new ModelAdmin();
				List<Article> art=metier.afficherNews();
				modelN.setArticle(art);
				request.setAttribute("modelN", modelN);
			request.getRequestDispatcher("adherentlogged.jsp").forward(request, response);
		
			
		}
		else if(path.equals("/adherentlogged.de")) {
			int id=Integer.parseInt(request.getParameter("id"));
			
			//news
			ModelAdmin modelN=new ModelAdmin();
		    List<Article> art=metier.afficherNews();
			modelN.setArticle(art);
			request.setAttribute("modelN", modelN);
			//seance de ce jour
			ModelAdmin modelS=new ModelAdmin();
			List<Seance> sea=metier.getAllSeanceAdh2(id);
			int se=0;
			String modele="";
			if( !sea.isEmpty()) {
				se=1;
				modelS.setSeance(sea);
				request.setAttribute("modelS", modelS);
			}else {
				se=0;
				modele="Si tu t'entraînes comme un sportif, tu ne peux te battre comme un guerrier ." ;
				request.setAttribute("modele", modele);
					
			}
			String msg=request.getParameter("contact");
			
			boolean etat= false;
			String image="";
			String gender=metier.testerSexe(id);
			ModelAdmin model=new ModelAdmin();
			List<Activite> activites=metier.afficherActivité(id);
			ModelAdmin modelP=new ModelAdmin();
			List<Programme> programme=metier.afficherProgramme(id);
			
	if( !programme.isEmpty() || !activites.isEmpty()) {
				etat=true;
				model.setActivs(activites);
				modelP.setProgramme(programme);
			    request.setAttribute("modelP", modelP);
			    request.setAttribute("model", model);
			}
			else {  
				      if(gender.equals("femme")) {
				    	  etat= false;
				            image="images/adhF.png";
				                          
				      }else  {
				    	  etat= false;
				           image="images/adhH.png";
					     
				          
				      
				      }
			}


	

	

	request.setAttribute("se", se);
	 request.setAttribute("msg", msg);
	      request.setAttribute("image", image); 
			request.setAttribute("etat", etat);
			
			
			request.getRequestDispatcher("adherentlogged.jsp").forward(request, response);
			
		}else if(path.equals("/deconnection.de")) {
		
			HttpSession session = request.getSession();
			session.invalidate();
            
            request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		else if(path.equals("/editEmailAdmin.de")) {
			boolean email=false;
			String message="";
			int id=Integer.parseInt(request.getParameter("id1"));
			String email1=request.getParameter("email1");
			String email2=request.getParameter("email2");
			String verf=metier.verifierEmail(id);
			if(email1.equals(verf)) {
				
				metier.modifierEmail1(id, email2);
				message="Votre email a bien été modifier";
				email=true;
				request.setAttribute("email", email);
				request.setAttribute("message", message);
				String url="adherentlogged.de?id="+id;
				request.getRequestDispatcher(url).forward(request, response);
			}else {
				
				message="L'email que vous avez saisie est erroné !";
				request.setAttribute("message", message);
				request.getRequestDispatcher("gererCompteAdh.jsp").forward(request, response);
			}
		
			 
		}else if(path.equals("/editPasswordAdmin.de")) {
			boolean pass=false;
			String message2="";
			int id=Integer.parseInt(request.getParameter("id2"));
			String pass1=request.getParameter("pass1");
			String pass2=request.getParameter("pass2");
			String verf=metier.verifierPass(id);
         if(pass1.equals(verf)) {
				
				metier.modifierPass1(id, pass2);
				message2="Votre mot de passe a bien été modifier";
				pass=true;
				request.setAttribute("pass", pass);
				request.setAttribute("message2", message2);
				String url="adherentlogged.de?id="+id;
				request.getRequestDispatcher(url).forward(request, response);
			}else {
				
				message2="Le mot de passe  que vous avez saisie est erroné !";
				request.setAttribute("message2", message2);
				request.getRequestDispatcher("gererCompteAdh.jsp").forward(request, response);
			}
        
			 
		
		}else if(path.equals("/contacter.de")) {
			int note=Integer.parseInt(request.getParameter("note"));
			String has=request.getParameter("h");
			int id=Integer.parseInt(request.getParameter("id"));
			int re=Integer.parseInt(request.getParameter("re"));
			int comp=1;
			ModelAdmin modelN=new ModelAdmin();
			List<Article> art=metier.afficherNews();
			modelN.setArticle(art);
			request.setAttribute("modelN", modelN);
			if(note==2) {
		    if(has.equals("yes")) {
		    	 
				  ModelAdmin modelNot2 = new ModelAdmin();
				  List<Notification> not2=metier.getNotif2(id);
				  for(Notification no: not2) {
			    		 comp++;
			    	 }
				  modelNot2.setNotification(not2);
				  request.setAttribute("modelNot2",modelNot2);
				  
				  ModelAdmin modelNot1 = new ModelAdmin(); 
			    	 List<Notification> not1=metier.getNotif1(id); 
			    	 for(Notification no: not1) {
			    		 comp++;
			    	 }
			    	 modelNot1.setNotification(not1);
					  request.setAttribute("modelNot1", modelNot1); 
				  System.out.println("nombre de notif:"+comp);
		
		    }else if(has.equals("no")){ 
		    	System.out.println("chaimae");
				
		    }}
			if(re==1) {
				 ModelAdmin modelR = new ModelAdmin();   
  			   	List<Paiement> pai=metier.moisNonPayer(id);
					modelR.setPaiement(pai);       
					request.setAttribute("modelR", modelR);
			}
			
		    Article article= metier.getLastNews();
		    request.setAttribute("article", article);
			request.setAttribute("note",note);
			request.getRequestDispatcher("contacterAdmin.jsp").forward(request, response);
		}
		else if(path.equals("/notif.de")) {
			
			ModelAdmin modelN=new ModelAdmin();
			List<Article> art=metier.afficherNews();
			modelN.setArticle(art);
			request.setAttribute("modelN", modelN);
			
			
			request.getRequestDispatcher("contacterAdmin.jsp").forward(request, response);
		}
		
		
		
		else if(path.equals("/contacterAdmin.de")) {
			boolean etat=false;
			String email=request.getParameter("email");
			String subject = request.getParameter("subject");
			String nom=request.getParameter("nom");
			String msg="";
			Subject su = metier1.saveSubject(new Subject(nom, email, subject));
			if(!nom.isEmpty() && !email.isEmpty() && !subject.isEmpty()) {
			 etat=true;
			 msg="votre message est bien été envoyé";
			
			 request.setAttribute("etat",etat);
			 request.setAttribute("subject", su);
			 String url="adherentlogged.de?contact="+msg;
			 request.getRequestDispatcher(url).forward(request, response);
			 
		}else {
			ModelAdmin modelN=new ModelAdmin();
			List<Article> art=metier.afficherNews();
			modelN.setArticle(art);
			request.setAttribute("modelN", modelN);
			request.setAttribute("subject", su);
			request.getRequestDispatcher("contacterAdmin.jsp").forward(request, response);
		}
		
		}
		else if(path.equals("/desabonner.de")) {
			int id=Integer.parseInt(request.getParameter("id"));
			metier.deteteAcount(id);
			
			HttpSession session = request.getSession();
			session.invalidate();
            
            request.getRequestDispatcher("index.jsp").forward(request, response);
			
		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
