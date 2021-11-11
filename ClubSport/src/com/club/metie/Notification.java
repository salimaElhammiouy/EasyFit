package com.club.metie;


	
	
	import java.io.Serializable;
import java.sql.Date;

	public class Notification implements Serializable{
		
		private int id_notif;
		private String texte_notif;
		private int id_seance;
		private Date date_notif;
		private String time;
		private int  id_activite;
		private String nom_activite; 
		public int getId_activite() {
			return id_activite;
		}

		public void setId_activite(int id_activite) {
			this.id_activite = id_activite;
		}

		public String getNom_activite() {
			return nom_activite;
		}

		public void setNom_activite(String nom_activite) {
			this.nom_activite = nom_activite;
		}

		public String getTime() {
			return time;
		}

		public void setTime(String time) {
			this.time = time;
		}

		public Notification() {
			
		}
		
		public int getId_notif() {
			return id_notif;
		}
		public void setId_notif(int id_notif) {
			this.id_notif = id_notif;
		}
		public String getTexte_notif() {
			return texte_notif;
		}
		public void setTexte_notif(String texte_notif) {
			this.texte_notif = texte_notif;
		}
		public int getId_seance() {
			return id_seance;
		}
		public void setId_seance(int id_seance) {
			this.id_seance = id_seance;
		}
		public Date getDate_notif() {
			return date_notif;
		}
		public void setDate_notif(Date date_notif) {
			this.date_notif = date_notif;
		}
		
		

	


}
