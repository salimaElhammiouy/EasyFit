package com.club.dao;

import java.util.List;

import com.club.metie.Activite;

import com.club.metie.Entrainer;
import com.club.metie.Equipement;
import com.club.metie.Images;
import com.club.metie.Inscription;
import com.club.metie.Paiement;
import com.club.metie.Programme;
import com.club.metie.Seance;
import com.club.metie.Subject;

import java.sql.Date;


public interface InterClub {

	public Subject saveSubject(Subject su) ;
		
	

public Inscription saveAdherant(Inscription in);

public List<Equipement> getAllEquipements();
public Equipement ajouterEquip(Equipement eq);
public List<Seance> getAllSeance(int id_activite);
public  Seance saveSeance(Seance sea);
public void choisirProg(Programme p);
public int getIdAd(String nomA, String prenomA);
public List<Entrainer> getMontantTotal(int id_cad , int id_seance);
public int getMo(int id_cad, Activite a);
public int getMoo(int id_cad, int id_act);
public double getPrix(Activite a);
public double getPrixx(int id_act);
public void enregisterMontant(double m , int id_cad);

void choisirSeance(Entrainer en);
public Images enregistrerImages(Images img);
public double getMontant(int id_cad);
public void enregistrerPaement(Paiement p);
public Seance getSeance(int id, int id_activite);
public List<Activite> getAllActivs( int id_ad);
public List<Activite> getAllActivites(int id_activite);
public List<Activite> getAllActivitesSansId(String categorie);
public List<Entrainer> getPrixSeance(int id_cad);
public int tester(int a);
public double getPrixpro(int id_prog);
public List<Activite> getActiviterV(int id_cad);
public List<Programme> getProgrammeV(int id_cad);
public void deleteInfoSeance(int id_ad , int id_act);

public void deleteInfoProgramme(int id_ad , int id_pro);
public void subMontantSeance(double m , int id_cad);

public String testerSexe(int id_ad);

public List<Programme> getAllpro(int id);

public int testerPersonne(int id);
public List<Seance> getAllSeanceAdh(int id_ad , Date d);
public List<Programme> getAllprogAdh(int id_ad, Date d);
public int testerAdhe(int id);
}