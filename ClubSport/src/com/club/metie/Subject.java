package com.club.metie;

import java.io.Serializable;

public class Subject implements Serializable {
	private int idSujet;
	private String nom;
	private String email;
	private String sujet;
	private String date_s;
	public String getDate_s() {
		return date_s;
	}
	public void setDate_s(String date_s) {
		this.date_s = date_s;
	}
	public Subject() {
		
	}
	public Subject(String nom, String email, String sujet) {
		super();
		this.nom = nom;
		this.email = email;
		this.sujet = sujet;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getSujet() {
		return sujet;
	}
	public void setSujet(String sujet) {
		this.sujet = sujet;
	}
	public int getIdSujet() {
		return idSujet;
	}
	public void setIdSujet(int idSujet) {
		this.idSujet = idSujet;
	}
	

}
