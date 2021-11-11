package com.club.metie;

import java.io.Serializable;

public class User implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private int idu;
	private String nom;
	private String prenom;
	private String email;
	private String password;
	private int gsm;
	private String sexe;
	
	private int ida;
	private String sport;
	private String dispo;
	
	public User() {
		
	}
	
	public User(int id,String nom,String prenom,String email,String password) {
		this.idu=id;
		this.email=email;
		this.nom=nom;
		this.prenom=prenom;
		this.password=password;
	}
	
	public User(String nom,String prenom,String email,String password) {
		this.email=email;
		this.nom=nom;
		this.prenom=prenom;
		this.password=password;
	}
	
	public User(String nom,String prenom,String email,String password,int sport) {
		this.email=email;
		this.nom=nom;
		this.prenom=prenom;
		this.password=password;
		this.ida=sport;
	}
	
	
	public int getGsm() {
		return gsm;
	}

	public void setGsm(int gsm) {
		this.gsm = gsm;
	}

	public String getSexe() {
		return sexe;
	}

	public void setSexe(String sexe) {
		this.sexe = sexe;
	}

	public String getDispo() {
		return dispo;
	}

	public void setDispo(String dispo) {
		this.dispo = dispo;
	}

	public int getIda() {
		return ida;
	}

	public void setIda(int ida) {
		this.ida = ida;
	}

	public String getSport() {
		return sport;
	}

	public void setSport(String sport) {
		this.sport = sport;
	}

	public int getIdu() {
		return idu;
	}
	public void setIdu(int idu) {
		this.idu = idu;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	

}
