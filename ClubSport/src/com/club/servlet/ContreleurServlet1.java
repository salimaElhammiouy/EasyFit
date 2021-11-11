package com.club.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
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
import com.club.dao.ClubLoginImlp;
import com.club.dao.InterClub;
import com.club.dao.InterClubLogin;


import com.club.metie.*;


/**
 * Servlet implementation class ContreleurServlet1
 */
@WebServlet(name = "cs", urlPatterns = { "/controleur1", "*.do"})
public class ContreleurServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	InterClub metier;
	InterClubLogin metier2;
	AdherentinterfaceDAO metier3;
	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContreleurServlet1() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void init() throws ServletException {
		// TODO Auto-generated method stub
		metier = new ClubDaoImpl();
		metier2 = new ClubLoginImlp();
		metier3= new AdherentImplementDAO();
			;}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getServletPath();
		if (path.equals("/index.do")) {
			boolean etat=false;
		
			request.setAttribute("etat", etat);
			request.getRequestDispatcher("index.jsp").forward(request, response);

		} else if (path.equals("/contactezN.do")) {
			 boolean i=false;
			String nom = request.getParameter("name");
			String email = request.getParameter("email");
			String subject = request.getParameter("subject");
			String msg="";
			Subject su = metier.saveSubject(new Subject(nom, email, subject));
			if(!nom.isEmpty() && !email.isEmpty() && !subject.isEmpty()) {
				msg="Votre message est bien été envoyer";
				i=true;
				request.setAttribute("msg", msg);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			request.setAttribute("nom", nom);
			request.setAttribute("i", i);
			request.getRequestDispatcher("contactezN.jsp").forward(request, response);

		} else if (path.equals("/reserverPlace.do")) {
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
					String t="";
					request.setAttribute("t", t);
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
			
			
		

		} else if (path.equals("/choisirProgramme.do")) {
             boolean etat2=true;
			int idP = Integer.parseInt(request.getParameter("idP"));
			int id_ad = Integer.parseInt(request.getParameter("idc"));
			int x=metier.testerPersonne(id_ad);
			int nombre=0;
			String msg="";
			if(x==1) {
				etat2=false;
				 nombre=metier3.retardPaiement(id_ad);
				 if(nombre>31) {
					 //problem a resoudre 
					 Programme prog = new Programme();
						prog.setId_prog(idP);
						prog.setId_cad(id_ad);
						metier.choisirProg(prog);
					System.out.println("honaa ok");
					 
				 }else {
					 
					 msg="Vous ne pouvez rien choisir maintenant, revenez le mois prochain s'il vous plait !";
					 
					 System.out.println("honaa not ok");
				 }
				 
			} else {
				System.out.println("ici visit");
			Programme prog = new Programme();
			prog.setId_prog(idP);
			prog.setId_cad(id_ad);
			metier.choisirProg(prog);
			request.setAttribute("etat2", etat2);
			}
			request.setAttribute("msg", msg);
			if (idP == 1)
				request.getRequestDispatcher("EasyEquilibre.jsp").forward(request, response);
			if (idP == 2)
				request.getRequestDispatcher("easyMinceur.jsp").forward(request, response);
			if (idP == 3)
				request.getRequestDispatcher("EasyCardio.jsp").forward(request, response);
			if (idP == 4)
				request.getRequestDispatcher("EasyArmy.jsp").forward(request, response);
			if (idP == 5)
				request.getRequestDispatcher("EasyDance.jsp").forward(request, response);
			if (idP == 6)
				request.getRequestDispatcher("EasyDefense.jsp").forward(request, response);

		}else if(path.equals("/choisirPro.do")){
			boolean etat2= true;
			int ida = Integer.parseInt(request.getParameter("ida"));
			int x=metier.testerPersonne(ida);
			if(x==1) {
				etat2=false;
			}
			request.setAttribute("etat2", etat2);
			int idP = Integer.parseInt(request.getParameter("idP"));
			if (idP == 1)
				request.getRequestDispatcher("EasyEquilibre.jsp").forward(request, response);
			if (idP == 2)
				request.getRequestDispatcher("easyMinceur.jsp").forward(request, response);
			if (idP == 3)
				request.getRequestDispatcher("EasyCardio.jsp").forward(request, response);
			if (idP == 4)
				request.getRequestDispatcher("EasyArmy.jsp").forward(request, response);
			if (idP == 5)
				request.getRequestDispatcher("EasyDance.jsp").forward(request, response);
			if (idP == 6)
				request.getRequestDispatcher("EasyDefense.jsp").forward(request, response);
			
		}
		else if (path.equals("/afficherSeance.do")) {
			boolean etat2= true;
			int id = Integer.parseInt(request.getParameter("activite"));
			int ida=Integer.parseInt(request.getParameter("id"));
			int x=metier.testerPersonne(ida);
			if(x==1) {
				etat2=false;
			}
			String noma=request.getParameter("noma");
			ModelAdmin modelS = new ModelAdmin();
			ModelAdmin modelA = new ModelAdmin();
			List<Seance> seance = metier.getAllSeance(id);
			List<Activite> activite = metier.getAllActivites(id);
			modelS.setSeances(seance);
			modelA.setActivites(activite);
			request.setAttribute("modelS", modelS);
			request.setAttribute("modelA", modelA);
			request.setAttribute("idact", id);
            request.setAttribute("noma", noma);
            request.setAttribute("etat2", etat2);
			request.getRequestDispatcher("mesActivies.jsp").forward(request, response);
		}

		else if (path.equals("/ajouterSeance.do")) {
			boolean etat2=true;
			int id_seance = Integer.parseInt(request.getParameter("id"));
			int id_cad = Integer.parseInt(request.getParameter("idd"));
			int id_act = Integer.parseInt(request.getParameter("activite"));
			int x=metier.testerPersonne(id_cad);
			int nombre=0;
			String msg="";
			if(x==1) {
				etat2=false;
				 nombre=metier3.retardPaiement(id_cad);
				 if(nombre>31) {
					    Entrainer entrainer = new Entrainer();
						entrainer.setId_cad(id_cad);
						entrainer.setId_seance(id_seance);
						metier.choisirSeance(entrainer);
					
					 
				 }else {
					 msg="Vous ne pouvez rien choisir maintenant, revenez le mois prochain s'il vous plait !";
					 request.setAttribute("msg", msg);
					
				 }
				 
			} else {
			Entrainer entrainer = new Entrainer();
			entrainer.setId_cad(id_cad);
			entrainer.setId_seance(id_seance);
           
			metier.choisirSeance(entrainer);
			                                 }
		 List<Activite> actt=metier.getAllActivites(id_act);
         String noma=actt.get(0).getNom_activite();
			String URL = "afficherSeance.do?activite=" + id_act+"&noma="+noma+"&id="+id_cad;
			
			
            request.setAttribute("etat2", etat2);
			request.getRequestDispatcher(URL).forward(request, response);

		}
		
		else if (path.equals("/paiement.do")) {
			
			boolean etat2=true;
			int i=2;
			int id= Integer.parseInt(request.getParameter("id"));
			int x=metier.testerPersonne(id);
			
			boolean etat=true;
			 double montant_total=0.0;
			 List<Activite> actt=metier.getAllActivs(id);
			 for(Activite a : actt) {
			int nb = metier.getMo(id, a);
			double prix = metier.getPrix(a);

		     montant_total += (double) (prix * nb);
            
			 }
			
			List<Programme> pro = metier.getAllpro(id);
			for(Programme p : pro) {
			montant_total+= metier.getPrixpro(p.getId_prog());
			
			}
			 System.out.println(montant_total);
			metier.enregisterMontant(montant_total, id);
			
			double montant = metier.getMontant(id);
		    String gender=metier.testerSexe(id);
			if(x==1) {
				etat2=false;
				   
				
			}
			i=metier3.testerPanier(id,montant);
			System.out.println(i);
			
			
			if (montant == 0 || i==1) {
		              if(x==1 && gender.equals("femme")) {
		            	  etat=false;
		  				String img = "images/fatwemen.png";
		  				String vide = "Votre panier de sports";
		  				String vide2 = "EST VIDE !";
		  				String vide3 = "Vous n'avez ajouté aucun sport à votre panier";
		  				request.setAttribute("imagePanierVide", img);
		  				request.setAttribute("vide", vide);
		  				request.setAttribute("vide2", vide2);
		  				request.setAttribute("vide3", vide3);
		  				System.out.println(gender);
		              }else if(x==1 && gender.equals("homme")) {
		            	  etat=false;
		  				String img = "images/fatmen.png";
		  				String vide = "Votre panier de sports";
		  				String vide2 = "EST VIDE !";
		  				String vide3 = "Vous n'avez ajouté aucun sport à votre panier";
		  				request.setAttribute("imagePanierVide", img);
		  				request.setAttribute("vide", vide);
		  				request.setAttribute("vide2", vide2);
		  				request.setAttribute("vide3", vide3);
		  				System.out.println(gender);
		            	  
		              }else {
              etat=false;
				String img = "images/fatmen.png";
				String vide = "Votre panier de sports";
				String vide2 = "EST VIDE !";
				String vide3 = "Vous n'avez ajouté aucun sport à votre panier";
				request.setAttribute("imagePanierVide", img);
				request.setAttribute("vide", vide);
				request.setAttribute("vide2", vide2);
				request.setAttribute("vide3", vide3);
				System.out.println("visiteur");
				
	                }}
			else {
				
				ModelAdmin modelA = new ModelAdmin();
				List<Activite> activite = metier.getActiviterV(id);
				modelA.setActivites(activite);

				ModelAdmin modelP = new ModelAdmin();
				List<Programme> programme = metier.getProgrammeV(id);
				modelP.setProgramme(programme);

				request.setAttribute("montant", montant);
				request.setAttribute("modelP", modelP);
				request.setAttribute("modelA", modelA);
				etat = true;
			}
	        request.setAttribute("etat2", etat2);
			request.setAttribute("etat", etat);
			request.getRequestDispatcher("panier.jsp").forward(request, response);
		}

		else if (path.equals("/validerPaiement.do")) {
			int id = Integer.parseInt(request.getParameter("id"));
			double montant = metier.getMontant(id);
            boolean etat3=true;
			Paiement p = new Paiement();
			p.setId_cad(id);
			p.setMontant(montant);
			metier.enregistrerPaement(p);
			int x=metier.testerPersonne(id);
			int y=metier.testerAdhe(id);
			if(x==1 && y>1) {
				etat3=false;
				
				request.setAttribute("etat3", etat3);
				request.getRequestDispatcher("adherentlogged.de").forward(request, response);
			}else if(y==1) {
				
			HttpSession session = request.getSession();
			session.invalidate();
            
            request.getRequestDispatcher("index.do").forward(request, response);}
		} else if (path.equals("/supprimerActivite.do")) {
			int idact = Integer.parseInt(request.getParameter("idact"));
			int id_ad = Integer.parseInt(request.getParameter("ida"));
			
			
			metier.deleteInfoSeance(id_ad, idact);
			String url = "paiement.do?id=" + id_ad;
			
			request.getRequestDispatcher(url).forward(request, response);

		} else if (path.equals("/supprimerProgramme.do")) {
			int idP = Integer.parseInt(request.getParameter("idP"));
			int id_ad = Integer.parseInt(request.getParameter("ida"));

			
			metier.deleteInfoProgramme(id_ad, idP);
			String url = "paiement.do?id=" + id_ad;
			request.getRequestDispatcher(url).forward(request, response);

		}

		else if (path.equals("/equipements.do")) {

			String nom = request.getParameter("nomma");
			String marque = request.getParameter("marque");
			Equipement eq = metier.ajouterEquip(new Equipement(nom, marque));

			request.setAttribute("equipements", eq);

			request.getRequestDispatcher("equipements.jsp").forward(request, response);

		}else if(path.equals("/personnaliserProg.do")) {
			boolean etat2=true;
			int ida=Integer.parseInt(request.getParameter("id"));
			int x=metier.testerPersonne(ida);
			if(x==1) {
				etat2=false;
			}
          
			ModelAdmin modelMus=new ModelAdmin();
			List<Activite> musculation=metier.getAllActivitesSansId("musculation");
			modelMus.setActivites(musculation);
			request.setAttribute("modelMus", modelMus);
			
			
			
			ModelAdmin modelBm=new ModelAdmin();
			List<Activite> boxemma=metier.getAllActivitesSansId("boxemma");
			modelBm.setActivites(boxemma);
			request.setAttribute("modelBm", modelBm);
			
			
			
			ModelAdmin modelcar=new ModelAdmin();
			List<Activite> cardio=metier.getAllActivitesSansId("cardio");
			modelcar.setActivites(cardio);
			request.setAttribute("modelcar", modelcar);
			
			ModelAdmin modeld=new ModelAdmin();
			List<Activite> danse=metier.getAllActivitesSansId("danse");
			modeld.setActivites(danse);
			request.setAttribute("modeld", modeld);
			
			ModelAdmin modelzt=new ModelAdmin();
			List<Activite> zenfit=metier.getAllActivitesSansId("zenfit");
			modelzt.setActivites(zenfit);
			request.setAttribute("modelzt", modelzt);
			
			ModelAdmin modelaq=new ModelAdmin();
			List<Activite> aquagym=metier.getAllActivitesSansId("aquagym");
			modelaq.setActivites(aquagym);
			request.setAttribute("modelaq", modelaq);
			
			ModelAdmin modelam=new ModelAdmin();
			List<Activite> artsmartiaux=metier.getAllActivitesSansId("arts martiaux");
			modelam.setActivites(artsmartiaux);
			request.setAttribute("modelam", modelam);
			

			
			request.setAttribute("etat2", etat2);
			request.getRequestDispatcher("personnaliserProg.jsp").forward(request, response);	
			
			
		}
		
		else if(path.equals("/decouvrirProg.do")) {
			boolean etat2=true;
			int ida=Integer.parseInt(request.getParameter("id"));
			int x=metier.testerPersonne(ida);
			if(x==1) {
				etat2=false;
			}
			
			request.setAttribute("etat2", etat2);
			request.getRequestDispatcher("decouvrirProg.jsp").forward(request, response);	
			
			
		}else if(path.equals("/EasyEquilibre.do")) {
			boolean etat2=true;
			int ida=Integer.parseInt(request.getParameter("id"));
			int x=metier.testerPersonne(ida);
			if(x==1) {
				etat2=false;
			}
			
			request.setAttribute("etat2", etat2);
			request.getRequestDispatcher("EasyEquilibre.jsp").forward(request, response);	
		}else if(path.equals("/EasyArmy.do")) {
			boolean etat2=true;
			int ida=Integer.parseInt(request.getParameter("id"));
			int x=metier.testerPersonne(ida);
			if(x==1) {
				etat2=false;
			}
			
			request.setAttribute("etat2", etat2);
			request.getRequestDispatcher("EasyArmy.jsp").forward(request, response);	
		}else if(path.equals("/EasyCardio.do")) {
			boolean etat2=true;
			int ida=Integer.parseInt(request.getParameter("id"));
			int x=metier.testerPersonne(ida);
			if(x==1) {
				etat2=false;
			}
			
			request.setAttribute("etat2", etat2);
			request.getRequestDispatcher("EasyCardio.jsp").forward(request, response);	
		}else if(path.equals("/EasyDefense.do")) {
			boolean etat2=true;
			int ida=Integer.parseInt(request.getParameter("id"));
			int x=metier.testerPersonne(ida);
			if(x==1) {
				etat2=false;
			}
			
			request.setAttribute("etat2", etat2);
			request.getRequestDispatcher("EasyDefense.jsp").forward(request, response);	
		}else if(path.equals("/easyMinceur.do")) {
			boolean etat2=true;
			int ida=Integer.parseInt(request.getParameter("id"));
			int x=metier.testerPersonne(ida);
			if(x==1) {
				etat2=false;
			}
			
			request.setAttribute("etat2", etat2);
			request.getRequestDispatcher("easyMinceur.jsp").forward(request, response);	
		}else if(path.equals("/EasyDance.do")) {
			boolean etat2=true;
			int ida=Integer.parseInt(request.getParameter("id"));
			int x=metier.testerPersonne(ida);
			if(x==1) {
				etat2=false;
			}
			
			request.setAttribute("etat2", etat2);
			request.getRequestDispatcher("EasyDance.jsp").forward(request, response);	
		}else if(path.equals("/garderAncien.do")) {
			boolean etat2=true;
			
			int ida=Integer.parseInt(request.getParameter("id"));
			Date dat=metier3.getDatte(ida);
			int x=metier.testerPersonne(ida);
			if(x==1) {
				etat2=false;
			}
			 List<Seance> seance=metier.getAllSeanceAdh(ida, dat);
			 for(Seance s : seance) {
				 
				 Entrainer entrainer = new Entrainer();
					entrainer.setId_seance(s.getId_seance());
					entrainer.setId_cad(ida);
					metier.choisirSeance(entrainer);
			 }
			 List<Programme> programme=metier.getAllprogAdh(ida, dat);
			 for(Programme s : programme) {
				 Programme pro=new Programme(); 
				 pro.setId_cad(ida);
				 pro.setId_prog(s.getId_prog());
				 metier.choisirProg(pro);
			 }
			
			
			String url="personnaliserProg.do?id="+ ida;
			request.setAttribute("etat2", etat2);
			request.getRequestDispatcher(url).forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getServletPath();
		if (path.equals("/login.do")) {
			String emailU = request.getParameter("emailUser");
			String passU = request.getParameter("passUser");
			User user = new User();
			user.setEmail(emailU);
			user.setPassword(passU);
			try {
				if (metier2.logging(user) == 1) {
					HttpSession session = request.getSession();
					session.setAttribute("emailU", emailU);
					response.sendRedirect("espaceAdmin.jsp");
				} else if (metier2.logging(user) == 2) {
					HttpSession session = request.getSession();
					session.setAttribute("emailU", emailU);
					response.sendRedirect("espaceAdherent.jsp");
				}

				else if (metier2.logging(user) == 3) {
					HttpSession session = request.getSession();
					session.setAttribute("emailU", emailU);
					response.sendRedirect("espaceMoniteur.jsp");
				} else {
					HttpSession session = request.getSession();
					session.setAttribute("emailU", emailU);
					response.sendRedirect("loginfailed.jsp");

				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (path.equals("/validerPaiement.do")) {
			request.getRequestDispatcher("personnaliserProg.jsp").forward(request, response);

		}

	}

}
