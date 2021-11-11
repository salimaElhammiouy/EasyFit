package com.club.metie;

import java.sql.Date;

public class Article {
	
	private int id_n;
	private String titre_n;
	private String contenu_n;	
	private Date date_n;
	private String img; 
	private String date;
private 	String chaine;
private String datee;

	
	public String getDatee() {
	return datee;
}

public void setDatee(String datee) {
	this.datee = datee;
}

	public String getChaine() {
	return chaine;
}

public void setChaine(String chaine) {
	this.chaine = chaine;
}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Article() {
		
	}
	
	public Article(String titre,String contenu) {
		this.titre_n=titre;
		this.contenu_n=contenu;	
	}
	
	public int getId_n() {
		return id_n;
	}
	public void setId_n(int id_n) {
		this.id_n = id_n;
	}
	public String getTitre_n() {
		return titre_n;
	}
	public void setTitre_n(String titre_n) {
		this.titre_n = titre_n;
	}
	public String getContenu_n() {
		return contenu_n;
	}
	public void setContenu_n(String contenu_n) {
		this.contenu_n = contenu_n;
	}
	public Date getDate_n() {
		return date_n;
	}
	public void setDate_n(Date date_n) {
		this.date_n = date_n;
	}
	
	
	
}
