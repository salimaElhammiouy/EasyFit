package com.club.dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import com.club.metie.*;

public interface AdminDAO {
	
	public List<Activite> getAllActivities();
	public Activite ajouterActivite(Activite act , Images img);
	public void deleteActivite(int id);
	//public List<Activite> ActivitesParMC(String mc);	
	public Activite updateActivite(Activite a);
	public Activite getActivite(int id);
	
	public void updateImage(Images image);
	public Images getImage(int id) ;
	
	public List<Equipement> getAllEquipements(String mc);
	public Equipement ajouterEquip(Equipement eq);
	public void deleteEquipement(int id);
	public List<Equipement> equipementsParMC(String mc);
	
	public Subject saveSubject(Subject su) ;
	public Inscription saveAdherant(Inscription in);
	public List<Inscription> getAllAdh();
	
	public Double getTotal(int id,Date d1) throws SQLException;
	//public String getMonth(int id)  throws SQLException;
	public List<Paiement> getPaiement(int id);
	public String getDate() throws SQLException;
	
	
	public Article ajouterArticle(Article a, Images img);
	public void deleteArticle(int id);
	public List<Article> articlesParMC(String mc);
	public Article updateArticle(Article p);
	public List<Article> getAllArticles();
	public Article getNews(int id);
	public List<Subject> getAllMessages();
	
	public int logging(User u);
	public List<User> getAdmin(String email,String password);
	
	public List<User> getAllMoniteurs();
	//public List<User> moniteursParMC(String mc);
	public User ajouterMoniteur(User eq);
	public void deleteMoniteur(int id);
	public void affecterMoniteur(int ids,String nom,String prenom);
	//public User getMoniteur(int id);
	//public User getMoniteurr(String nom,String prenom);
	
	public List<Seance> seancesParMC(String mc);
	public List<Seance> getAllseances();
	//public Seance getSeance(String j,String h);
	public int getIDsport(String s);
	public Seance getSeanceID(int ids);
	public Seance addSeance (Seance s);
	public List<Seance> getAllseances1();
	public void deleteSeance(int id);
	public void reporterSeance(int id,String d);
	
	public void modifierEmail1(int id,String em);
	public void modifierPass1(int id,String mot);
	
	public List<User> getAllAdhActivite();
	public List<User> getAllAdhProgramme();
	
	public User getAdherent(int id);
	public List<Activite> getActiviteAdh(int id,Date d1);
	public List<Activite> getProgAdh(int id,Date d1);
	
	public void editAdherentPassword(String nom,String prenom,int gsm, String pass);
	public List<Activite> ConcatNames(String act);
	
	
	
	public Seance getInfoSeance(int ids);//le nom du sport, jour, horaire de seance à partir de son id
	public void addNotif1(int ids,String text);//insérer l'ajout de seance
	public void addNotif2(int ids,String text);//insérer seance reportée
	public User getAdherentt(String email, String password);
	
	

}
