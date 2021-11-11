package com.club.metie;

import java.util.Date;


public class Equipement {
	private int id_e;
	private String nom_e;
	private String marque;
	private Date date_installe;
	public Equipement(String n,String m,Date date) {
		super();
		this.nom_e = n;
		this.marque = m;
		this.date_installe = date;
	}
	
	public Equipement () {
		
	}
	
	public Equipement(String n,String m) {
		super();
		this.nom_e = n;
		this.marque = m;
	
	}
	public int getId_e() {
		return id_e;
	}
	public void setId_e(int id_e) {
		this.id_e = id_e;
	}
	public String getNom_e() {
		return nom_e;
	}
	public void setNom_e(String nom_e) {
		this.nom_e = nom_e;
	}
	public String getMarque() {
		return marque;
	}
	public void setMarque(String marque) {
		this.marque = marque;
	}
	public Date getDate_installe() {
		return date_installe;
	}
	public void setDate_installe(Date date_installe) {
		this.date_installe = date_installe;
	}
	
	
}
