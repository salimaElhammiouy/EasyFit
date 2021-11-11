package com.club.metie;

import java.sql.Date;

public class Paiement {
private int id_p;
private double montant;
private Date date_p;
private int id_cad;
private int nb_retard;
private String mois;

private String date;

public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public String getMois() {
	return mois;
}
public void setMois(String mois) {
	this.mois = mois;
}
public int getNb_retard() {
	return nb_retard;
}
public void setNb_retard(int nb_retard) {
	this.nb_retard = nb_retard;
}
public int getId_cad() {
	return id_cad;
}
public void setId_cad(int id_cad) {
	this.id_cad = id_cad;
}
public int getId_p() {
	return id_p;
}
public void setId_p(int id_p) {
	this.id_p = id_p;
}
public double getMontant() {
	return montant;
}
public void setMontant(double montant) {
	this.montant = montant;
}
public Date getDate_p() {
	return date_p;
}
public void setDate_p(Date date_p) {
	this.date_p = date_p;
}




}
