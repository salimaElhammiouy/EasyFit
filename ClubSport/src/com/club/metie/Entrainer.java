package com.club.metie;

import java.io.Serializable;

public class Entrainer implements Serializable {
	private int id_cad;
	private int id_seance;
	private double prix;
	private int id_programme;
	public int getId_programme() {
		return id_programme;
	}
	public void setId_programme(int id_programme) {
		this.id_programme = id_programme;
	}
	private int mont;
	public int getMont() {
		return mont;
	}
	public void setMont(int mont) {
		this.mont = mont;
	}
	public int getId_cad() {
		return id_cad;
	}
	public void setId_cad(int id_cad) {
		this.id_cad = id_cad;
	}
	public int getId_seance() {
		return id_seance;
	}
	public void setId_seance(int id_seance) {
		this.id_seance = id_seance;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	

}
