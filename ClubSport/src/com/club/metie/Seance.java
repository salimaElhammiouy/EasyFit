package com.club.metie;

import java.io.Serializable;

public class Seance implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id_seance;
	private String jour;
	private String horaire;
	private int  id_activite;
	private int  id_mon;
	private String nom_mon;
	private String prenom_mon;
	private String nom_activite;
	private String description;
	private int duree;
	private String niveau;
	private int calories;
	private double prix_seance;
	
	
	
	public Seance(String jour, String horaire) {
		super();
		this.jour = jour;
		this.horaire = horaire;
	}
	public String getPrenom_mon() {
		return prenom_mon;
	}
	public void setPrenom_mon(String prenom_mon) {
		this.prenom_mon = prenom_mon;
	}
	public Seance() { };
	public Seance(String jour, String horaire, String prenom_mon,String nom_activite, String   nom_mon) {
		super();
		this.jour = jour;
		this.horaire = horaire;
		this.nom_activite = nom_activite;
		this.nom_mon = nom_mon;
		this.prenom_mon= prenom_mon;
	}
	public int getId_seance() {
		return id_seance;
	}
	public void setId_seance(int id_seance) {
		this.id_seance = id_seance;
	}
	public String getJour() {
		return jour;
	}
	public void setJour(String jour) {
		this.jour = jour;
	}
	public String getHoraire() {
		return horaire;
	}
	public void setHoraire(String horaire) {
		this.horaire = horaire;
	}
	public int getId_activite() {
		return id_activite;
	}
	public void setId_activite(int id_activite) {
		this.id_activite = id_activite;
	}
	public int getId_mon() {
		return id_mon;
	}
	public void setId_mon(int id_mon) {
		this.id_mon = id_mon;
	}
	public String getNom_mon() {
		return nom_mon;
	}
	public void setNom_mon(String nom_mon) {
		this.nom_mon = nom_mon;
	}
	public String getNom_activite() {
		return nom_activite;
	}
	public void setNom_activite(String nom_activite) {
		this.nom_activite = nom_activite;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getDuree() {
		return duree;
	}
	public void setDuree(int duree) {
		this.duree = duree;
	}
	public String getNiveau() {
		return niveau;
	}
	public void setNiveau(String niveau) {
		this.niveau = niveau;
	}
	public int getCalories() {
		return calories;
	}
	public void setCalories(int calories) {
		this.calories = calories;
	}
	public double getPrix_seance() {
		return prix_seance;
	}
	public void setPrix_seance(double prix_seance) {
		this.prix_seance = prix_seance;
	}
	
	
	
	

}
