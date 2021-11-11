package com.club.metie;

import java.io.Serializable;
import java.sql.Date;

public class Programme implements Serializable{
	private int id_prog;
	private String nom_prog;
	private double prix_programme;
	private int id_cad;
	
	private String pro;
	private Date d;
	public Date getD() {
		return d;
	}


	public void setD(Date d) {
		this.d = d;
	}


	public String getPro() {
		return pro;
	}


	public void setPro(String pro) {
		this.pro = pro;
	}


	public String getSrc_image() {
		return src_image;
	}


	public void setSrc_image(String src_image) {
		this.src_image = src_image;
	}
	private String src_image;
	public int getId_cad() {
		return id_cad;
	}


	public void setId_cad(int id_cad) {
		this.id_cad = id_cad;
	}


	public double getPrix_programme() {
		return prix_programme;
	}


	public void setPrix_programme(double prix_programme) {
		this.prix_programme = prix_programme;
	}


	public Programme(int id_prog) {
		
		this.id_prog=id_prog;
	}
	
	
	public Programme() {
		// TODO Auto-generated constructor stub
	}


	public int getId_prog() {
		return id_prog;
	}
	public void setId_prog(int id_prog) {
		this.id_prog = id_prog;
	}
	public String getNom_prog() {
		return nom_prog;
	}
	public void setNom_prog(String nom_prog) {
		this.nom_prog = nom_prog;
	}
	
	

}
