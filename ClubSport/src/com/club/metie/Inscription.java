package com.club.metie;

import java.io.Serializable;

public class Inscription implements Serializable {
    private int Idinscrir;
	private String nomA;
	private String prenomA;
	private String sexe;
	private String gsm;
	private String emailA;
	private String password1;
	private String password2;
	
	
	public Inscription() {
		
	}
	
	public Inscription(String nom, String prenom, String sexe, String gsm, String email, String password1) {
		super();
		this.nomA = nom;
		this.prenomA = prenom;
		this.sexe = sexe;
		this.gsm = gsm;
		this.emailA = email;
		this.password1 = password1;
		
	}





	public int getIdinscrir() {
		return Idinscrir;
	}





	public void setIdinscrir(int idinscrir) {
		Idinscrir = idinscrir;
	}





	public String getNomA() {
		return nomA;
	}
	public void setNomA(String nom) {
		this.nomA = nom;
	}
	public String getPrenomA() {
		return prenomA;
	}
	public void setPrenomA(String prenom) {
		this.prenomA = prenom;
	}
	public String getSexe() {
		return sexe;
	}
	public void setSexe(String sexe) {
		this.sexe = sexe;
	}
	public String getGsm() {
		return gsm;
	}
	public void setGsm(String gsm) {
		this.gsm = gsm;
	}
	public String getEmailA() {
		return emailA;
	}
	public void setEmailA(String email) {
		this.emailA = email;
	}
	public String getPassword1() {
		return password1;
	}
	public void setPassword1(String password1) {
		this.password1 = password1;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	
	
	
}
