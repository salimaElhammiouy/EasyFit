package com.club.metie;

import java.util.ArrayList;
import java.util.List;

public class ModelAdmin {
	private String motCle;
	List<Activite> activs = new ArrayList<>();
	List<Article> article = new ArrayList<>();
	List<Equipement> equips = new ArrayList<>();
	List<Inscription> adhs=new ArrayList<>();
	List<Seance> seance = new ArrayList<>();
	List<User> User = new ArrayList<>();
	List<Programme> programme= new ArrayList<>();
	List<Notification> notification= new  ArrayList<>();
	
	public List<Notification> getNotification() {
		return notification;
	}
	public void setNotification(List<Notification> notification) {
		this.notification = notification;
	}
	public List<Programme> getProgramme() {
		return programme;
	}
	public void setProgramme(List<Programme> programme) {
		this.programme = programme;
	}
	List<Paiement> paiement = new ArrayList<>();
	List<Subject> subject = new ArrayList<>();
	public String getMotCle() {
		return motCle;
	}
	public void setMotCle(String motCle) {
		this.motCle = motCle;
	}
	public List<Activite> getActivs() {
		return activs;
	}
	public void setActivs(List<Activite> activs) {
		this.activs = activs;
	}
	public List<Article> getArticle() {
		return article;
	}
	public void setArticle(List<Article> article) {
		this.article = article;
	}
	public List<Equipement> getEquips() {
		return equips;
	}
	public void setEquips(List<Equipement> equips) {
		this.equips = equips;
	}
	public List<Inscription> getAdhs() {
		return adhs;
	}
	public void setAdhs(List<Inscription> adhs) {
		this.adhs = adhs;
	}
	public List<Seance> getSeance() {
		return seance;
	}
	public void setSeance(List<Seance> seance) {
		this.seance = seance;
	}
	public List<User> getUser() {
		return User;
	}
	public void setUser(List<User> user) {
		User = user;
	}
	public List<Paiement> getPaiement() {
		return paiement;
	}
	public void setPaiement(List<Paiement> paiement) {
		this.paiement = paiement;
	}
	public List<Subject> getSubject() {
		return subject;
	}
	public void setSubject(List<Subject> subject) {
		this.subject = subject;
	}
	
	
	public List<Seance> seances=new ArrayList<>();
	public List<Activite> activites=new ArrayList<>();
	public List<Entrainer> entrainer=new ArrayList<>();


	public List<Entrainer> getEntrainer() {
		return entrainer;
	}

	public void setEntrainer(List<Entrainer> entrainer) {
		this.entrainer = entrainer;
	}

	public List<Seance> getSeances() {
		return seances;
	}

	public void setSeances(List<Seance> seances) {
		this.seances = seances;
	}
	
	public String  getElement(int id) {
		
		
		
		return "";
	}

	public List<Activite> getActivites() {
		return activites;
	}

	public void setActivites(List<Activite> activites) {
		this.activites = activites;
	}

}
