package com.club.metie;

import java.sql.Date;

public class Activite {
private int id_act;
private String nom_activite;
private String description;
private int duree;
private String niveau;
private int calories;
private String categorie;
private double prix_activite;
private String file; 
private int nb_seance;
private int id_img;
private String dispo;
private Date d;


public Date getD() {
	return d;
}

public void setD(Date d) {
	this.d = d;
}

public Activite() {
	
}	

public Activite(String nom,String desc,int duree,String niv,int cal,double prix) {
	this.nom_activite=nom;
	this.description=desc;
	this.duree=duree;
	this.niveau=niv;
	this.calories=cal;
	this.prix_activite=prix;
}	

public Activite(int ida,String nom,String desc,int duree,String niv,int cal,double prix,String disp,int idm) {
	this.id_act=ida;
	this.nom_activite=nom;
	this.description=desc;
	this.duree=duree;
	this.niveau=niv;
	this.calories=cal;
	this.prix_activite=prix;
	this.dispo=disp;
	this.id_img=idm;
}
public Activite(String nom, String categorie2, String description2, int duree2, String niveau2, int calories2,
		double prix) {
	// TODO Auto-generated constructor stub
	this.nom_activite=nom;
	this.categorie=categorie2;
	this.description=description2;
	this.duree=duree2;
	this.niveau=niveau2;
	this.calories=calories2;
	this.prix_activite=prix;
}

public Activite(int ida, String nom, String categ, String description2, int duree2, String niveau2, int calories2,
		double prix, String disp, int idimg) {
	this.nom_activite=nom;
	this.id_act=ida;
	this.description=description2;
	this.duree=duree2;
	this.niveau=niveau2;
	this.calories=calories2;
	this.prix_activite=prix;
	this.categorie=categ;
	this.dispo=disp;
	this.id_img=idimg;
	
	
}

public int getId_img() {
	return id_img;
}

public void setId_img(int id_img) {
	this.id_img = id_img;
}

public String getDispo() {
	return dispo;
}

public void setDispo(String dispo) {
	this.dispo = dispo;
}

public int getNb_seance() {
	return nb_seance;
}

public void setNb_seance(int nb_seance) {
	this.nb_seance = nb_seance;
}


public String getCategorie() {
	return categorie;
}

public void setCategorie(String categorie) {
	this.categorie = categorie;
}

public String getFile() {
	return file;
}
public void setFile(String file) {
	this.file = file;
}
public double getPrix_activite() {
	return prix_activite;
}
public void setPrix_activite(double prix_activite) {
	this.prix_activite = prix_activite;
}
public int getId_act() {
	return id_act;
}
public void setId_act(int id_act) {
	this.id_act = id_act;
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




}
