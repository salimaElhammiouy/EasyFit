package com.club.metie;

import java.io.Serializable;

public class comptead implements Serializable{
private int id_cad;
private String nom_cad;
private String prenom_cad;
private double montant_a_payer;
public double getMontant_a_payer() {
	return montant_a_payer;
}
public void setMontant_a_payer(double montant_a_payer) {
	this.montant_a_payer = montant_a_payer;
}
private int progrramme;
public comptead() {}
public comptead(int id) {
	
	this.id_cad=id;
}

public int getId_cad() {
	return id_cad;
}
public void setId_cad(int id_cad) {
	this.id_cad = id_cad;
}
public String getNom_cad() {
	return nom_cad;
}
public void setNom_cad(String nom_cad) {
	this.nom_cad = nom_cad;
}
public String getPrenom_cad() {
	return prenom_cad;
}
public void setPrenom_cad(String prenom_cad) {
	this.prenom_cad = prenom_cad;
}
public int getProgrramme() {
	return progrramme;
}
public void setProgrramme(int progrramme) {
	this.progrramme = progrramme;
}




}
