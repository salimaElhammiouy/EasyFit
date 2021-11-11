package com.club.dao;

import java.sql.Date;
import java.util.List;

import com.club.metie.*;

public interface AdherentinterfaceDAO {

public  List<Activite> afficherActivité(int id_ad)	;
public  List<Programme> afficherProgramme(int id_ad)	;
public String testerSexe(int id_ad);
public User getAdherent(String email , String pass);
public List<Seance> getSeancesAdh(int id);


public void enregistrerPaement(Paiement p);
public int getMoo(int id_cad, int id_act);



public void deleteInfoSeance(int id_ad , int id_act);
public String getMois(int id_ad);
public void deleteInfoProgramme(int id_ad , int id_pro);

public int retardPaiement(int id_ad);
public Date lastPaiement(int id_ad);
public List<Paiement> moisNonPayer(int id_ad);

public List<Activite> getActiviter(int id_cad , Date d);
public List<Programme> getProgramme(int id_cad , Date d);
public Date getDatte(int id_ad);
public Date changerForma(Date d1);

public List<Paiement> mesFactures(int id_ad);
public List<Article> afficherNews();
public List<Article> afficherAllNews();
public Article moreNews(int idn);
public double getPaiement(int id_ad, Date d);
public void modifierEmail1(int id,String em) ;
public void modifierPass1(int id,String mot);
public String verifierEmail(int id_ad);
public String verifierPass(int id_ad);
public int testerPanier(int id, double m);
public List<User> reporterUser(int ids);
public List<Seance> getAllSeanceAdh2( int id_ad);
public List<Notification> getNotif1(int ida);
public List<Notification> getNotif2(int ida);
public Article getLastNews();
public Boolean hasNotifs(int ida);
public void deteteAcount(int id);
public List<Activite> gettt(int id_ad);


}
