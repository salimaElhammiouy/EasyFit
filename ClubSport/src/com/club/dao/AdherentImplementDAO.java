package com.club.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.sql.Date;
import java.util.List;

import com.club.metie.*;


public class AdherentImplementDAO  implements AdherentinterfaceDAO{

	@Override
	public List<Activite> afficherActivité(int id_ad) {
		List<Activite> act= new ArrayList<Activite>();
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("select id_act,nom_act,categorie,src_img,prix_activite,count(f.id_seance) as \"Nombre de seances\" "
					+ "from inscription i,facture f,activites a,seances s,moniteurs m,images im where Idinscrir = ? and f.id_ad=Idinscrir and "
					+ "s.id_seance=f.id_seance and m.id_moniteur=s.id_mon and a.id_act=m.id_activite and im.id_img=a.id_img and "
					+ " month(f.date_facture)=month(now()) and year(f.date_facture)= year(now()) group by nomA,prenomA,nom_act");
			 ps.setInt(1, id_ad);
			ResultSet rs=ps.executeQuery();
			   while(rs.next()) {
				   Activite activite = new Activite();
				   activite.setId_act(rs.getInt("id_act"));			 
				   activite.setNom_activite(rs.getString("nom_act"));
					activite.setPrix_activite(rs.getDouble("prix_activite"));
					activite.setCategorie(rs.getString("categorie"));
					activite.setFile(rs.getString("src_img"));
					activite.setNb_seance(rs.getInt("Nombre de seances"));
					
				act.add(activite);
		   }
		}catch (SQLException e) {
			   e.printStackTrace();
			   }
		return act;
	}

	@Override
	public String testerSexe(int id_ad) {
		
		Connection conn=SingletonConnection.getConnection();
		Inscription in = new Inscription();
		try {
			PreparedStatement ps=conn.prepareStatement("select i.sexe from inscription i , facture f where f.id_ad=Idinscrir and f.id_ad=? LIMIT 1");
			 ps.setInt(1, id_ad);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					in.setSexe(rs.getString("sexe"));
				}
		}catch (SQLException e) {
			   e.printStackTrace();
			   }
			
			
			return in.getSexe();
	}

	@Override
	public List<Programme> afficherProgramme(int id_ad) {
		List<Programme> ent= new ArrayList<Programme>();
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("SELECT  p.nom_prog, p.id_prog , p.prix_prog, i.src_img FROM facture f ,"
					+ " programme p, images i WHERE p.id_prog=f.id_prog and i.id_img= p.image and  month(f.date_facture)=month(now()) and year(f.date_facture)= year(now()) and f.id_ad= ?;");
			 ps.setInt(1, id_ad);
			ResultSet rs=ps.executeQuery();
		   while(rs.next()) {
			  Programme p = new Programme();
			  p.setId_prog(rs.getInt("id_prog"));
			  p.setNom_prog(rs.getString("nom_prog"));
			  p.setPrix_programme(rs.getDouble("prix_prog"));
			  p.setSrc_image(rs.getString("src_img"));
			
			  ent.add(p);
			}
	         
		   }
		   catch (SQLException e) {
			   e.printStackTrace();
			   }
		return ent;
	}

	@Override
	public User getAdherent(String email, String pass) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	public List<Seance> getSeancesAdh(int id) {		
		Connection conn=SingletonConnection.getConnection();
		List<Seance> seances=new ArrayList<Seance>();
		try {
			PreparedStatement ps= conn.prepareStatement("select jour,horaire,nom_act \r\n" + 
					"from seances s, facture f,moniteurs m,activites a\r\n" + 
					"where f.id_ad=? and year(date_facture)=year(now()) and confirmation=1 \r\n" + 
					"and month(date_facture)=month(now()) and s.id_seance=f.id_seance\r\n" + 
					"and m.id_moniteur=s.id_mon and a.id_act=m.id_activite");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Seance sea=new Seance();
				sea.setJour(rs.getString("jour"));
				sea.setHoraire(rs.getString("horaire"));
				sea.setNom_activite(rs.getString("nom_act"));
				seances.add(sea);
			}
			ps.close();
		}catch (Exception e) {
			System.out.println(e);
		}
		return seances;

	}



	

	@Override
	public int retardPaiement(int id_ad) {
		Connection conn=SingletonConnection.getConnection();
		Paiement pe= new Paiement();
		
		try {
			PreparedStatement ps= conn.prepareStatement("SELECT timestampdiff(day,date_paiement,now()) as \"nb de retard\" FROM paiement p , comptead c WHERE c.id_cad=p.id_adherent and p.id_adherent=? order by date_paiement DESC limit 1");
			ps.setInt(1, id_ad);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				pe.setNb_retard(rs.getInt("nb de retard"));
			}
			ps.close();
		}catch (Exception e) {
			System.out.println(e);
		}
		return pe.getNb_retard();
	}

	@Override
	public Date lastPaiement(int id_ad) {
		Connection conn=SingletonConnection.getConnection();
		Paiement pe= new Paiement();
		
		try { /*
				 * PreparedStatement ps1= conn.prepareStatement(" set lc_time_names='fr_FR'");
				 * ps1.executeUpdate();
				 */
		PreparedStatement ps= conn.prepareStatement("SELECT p.date_paiement FROM paiement p , inscription c WHERE c.Idinscrir=p.id_adherent and p.id_adherent=? order by p.date_paiement DESC limit 1");
			ps.setInt(1, id_ad);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				pe.setDate_p(rs.getDate("date_paiement"));
			}
			ps.close();
		}catch (Exception e) {
			System.out.println(e);
		}
		return pe.getDate_p();
	}

	@Override
	public List<Paiement> moisNonPayer(int id_ad) {
		
		Connection conn=SingletonConnection.getConnection();
		List<Paiement> mois=new ArrayList<Paiement>();
		try {
			PreparedStatement ps= conn.prepareStatement(" select date_format(TIMESTAMPADD(month, 1 ,date_paiement) + interval 1 day ,'Le %d %M %Y' ) as d, TIMESTAMPADD(month, 1 ,date_paiement) + interval 1 day  as \"dates\" from paiement where id_adherent=? order by date_paiement DESC limit 1 ");
			ps.setInt(1, id_ad);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Paiement sea=new Paiement();
				sea.setDate_p(rs.getDate("dates"));
				sea.setMois(rs.getString("d"));
			mois.add(sea);
			}
			ps.close();
		}catch (Exception e) {
			System.out.println(e);
		}
		return mois;	
		}
	public String getMois(int id_ad) {
		Connection conn=SingletonConnection.getConnection();
		Paiement sea=new Paiement();
		try {
			PreparedStatement ps1= conn.prepareStatement(" set lc_time_names='fr_FR'");
			 ps1.executeUpdate();
			PreparedStatement ps= conn.prepareStatement(" select monthname(now()) as  \"mois\" from paiement where id_adherent=?");
			ps.setInt(1, id_ad);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				sea.setMois(rs.getString("mois"));
				
			
			}
			ps.close();
		}catch (Exception e) {
			System.out.println(e);
		}
		return sea.getMois()	;
		
		
	}
	
	public List<Activite> getActiviter(int id_cad , Date d ) {
		List<Activite> act= new ArrayList<Activite>();
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("select id_act,nom_act,categorie,src_img,prix_activite,count(f.id_seance) as \"Nombre de seances\" \r\n" + 
					"from inscription i,facture f,activites a,seances s, moniteurs m,images im  where Idinscrir = ?"
					+ " and f.id_ad=Idinscrir and month(date_facture) =month(?) and year(date_facture) =year(?)"
					+ " and confirmation=1 and s.id_seance=f.id_seance and m.id_moniteur=s.id_mon and a.id_act=m.id_activite "
					+ "and im.id_img=a.id_img group by nomA,prenomA,nom_act ");
			
			
			
			ps.setInt(1, id_cad);
			ps.setDate(2, d);
			ps.setDate(3, d);
			
			ResultSet rs=ps.executeQuery();
			   while(rs.next()) {
				   Activite activite = new Activite();
				   activite.setId_act(rs.getInt("id_act"));			 
				   activite.setNom_activite(rs.getString("nom_act"));
					activite.setPrix_activite(rs.getDouble("prix_activite"));
					activite.setCategorie(rs.getString("categorie"));
					activite.setFile(rs.getString("src_img"));
					activite.setNb_seance(rs.getInt("Nombre de seances"));
					
				act.add(activite);
		   }
		}catch (SQLException e) {
			   e.printStackTrace();
			   }
		return act;
	}
	
	public List<Programme> getProgramme(int id_cad ,  Date d) {
		
		
		
		List<Programme> ent= new ArrayList<Programme>();
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("SELECT p.contenir,  p.nom_prog, p.id_prog , p.prix_prog, i.src_img FROM facture f , programme p, images i WHERE p.id_prog=f.id_prog and i.id_img= p.image and f.id_ad= ?  and month(f.date_facture) =month(?) and year(f.date_facture) =year(?)  and confirmation=1;");
			 ps.setInt(1, id_cad);
			 ps.setDate(2, d);
			 ps.setDate(3, d);
			ResultSet rs=ps.executeQuery();
		   while(rs.next()) {
			  Programme p = new Programme();
			  p.setId_prog(rs.getInt("id_prog"));
			  p.setNom_prog(rs.getString("nom_prog"));
			  p.setPrix_programme(rs.getDouble("prix_prog"));
			  p.setSrc_image(rs.getString("src_img"));
			  p.setPro(rs.getString("contenir"));
			  ent.add(p);
			}
	         
		   }
		   catch (SQLException e) {
			   e.printStackTrace();
			   }
		return ent;

	}
	public void enregistrerPaement(Paiement p) {
		
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("INSERT INTO paiement (montant,date_paiement,id_adherent) VALUES (?,current_timestamp, ? ) ");	
				ps.setDouble(1, p.getMontant());
			    ps.setInt(2, p.getId_cad());
			
			    ps.executeUpdate();
			    PreparedStatement ps2=conn.prepareStatement("Update facture set confirmation = 1 where id_ad=?");
			    ps2.setInt(1, p.getId_cad());
			
			    ps2.executeUpdate();
			    PreparedStatement ps3=conn.prepareStatement("DELETE FROM facture where confirmation = 0");
			    ps3.executeUpdate();
			    PreparedStatement ps4=conn.prepareStatement("DELETE FROM entrainer where id_cad = ?");
			    ps4.setInt(1, p.getId_cad());
			    ps4.executeUpdate();
			    PreparedStatement ps5=conn.prepareStatement("DELETE FROM entrainerpro where id_cad = ?");
			    ps5.setInt(1, p.getId_cad());
			    ps5.executeUpdate();
			    ps.close();
			    ps2.close();
			    ps3.close();
				ps4.close();
				ps5.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	
	
	@Override
	public Date getDatte(int id_ad) {
		Connection conn=SingletonConnection.getConnection();
		Paiement paie=new Paiement();
		try {
		
			PreparedStatement ps= conn.prepareStatement("select date_facture from facture where id_ad=? and confirmation =1 order by date_facture desc limit 1");
			ps.setInt(1, id_ad);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				paie.setDate_p(rs.getDate("date_facture"));
				
			
			}
			ps.close();
		}catch (Exception e) {
			System.out.println(e);
		}
		return paie.getDate_p()	;
		
	}
	
	
	

	@Override
	public Date changerForma(Date d1) {
		Connection conn=SingletonConnection.getConnection();
		Paiement paie=new Paiement();
		try {
			PreparedStatement ps= conn.prepareStatement("select date_format('?' , get_format(Date , 'jis') as dates");
			ps.setDate(1, d1);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				paie.setDate_p(rs.getDate("dates"));
				
			
			}
			ps.close();
		}catch (Exception e) {
			System.out.println(e);
		}
		return paie.getDate_p()	;
	}

	public int getMoo(int id_cad , int id_act) {
		Connection conn=SingletonConnection.getConnection();
	Entrainer entrainer = new Entrainer();
		try {
			
			PreparedStatement ps=conn.prepareStatement("select count(f.id_seance) as mont from seances s , facture f , activites a , moniteurs m where f.id_ad=? and f.id_seance=s.id_seance and s.id_mon=m.id_moniteur and m.id_activite=a.id_act and id_act=?");
			 ps.setInt(1, id_cad);
			 ps.setInt(2, id_act);
			ResultSet rs=ps.executeQuery();
		   if(rs.next()) {
			
			  entrainer.setMont(rs.getInt("mont"));
			   
			  
			}
            
		   }
		   catch (SQLException e) {
			   e.printStackTrace();
			   }
		
		return  entrainer.getMont();}
	
	public void deleteInfoProgramme(int id_ad, int id_pro) {
		Connection conn=SingletonConnection.getConnection();
		try {
		
			PreparedStatement ps2=conn.prepareStatement("DELETE FROM facture  WHERE id_ad= ? and id_prog= ?");
			ps2.setInt(1, id_ad);
			ps2.setInt(2, id_pro);
			ps2.executeUpdate();
			
			ps2.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
		
	public void deleteInfoSeance(int id_ad, int id_act) {
		Connection conn=SingletonConnection.getConnection();
		try {
			
			PreparedStatement ps2=conn.prepareStatement("DELETE FROM facture WHERE id_ad = ? and id_seance  IN (select s.id_seance FROM entrainer e , activites a, moniteurs m , seances s where s.id_mon=m.id_moniteur and m.id_activite=a.id_act and s.id_seance=e.id_seance and a.id_act =? ");
			ps2.setInt(1, id_ad);
			ps2.setInt(2, id_act );
			ps2.executeUpdate();
			
			ps2.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		

		
	}

	@Override
	public List<Paiement> mesFactures(int id_ad) {
		
		Connection conn=SingletonConnection.getConnection();
		List<Paiement> mois=new ArrayList<Paiement>();
		try {PreparedStatement ps1= conn.prepareStatement(" set lc_time_names='fr_FR'");
		     ps1.executeUpdate();
			PreparedStatement ps= conn.prepareStatement(" select  id_paiement, date_format(date_paiement,' %d %M %Y' ) as date, date_paiement from paiement where id_adherent=? order by date_paiement ASC");
			ps.setInt(1, id_ad);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Paiement sea=new Paiement();
				sea.setId_p(rs.getInt("id_paiement"));
				sea.setMois(rs.getString("date"));;
				sea.setDate_p(rs.getDate("date_paiement"));
			mois.add(sea);
			}
			ps.close();
		}catch (Exception e) {
			System.out.println(e);
		}
		return mois;	
	}

	@Override
	public List<Article> afficherNews() {
		Connection conn=SingletonConnection.getConnection();
		List<Article> artic=new ArrayList<>();
		try {PreparedStatement ps1= conn.prepareStatement(" set lc_time_names='fr_FR'");
	     ps1.executeUpdate();
			PreparedStatement ps= conn.prepareStatement(" select n.id_n, n.contenu_n, n.titre_n ,im.src_img , date_format(date_n,'Le %d %M %Y' ) as datte from newsletters n , images im where im.id_img=n.id_img order by date_n DESC limit 4 ");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Article art=new Article();
				art.setContenu_n(rs.getString("contenu_n"));
				art.setDate(rs.getString("datte"));
				art.setId_n(rs.getInt("id_n"));
				art.setTitre_n(rs.getString("titre_n"));
				art.setImg(rs.getString("src_img"));
				artic.add(art);
			}
			
			
			
		}catch (Exception e) {
			System.out.println(e);
		}
		return artic;
	}
	

	@Override
	public List<Article> afficherAllNews() {
		Connection conn=SingletonConnection.getConnection();
		List<Article> artic=new ArrayList<>();
		try {PreparedStatement ps1= conn.prepareStatement(" set lc_time_names='fr_FR'");
	     ps1.executeUpdate();
			PreparedStatement ps= conn.prepareStatement(" select n.id_n, n.contenu_n, n.titre_n ,im.src_img , Concat(LEFT(contenu_n,50),'....') as chaine, date_format(date_n,'Le %d %M %Y à %r' ) as datte from newsletters n , images im where im.id_img=n.id_img order by date_n DESC  ");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Article art=new Article();
				art.setContenu_n(rs.getString("contenu_n"));
				art.setDatee(rs.getString("datte"));
				art.setId_n(rs.getInt("id_n"));
				art.setTitre_n(rs.getString("titre_n"));
				art.setImg(rs.getString("src_img"));
				art.setChaine(rs.getString("chaine"));
				artic.add(art);
			}
			
			
			
		}catch (Exception e) {
			System.out.println(e);
		}
		return artic;
	}

	@Override
	public Article moreNews(int idn) {
		Connection conn=SingletonConnection.getConnection();
		Article p=new Article();
		try {PreparedStatement ps= conn.prepareStatement(" set lc_time_names='fr_FR'");
	     ps.executeUpdate();
			
			PreparedStatement ps1= conn.prepareStatement(" select n.titre_n,n.contenu_n,im.src_img, date_format(date_n,'Le %d %M %Y' ) as datte from newsletters n , images im where im.id_img=n.id_img and n.id_n=?");
			ps1.setInt(1, idn);
			ResultSet rs = ps1.executeQuery();
			while(rs.next()) {
				p.setTitre_n(rs.getString("titre_n"));
				p.setContenu_n(rs.getString("contenu_n"));
				p.setImg(rs.getString("src_img"));
				p.setDate(rs.getString("datte"));
				
			}
			
			
			
		}catch (Exception e) {
			System.out.println(e);
		}
		return p;
	}

	@Override
	public double getPaiement(int id_ad, Date d) {
		Connection conn=SingletonConnection.getConnection();
	  Paiement p= new Paiement();
		try {
			
			PreparedStatement ps1= conn.prepareStatement(" select montant from paiement  where id_adherent=? and month(date_paiement) =month(?) and year(date_paiement) =year(?)");
			ps1.setInt(1, id_ad);
			ps1.setDate(2, d);
			ps1.setDate(3, d);
			
			ResultSet rs = ps1.executeQuery();
			while(rs.next()) {
				p.setMontant(rs.getDouble("montant"));
				
			}
			
			
			
		}catch (Exception e) {
			System.out.println(e);
		}
		return p.getMontant();
	}


	public void modifierEmail1(int id,String em) {
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps= conn.prepareStatement("update inscription set emailA =? where Idinscrir=?");
			ps.setString(1, em);
			ps.setLong(2,id);
			ps.executeUpdate();
			ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	public void modifierPass1(int id,String mot) {
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps= conn.prepareStatement("update inscription set password1 =? where Idinscrir=?");
			ps.setString(1, mot);
			ps.setLong(2,id);
			ps.executeUpdate();
			ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	@Override
	public String verifierEmail(int id_ad ) {
		Connection conn=SingletonConnection.getConnection();
		User u=new User();
		try {
			PreparedStatement ps= conn.prepareStatement("select emailA from inscription  where Idinscrir=?");
			ps.setLong(1,id_ad);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
			  u.setEmail(rs.getString("emailA"));
			}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return u.getEmail();
	}

	@Override
	public String verifierPass(int id_ad) {
		Connection conn=SingletonConnection.getConnection();
		User u=new User();
		try {
			PreparedStatement ps= conn.prepareStatement("select password1 from inscription  where Idinscrir=?");
			ps.setLong(1,id_ad);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
			  u.setPassword(rs.getString("password1"));
			}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return u.getPassword();
	}

	@Override
	public int testerPanier(int id, double m) {
		Connection conn=SingletonConnection.getConnection();
		
		int status=0;
		try {
			PreparedStatement ps= conn.prepareStatement("select id_adherent , montant , date_paiement from paiement where  id_adherent=?  and montant=? and "
					+ " month(date_paiement) =month(now()) and year(date_paiement) =year(now()) ");
			ps.setInt(1,id);
			ps.setDouble(2, m);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				status=1;
			  
			}else {
				status=0;
			}
			
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return status;
	}
	
	
	public List<User> reporterUser(int ids) {
		Connection conn=SingletonConnection.getConnection();
		List<User> users = new ArrayList<>();
		try {
			PreparedStatement ps= conn.prepareStatement("select id_ad from facture f \r\n" + 
					"where id_seance= ? \r\n" + 
					"and month(date_facture)=month(now())\r\n" + 
					"and year(date_facture)=year(now())\r\n" + 
					"");
			ps.setInt(1, ids);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User a=new User();
				a.setIda(rs.getInt("id_ad"));
				users.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}
	
	public List<Seance> getAllSeanceAdh2( int id_ad) {
		List<Seance> seance= new ArrayList<Seance>();
		
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps1= conn.prepareStatement(" set lc_time_names='fr_FR'");
		     ps1.executeUpdate();
		PreparedStatement ps= conn.prepareStatement("select s.id_seance , s.jour , s.horaire , m.nom_moniteur, m.prenom_moniteur , a.nom_act "
				+ " from facture f,seances s, moniteurs m , activites a where s.id_seance=f.id_seance and m.id_moniteur=s.id_mon and a.id_act=m.id_activite "
				+ " and  month(date_facture) =month(now()) and year(date_facture) =year(now()) and s.jour like dayname(now()) "
				+ " and confirmation=1 and f.id_ad=? ");
		 ps.setInt(1, id_ad);
	
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
		Seance sea=new Seance();
		sea.setId_seance(rs.getInt("id_seance"));
		sea.setJour(rs.getString("jour"));
	    sea.setHoraire(rs.getString("horaire"));
	    sea.setNom_mon(rs.getString("nom_moniteur"));
	    sea.setPrenom_mon(rs.getString("prenom_moniteur"));
	    sea.setNom_activite(rs.getString("nom_act"));
		
	    
		seance.add(sea);
		}
		} catch (SQLException e) {
		e.printStackTrace();
		}
		return seance;
	}
	
	public Boolean hasNotifs(int ida) {// vérifier si l'adherent a des notifs
		Boolean state=false;
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps= conn.prepareStatement("select id_notif from notifications n,facture f where id_ad =?  \r\n" + 
					"and f.id_seance=n.id_seance and month(date_facture)=month(now()) and year(date_facture)=year(now())");
			ps.setInt(1, ida);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				state=true;
			}
			ps.close();			
		}catch (Exception e) {
			System.out.println(e);
		}	
		return state;
	}

	@Override
	public List<Notification> getNotif1(int ida) {//les notifs des séances ajoutées pour adherent
		List<Notification> notifs=new ArrayList<Notification>();
		int comp=0;
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps= conn.prepareStatement("select DISTINCT a.id_act,texte_notif ,n.id_seance, a.nom_act,time_format(date_notif, '%h:%i %p') as dat  from notifications n,facture f, moniteurs m, activites a,seances s\r\n" + 
					"where f.id_ad=? and\r\n" + 
					"s.id_seance=n.id_seance\r\n" + 
					"and m.id_moniteur=s.id_mon\r\n" + 
					"and a.id_act=m.id_activite\r\n" + 
					"and a.id_act in (select DISTINCT a.id_act from activites a, moniteurs m,seances s, facture f \r\n" + 
					"where f.id_ad=?\r\n" + 
					"and s.id_seance=f.id_seance\r\n" + 
					"and s.id_mon = m.id_moniteur\r\n" + 
					"and m.id_activite=a.id_act ) and\r\n" + 
					"month(date_facture)=month(now()) and year(date_facture)=year(now()) and action=1 and timestampdiff(day,date_notif,now())<7 ");
			ps.setInt(1, ida);
			ps.setInt(2, ida);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Notification noti=new Notification();
				comp++;
				noti.setTexte_notif(rs.getString("texte_notif"));
				noti.setTime(rs.getString("dat"));
				noti.setId_activite(rs.getInt("id_act"));
				noti.setNom_activite(rs.getString("nom_act"));
				noti.setId_seance(rs.getInt("id_seance"));
				noti.setId_notif(comp);
				notifs.add(noti);
				
				
			}
		}catch (Exception e) {
			System.out.println(e);
		}						
		return notifs;
	}
	
	public List<Notification> getNotif2(int ida) {//les notifs des séances reportés pour adherent
		List<Notification> notifs=new ArrayList<Notification>();
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps= conn.prepareStatement("select texte_notif ,f.id_seance,a.id_act, a.nom_act, time_format(date_notif, '%h:%i %p') as dat from notifications n,facture f , moniteurs m , seances s , activites a where f.id_ad=? "
					+ "and s.id_seance=f.id_seance and reporter>now()   and n.id_seance=f.id_seance "
					+ "  and n.id_seance=s.id_seance and m.id_moniteur=s.id_mon and m.id_activite=a.id_act and month(date_facture)=month(now()) and year(date_facture)=year(now()) and action=2  ");
			ps.setInt(1, ida);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Notification noti=new Notification();
				noti.setTexte_notif(rs.getString("texte_notif"));
				noti.setId_activite(rs.getInt("id_act"));
				noti.setNom_activite(rs.getString("nom_act"));
				noti.setId_seance(rs.getInt("id_seance"));
				noti.setTime(rs.getString("dat"));
				notifs.add(noti);
			}
		}catch (Exception e) {
			System.out.println(e);
		}						
		return notifs;
	}
	
	public Article getLastNews() {
		Connection conn=SingletonConnection.getConnection();
		Article news=new Article();
		try {
			PreparedStatement ps= conn.prepareStatement("select id_n,titre_n, time_format(date_n, '%h:%i %p') as dat from newsletters order by date_n desc limit 1");
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				news.setId_n(rs.getInt("id_n"));
				news.setTitre_n(rs.getString("titre_n"));
				news.setDatee(rs.getString("dat"));
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		return news;
	}
	public void deteteAcount(int id) {
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("DELETE FROM inscription WHERE Idinscrir=?");
			ps.setInt(1, id);
			
			ps.executeUpdate();
			ps.close();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}

	

	@Override
	public List<Activite> gettt(int id_ad) {
List<Activite> actt= new ArrayList<Activite>();
		
		Connection conn=SingletonConnection.getConnection();
		try {
		    
		PreparedStatement ps= conn.prepareStatement("select a.id_act from activites a, moniteurs m,seances s, facture f \r\n" + 
				"where f.id_ad=?\r\n" + 
				"and s.id_seance=f.id_seance\r\n" + 
				"and s.id_mon = m.id_moniteur\r\n" + 
				"and m.id_activite=a.id_act");
		ps.setInt(1, id_ad);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Activite noti=new Activite();
			noti.setId_act(rs.getInt("id_act"));
			actt.add(noti);
		}
	}catch (Exception e) {
		System.out.println(e);
	}						
	return actt;
	
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	

}
