package com.club.dao;



import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.club.metie.*;


public class ImplementeAdminDAO implements AdminDAO{

	public int logging(User u) {
		int status=0;
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps= conn.prepareStatement("select * from admins where email= ? and password =?");
			ps.setString(1, u.getEmail());
			ps.setString(2, u.getPassword());			
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) 
				status=1;
			else {
				PreparedStatement ps1= conn.prepareStatement("select Idinscrir,nomA,prenomA,sexe,gsm,emailA,password1 from inscription,comptead where Idinscrir=id_cad and emailA= ? and password1 =?");
				ps1.setString(1, u.getEmail());
				ps1.setString(2, u.getPassword());				
				System.out.println(ps);
				ResultSet rs1 = ps1.executeQuery();				
				if(rs1.next()) 
					status=2;
			}			
		}catch (Exception e) {
			System.out.println("erreur fonction BD");
			System.out.println(e);
		}
		return status;		
	}

	public List<User> getAdmin(String email, String password) {
		Connection conn=SingletonConnection.getConnection();
		List<User> uu=new ArrayList<User>();
		try {
			PreparedStatement ps= conn.prepareStatement("select * from admins where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			User u=new User();
			u.setIdu(rs.getInt("idu"));
			u.setNom(rs.getString("nom"));
			u.setPrenom(rs.getString("prenom"));
			u.setEmail(rs.getString("email"));
			u.setPassword(rs.getString("password"));
			uu.add(u);
		}
            ps.close();  		
		}catch (Exception e) {
			System.out.println(e);
		}
		return uu;
	}
	
	
	public List<User> getAllAdhActivite(){//les adherents inscrits aux activités
		List<User> adhs= new ArrayList<User>();
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps= conn.prepareStatement("select Idinscrir,nomA,prenomA,sexe,gsm,emailA,nom_act \r\n" + 
					"from inscription,facture f,seances s,moniteurs m,activites a \r\n" + 
					"where Idinscrir=f.id_ad and confirmation=1\r\n" + 
					"and s.id_seance=f.id_seance and id_moniteur=id_mon \r\n" + 
					"and id_act=id_activite group by nomA,prenomA,nom_act ");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				User in=new User();
				in.setIdu(rs.getInt("Idinscrir"));
				in.setNom(rs.getString("nomA"));
				in.setPrenom(rs.getString("prenomA"));
				in.setSexe(rs.getString("sexe"));
				in.setGsm(rs.getInt("gsm"));
				in.setEmail(rs.getString("emailA"));
				in.setSport(rs.getString("nom_act"));
				adhs.add(in);
			}
		
		}catch (Exception e) {
			System.out.println(e);
		}
		return adhs;
	}
	
	public List<User> getAllAdhProgramme(){// les adherent inscris aux programmes
		List<User> adhs= new ArrayList<User>();
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps= conn.prepareStatement(" select Idinscrir,nomA,prenomA,sexe,gsm,emailA,nom_prog \r\n" + 
					"from inscription,facture f,programme p where Idinscrir=f.id_ad \r\n" + 
					"and confirmation=1 and p.id_prog=f.id_prog ");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				User in=new User();
				in.setIdu(rs.getInt("Idinscrir"));
				in.setNom(rs.getString("nomA"));
				in.setPrenom(rs.getString("prenomA"));
				in.setSexe(rs.getString("sexe"));
				in.setGsm(rs.getInt("gsm"));
				in.setEmail(rs.getString("emailA"));
				in.setSport(rs.getString("nom_prog"));
				adhs.add(in);
			}
		
		}catch (Exception e) {
			System.out.println(e);
		}
		return adhs;
	}
	
	public List<User> getAllMoniteurs(){
		List<User> moniteurs= new ArrayList<User>();
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps= conn.prepareStatement("select id_moniteur,nom_moniteur,prenom_moniteur,email_moniteur,nom_act from moniteurs,activites where id_activite=id_act order by id_moniteur desc ");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				User in=new User();
				in.setIdu(rs.getInt("id_moniteur"));
				in.setNom(rs.getString("nom_moniteur"));
				in.setPrenom(rs.getString("prenom_moniteur"));
				in.setEmail(rs.getString("email_moniteur"));
				in.setSport(rs.getString("nom_act"));
				
				moniteurs.add(in);
			}
		
		}catch (Exception e) {
			System.out.println(e);
		}
		return moniteurs;
	}
	
//	public List<User> moniteursParMC(String mc) {
//		List<User> moniteurs= new ArrayList<User>();
//		Connection conn=SingletonConnection.getConnection();
//		try {
//			PreparedStatement ps= conn.prepareStatement("select idu_mo,nom_mo,prenom_mo,email_mo from moniteurs where nom_mo LIKE ? order by idu_mo desc ");
//		ps.setString(1, "%"+mc+"%");
//		ResultSet rs = ps.executeQuery();
//		while (rs.next()) {
//			User in=new User();
//			in.setIdu(rs.getInt("idu_mo"));
//			in.setNom(rs.getString("nom_mo"));
//			in.setPrenom(rs.getString("prenom_mo"));
//			in.setEmail(rs.getString("email_mo"));
//			moniteurs.add(in);
//		}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return moniteurs;
//	}
	
	public User ajouterMoniteur(User eq) {
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("INSERT INTO moniteurs (nom_moniteur,prenom_moniteur,id_activite,email_moniteur) VALUES (?,?,?,?)");			
			ps.setString(1,eq.getNom() );
			ps.setString(2,eq.getPrenom() );
			ps.setInt(3,eq.getIda());
			ps.setString(4,eq.getEmail());
			ps.executeUpdate();
			PreparedStatement ps2= conn.prepareStatement ("SELECT MAX(id_moniteur) as MAX_ID FROM moniteurs");
					ResultSet rs =ps2.executeQuery();
					if (rs.next()) {
						eq.setIdu(rs.getInt("MAX_ID"));
					}
					ps.close();
					ps2.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return eq;
	}
	
	public void deleteMoniteur(int id) {
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps= conn.prepareStatement("DELETE FROM moniteurs WHERE id_moniteur = ?");
			ps.setLong(1, id);
			ps.executeUpdate();
			ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	
	public int getIDsport(String s) {
		Connection conn=SingletonConnection.getConnection();
		Activite ac=new Activite();
		try {
			PreparedStatement ps= conn.prepareStatement("select id_act from activites where nom_act like ?");
			ps.setString(1, s);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				ac.setId_act(rs.getInt("id_act"));
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		return ac.getId_act();
	}
	
	public void affecterMoniteur(int ids,String nom,String prenom) {
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("update seances set id_mon=(select id_moniteur from moniteurs where nom_moniteur=? and prenom_moniteur=?) where id_seance=? ");
			ps.setString(1, nom);
			ps.setString(2, prenom);
			ps.setInt(3, ids);
			ps.executeUpdate();
			ps.close();
		}catch (Exception e) {
			System.out.println(e);
		}
	}
	
//	public Seance getSeance(String j,String h) {
//		Connection conn=SingletonConnection.getConnection();
//		Seance s = new Seance();
//		try {
//			PreparedStatement ps=conn.prepareStatement("select id_s,jour,horaire1 from seances where jour like ? and horaire1=? and id_a=id_ac");
//			ps.setString(1, "%"+j+"%");
//			ps.setString(2, h);
//			ResultSet rs = ps.executeQuery();
//			if (rs.next()) {
//				s.setIds(rs.getInt("id_s"));
//				s.setJour(rs.getString("jou"));
//				s.setHoraire1(rs.getString("horaire1"));
//			}
//			
//		}catch (Exception e) {
//			System.out.println(e);
//		}
//		return s;
//	}
	
//	public User getMoniteur(int id) {
//		Connection conn=SingletonConnection.getConnection();
//		User p = new User();
//		try {
//			PreparedStatement ps= conn.prepareStatement("select * from moniteurs where idu_mo = ?");
//			ps.setInt(1, id);
//			ResultSet rs = ps.executeQuery();
//			if (rs.next()) {
//				p.setIdu(rs.getInt("idu_mo"));
//				p.setNom(rs.getString("nom_mo"));
//				p.setPrenom(rs.getString("prenom_mo"));
//				p.setEmail(rs.getString("email_mo"));
//				p.setPassword(rs.getString("password_mo"));
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return p;
//	}
	
	public List<Seance> seancesParMC(String mc) {
		List<Seance> Seances= new ArrayList<Seance>();
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps= conn.prepareStatement("select id_seance,jour,horaire from seances,activites where id_act=id_activite and nom_act LIKE ? ");
		ps.setString(1, "%"+mc+"%");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Seance in=new Seance();
			in.setId_seance(rs.getInt("id_seance"));
			in.setJour(rs.getString("jour"));
			in.setHoraire(rs.getString("horaire"));
			Seances.add(in);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Seances;
	}
	
	public List<Seance> getAllseances() {
		List<Seance> Seances= new ArrayList<Seance>();
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps= conn.prepareStatement("select id_seance,jour,horaire,nom_moniteur,prenom_moniteur,nom_act from seances,moniteurs,activites where id_mon=id_moniteur and id_activite=id_act ");
			ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Seance in=new Seance();
			in.setId_seance(rs.getInt("id_seance"));
			in.setJour(rs.getString("jour"));
			in.setHoraire(rs.getString("horaire"));
			in.setNom_mon(rs.getString("nom_moniteur"));
			in.setPrenom_mon(rs.getString("prenom_moniteur"));
			in.setNom_activite(rs.getString("nom_act"));
			Seances.add(in);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Seances;
	}

	
	public Seance getSeanceID(int ids) {
		Connection conn=SingletonConnection.getConnection();
		Seance sea=new Seance();
		try {
			PreparedStatement ps=conn.prepareStatement("select id_seance,jour,horaire from seances where id_seance=?");
			ps.setInt(1, ids);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				sea.setId_seance(rs.getInt("id_seance"));
				sea.setJour(rs.getString("jour"));
				sea.setHoraire(rs.getString("horaire"));
			}
		}catch (Exception e) {
			System.out.println(e);
		}
		return sea;
	}

	@Override
	public Seance addSeance(Seance s) {
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("insert into seances (jour,horaire) values (?,?)");
			ps.setString(1,s.getJour());
			ps.setString(2, s.getHoraire());
			ps.executeUpdate();
			PreparedStatement ps2= conn.prepareStatement ("SELECT MAX(id_seance) as MAX_ID FROM seances");
			ResultSet rs =ps2.executeQuery();
			if (rs.next()) {
				s.setId_seance(rs.getInt("MAX_ID"));
			}
			ps.close();
			ps2.close();
		}catch (Exception e) {
			System.out.println(e);
		}
		return s;
	}

	@Override
	public List<Seance> getAllseances1() {
		List<Seance> Seances= new ArrayList<Seance>();
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps= conn.prepareStatement("select id_seance,jour,horaire from seances where id_mon is null  ");
			ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Seance in=new Seance();
			in.setId_seance(rs.getInt("id_seance"));
			in.setJour(rs.getString("jour"));
			in.setHoraire(rs.getString("horaire"));
			Seances.add(in);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return Seances;
	}

	@Override
	public void deleteSeance(int id) {
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps= conn.prepareStatement("DELETE FROM seances WHERE id_seance = ?");
			ps.setLong(1, id);
			ps.executeUpdate();
			ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
	}

	@Override
	public void modifierEmail1(int id,String em) {
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps= conn.prepareStatement("update admins set email =? where idu=?");
			ps.setString(1, em);
			ps.setLong(2,id);
			ps.executeUpdate();
			ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	@Override
	public void modifierPass1(int id,String mot) {
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps= conn.prepareStatement("update admins set password =? where idu=?");
			ps.setString(1, mot);
			ps.setLong(2,id);
			ps.executeUpdate();
			ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	public void reporterSeance(int id,String d) {
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps= conn.prepareStatement("update seances set reporter=? where  id_seance=?");
			ps.setString(1, d);
			ps.setInt(2, id);
			ps.executeUpdate();
			ps.close();
			
		}catch (Exception e) {
			System.out.println(e);
		}
		
	}

	@Override
	public User getAdherent(int id) { //afficher info adh par id d'adh
		Connection conn=SingletonConnection.getConnection();
		User adh=new User();
		try {
			PreparedStatement ps=conn.prepareStatement("select nomA,prenomA,sexe,gsm,emailA from inscription,facture where idInscrir=? and idInscrir=id_ad and confirmation=1");
			ps.setInt(1, id);					
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				adh.setNom(rs.getString("nomA"));
				adh.setPrenom(rs.getString("prenomA"));
				adh.setSexe(rs.getString("sexe"));
				adh.setGsm(rs.getInt("gsm"));
				adh.setEmail(rs.getString("emailA"));
				}
		}catch (Exception e) {
			System.out.println(e);
		}
		return adh;		
	}
	
	public User getAdherent1(int id) { //afficher info adh par id de paiement
		Connection conn=SingletonConnection.getConnection();
		User adh=new User();
		try {
			PreparedStatement ps=conn.prepareStatement("select nomA,prenomA,sexe,gsm,emailA from inscription,paiement where id_paiement=? and idInscrir=id_adherent");
			ps.setInt(1, id);					
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				adh.setNom(rs.getString("nomA"));
				adh.setPrenom(rs.getString("prenomA"));
				adh.setSexe(rs.getString("sexe"));
				adh.setGsm(rs.getInt("gsm"));
				adh.setEmail(rs.getString("emailA"));
				}
		}catch (Exception e) {
			System.out.println(e);
		}
		return adh;		
	}
	
	public List<Activite> getActiviteAdh(int id,Date d1) { //les activites d'un adherent par son id 
		Connection conn=SingletonConnection.getConnection();
		List<Activite> activs=new ArrayList<Activite>();
		try {
			PreparedStatement ps=conn.prepareStatement("select nom_act,prix_activite,count(f.id_seance) from activites a,facture f,seances s,moniteurs m "
					+ "where month(?)=month(date_facture) and year(?)=year(date_facture) and f.id_ad=?  and s.id_seance=f.id_seance "
					+ "and id_moniteur=id_mon and id_act=id_activite group by nom_act");
			ps.setDate(1, d1);
			ps.setDate(2, d1);
			ps.setInt(3, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Activite act=new Activite();
				act.setNom_activite(rs.getString("nom_act"));
				act.setPrix_activite(rs.getDouble("prix_activite"));
				act.setNb_seance(rs.getInt("count(f.id_seance)"));
				activs.add(act);
				}
		}catch (Exception e) {
			System.out.println(e);
		}
		return activs;		
	}
	
	public  List<Activite> getProgAdh(int id,Date d1) {//le  programme d'un adherent à partir de son id 
		Connection conn=SingletonConnection.getConnection();
		List<Activite> activs=new ArrayList<Activite>();
		try {
			PreparedStatement ps=conn.prepareStatement("select nom_prog,prix_prog from programme p,facture f "
					+ "where month(?)=month(date_facture) and year(?)=year(date_facture) and f.id_ad=? and  p.id_prog=f.id_prog");
			ps.setDate(1, d1);
			ps.setDate(2, d1);
			ps.setInt(3, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Activite act=new Activite();
				act.setNom_activite(rs.getString("nom_prog"));
				act.setPrix_activite(rs.getDouble("prix_prog"));
				activs.add(act);
				}
		}catch (Exception e) {
			System.out.println(e);
		}
		return activs;		
	}
	
	public Subject saveSubject(Subject su) {
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("INSERT INTO subject(nom , email, sujet) VALUES(?,?,?)");
			ps.setString(1, su.getNom());
			ps.setString(2, su.getEmail());
			ps.setString(3, su.getSujet());
			ps.executeUpdate();
			PreparedStatement ps2= conn.prepareStatement("SELECT MAX(idSujet) as MAX_ID FROM subject");
					ResultSet rs =ps2.executeQuery();
					if (rs.next()) {
					su.setIdSujet(rs.getInt("Max_ID"));
					}
					ps.close();
					ps2.close();
					} catch (SQLException e) {
					e.printStackTrace();
					}
					return su;
			}
	
	public Inscription saveAdherant(Inscription in) {
        Connection conn=SingletonConnection.getConnection();
        	try {
        		PreparedStatement ps=conn.prepareStatement("INSERT INTO inscription(nomA , prenomA, sexe,gsm,emailA,password1) VALUES(?,?,?,?,?,?)");
    			ps.setString(1, in.getNomA());
    			ps.setString(2, in.getPrenomA());
    			ps.setString(3, in.getSexe());
    			ps.setString(4, in.getGsm());
    			ps.setString(5, in.getEmailA());
    			ps.setString(6, in.getPassword1());
    			ps.executeUpdate();
    			PreparedStatement ps2= conn.prepareStatement("SELECT MAX(Idinscrir) as MAX_ID FROM inscription");
    					ResultSet rs =ps2.executeQuery();
    					if (rs.next()) {
    					in.setIdinscrir(rs.getInt("Max_ID"));        
    					}
    					ps.close();
    					ps2.close();
    					} catch (SQLException e) {
    					e.printStackTrace();
    					}
        	
        	return in;
	}

public List<Inscription> getAllAdh(){
	List<Inscription> adhs= new ArrayList<Inscription>();
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps= conn.prepareStatement("select distinct Idinscrir,nomA,prenomA,sexe,gsm,emailA from inscription,facture where Idinscrir=id_ad and confirmation=1 ");
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Inscription in=new Inscription();
			in.setIdinscrir(rs.getInt("Idinscrir"));
			in.setNomA(rs.getString("nomA"));
			in.setPrenomA(rs.getString("prenomA"));
			in.setSexe(rs.getString("sexe"));
			in.setGsm(rs.getString("gsm"));
			in.setEmailA(rs.getString("emailA"));
			adhs.add(in);
		}
	
	}catch (Exception e) {
		System.out.println(e);
	}
	return adhs;
}

@Override
public Article ajouterArticle(Article a, Images img) {
		Connection conn=SingletonConnection.getConnection();
		try {
			 PreparedStatement ps1=conn.prepareStatement("INSERT INTO images (src_img) VALUES (?)");			
				ps1.setString(1,img.getSrc_image() );
				
				ps1.executeUpdate();
				PreparedStatement ps2= conn.prepareStatement ("SELECT MAX(id_img) as MAX_ID FROM images");
						ResultSet rs =ps2.executeQuery();
						if (rs.next()) {
							img.setId(rs.getInt("MAX_ID"));
						}			
				PreparedStatement ps=conn.prepareStatement("INSERT INTO newsletters (titre_n,contenu_n,id_img,date_n) VALUES (?,?,?,now())");			
				ps.setString(1,a.getTitre_n() );
				ps.setString(2,a.getContenu_n() );
				ps.setInt(3, img.getId());
				ps.executeUpdate();
				ps.close();
				ps2.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return a;
}

@Override
public void deleteArticle(int id) {
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps= conn.prepareStatement("DELETE FROM newsletters WHERE id_n = ?");
		ps.setLong(1, id);
		ps.executeUpdate();
		ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
}

public List<Article> articlesParMC(String mc) {
	List<Article> prods= new ArrayList<Article>();
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps= conn.prepareStatement("select * from newsletters where titre_n LIKE ? order by id_n desc ");
	ps.setString(1, "%"+mc+"%");
	ResultSet rs = ps.executeQuery();
	while (rs.next()) {
		Article p = new Article();
		p.setId_n(rs.getInt("id_n"));
		p.setTitre_n(rs.getString("titre_n"));
		p.setContenu_n(rs.getString("contenu_n"));
		p.setDate_n(rs.getDate("date_n"));
		prods.add(p);
	}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return prods;
}

public Article updateArticle(Article p) {
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps= conn.prepareStatement("UPDATE newsletters SET titre_n=?,contenu_n=? WHERE id_n=?");
		ps.setString(1, p.getTitre_n());
		ps.setString(2, p.getContenu_n());
		ps.setInt(3, p.getId_n());
		ps.executeUpdate();
		ps.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return p;
}

public List<Article> getAllArticles() {
	
	List<Article> prods= new ArrayList<Article>();
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps= conn.prepareStatement("select * from newsletters order by id_n desc ");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Article p = new Article();
			p.setId_n(rs.getInt("id_n"));
			p.setTitre_n(rs.getString("titre_n"));
			p.setContenu_n(rs.getString("contenu_n"));
			p.setDate_n(rs.getDate("date_n"));				
			prods.add(p);
		}
	} catch (SQLException e) {
		System.out.println("metier_impl");
		e.printStackTrace();
	}
	return prods;
}

public Article getNews(int id) {
	Connection conn=SingletonConnection.getConnection();
	Article p = new Article();
	try {
		PreparedStatement ps= conn.prepareStatement("select * from newsletters where id_n = ?");
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			p.setId_n(rs.getInt("id_n"));
			p.setTitre_n(rs.getString("titre_n"));
			p.setContenu_n(rs.getString("contenu_n"));
			p.setDate_n(rs.getDate("date_n"));
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return p;
}

@Override
public List<Subject> getAllMessages() {
	List<Subject> prods= new ArrayList<Subject>();
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps= conn.prepareStatement("select * from subject order by IdSujet desc ");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Subject p = new Subject();
			p.setIdSujet(rs.getInt("idSujet"));
			p.setNom(rs.getString("nom"));
			p.setEmail(rs.getString("email"));
			p.setSujet(rs.getString("sujet"));
			p.setDate_s(rs.getString("date_s"));				
			prods.add(p);
		}
	} catch (SQLException e) {
		System.out.println("metier_impl");
		e.printStackTrace();
	}
	return prods;
}

public List<Paiement> getPaiement(int id){
	Connection conn=SingletonConnection.getConnection();	
	List<Paiement> prods= new ArrayList<Paiement>();
	try {
		PreparedStatement ps= conn.prepareStatement("select id_adherent,montant,date_paiement from paiement where id_adherent= ? order by date_paiement desc ");
		ps.setInt(1,id);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Paiement p = new Paiement();
			p.setId_p(rs.getInt("id_adherent"));//ici je passe l'id de l'adherent
			p.setDate(rs.getString("date_paiement"));
			p.setMontant(rs.getDouble("montant"));	
			//p.setId_ad(rs.getInt("id_adherent"));
			prods.add(p);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return prods;
}

public String getDate() throws SQLException {
	Connection conn=SingletonConnection.getConnection();
	String dates ;
	
		PreparedStatement ps= conn.prepareStatement("select date(now())");
		ResultSet rs = ps.executeQuery();
		if(rs.next()) 
			rs.getString("date(now())");	
	return rs.getString("date(now())");
}


public List<Equipement> getAllEquipements(String mc){
List<Equipement> prods= new ArrayList<Equipement>();
Connection conn=SingletonConnection.getConnection();
try {
	PreparedStatement ps= conn.prepareStatement("select * from equipements order by id_e desc ");
	ResultSet rs = ps.executeQuery();
	while (rs.next()) {
		Equipement p = new Equipement();
		p.setId_e(rs.getInt("id_e"));
		p.setNom_e(rs.getString("nom_e"));
		p.setMarque(rs.getString("marque"));
		p.setDate_installe(rs.getDate("date_installe"));				
		prods.add(p);
	}
} catch (SQLException e) {
	System.out.println("metier_impl");
	e.printStackTrace();
}
return prods;
}

public Equipement ajouterEquip(Equipement eq) {
Connection conn=SingletonConnection.getConnection();
try {
	PreparedStatement ps=conn.prepareStatement("INSERT INTO equipements (nom_e,marque,date_installe) VALUES (?,?,?)");			
	ps.setString(1,eq.getNom_e() );
	ps.setString(2,eq.getMarque() );
	ps.setDate(3, (Date) eq.getDate_installe());
	ps.executeUpdate();
	PreparedStatement ps2= conn.prepareStatement ("SELECT MAX(id_e) as MAX_ID FROM equipements");
			ResultSet rs =ps2.executeQuery();
			if (rs.next()) {
				eq.setId_e(rs.getInt("MAX_ID"));
			}
			ps.close();
			ps2.close();
} catch (Exception e) {
	System.out.println(e);
}
return eq;
}

public void deleteEquipement(int id) {
Connection conn=SingletonConnection.getConnection();
try {
	PreparedStatement ps= conn.prepareStatement("DELETE FROM equipements WHERE id_e = ?");
	ps.setLong(1, id);
	ps.executeUpdate();
	ps.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}

public List<Equipement> equipementsParMC(String mc) {
List<Equipement> prods= new ArrayList<Equipement>();
Connection conn=SingletonConnection.getConnection();
try {
	PreparedStatement ps= conn.prepareStatement("select * from equipements where nom_e LIKE ? order by id_e desc ");
ps.setString(1, "%"+mc+"%");
ResultSet rs = ps.executeQuery();
while (rs.next()) {
	Equipement p = new Equipement();
	p.setId_e(rs.getInt("id_e"));
	p.setNom_e(rs.getString("nom_e"));
	p.setMarque(rs.getString("marque"));
	p.setDate_installe(rs.getDate("date_installe"));
	prods.add(p);
}
} catch (SQLException e) {
	e.printStackTrace();
}
return prods;
}
	

public List<Activite> getAllActivities() {
	
	List<Activite> activs= new ArrayList<Activite>();
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps= conn.prepareStatement("select id_act,nom_act,categorie,description,duree,niveau,calories,prix_activite,id_img,disponible from activites order by id_act desc ");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Activite p = new Activite();
			p.setId_act(rs.getInt("id_act"));
			p.setNom_activite(rs.getString("nom_act"));	
			p.setCategorie(rs.getString("categorie"));
			p.setDescription(rs.getString("description"));
			p.setDuree(rs.getInt("duree"));
			p.setNiveau(rs.getString("niveau"));
			p.setCalories(rs.getInt("calories"));
			p.setPrix_activite(rs.getDouble("prix_activite"));
			p.setId_img(rs.getInt("id_img"));
			p.setDispo(rs.getString("disponible"));
			activs.add(p);
		}
	} catch (SQLException e) {
		System.out.println("metier_impl");
		e.printStackTrace();
	}
	return activs;
}


public Activite ajouterActivite(Activite act , Images img) {	
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps=conn.prepareStatement("INSERT INTO images (src_img) VALUES (?)");			
		ps.setString(1,img.getSrc_image() );	
		ps.executeUpdate();
		PreparedStatement ps2= conn.prepareStatement ("SELECT MAX(id_img) as MAX_ID FROM images");
				ResultSet rs =ps2.executeQuery();
				if (rs.next()) {
					img.setId(rs.getInt("MAX_ID"));
				}
		PreparedStatement ps3= conn.prepareStatement ("INSERT INTO activites (nom_act,categorie,description,duree,niveau,calories,prix_activite,id_img) values(?,?,?,?,?,?,?,?)");
				ps3.setString(1, act.getNom_activite());
				ps3.setString(2, act.getCategorie());
				ps3.setString(3, act.getDescription());
				ps3.setInt(4, act.getDuree());
				ps3.setString(5, act.getNiveau());
				ps3.setInt(6, act.getCalories());
				ps3.setDouble(7, act.getPrix_activite());
				ps3.setInt(8, img.getId());
				ps3.executeUpdate();
				ps.close();					
			ps2.close();
			ps3.close();
	} catch (Exception e) {
		System.out.println(e);
	}

	return act;
}


public void deleteActivite(int id) {
	
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps= conn.prepareStatement("DELETE FROM activites WHERE id_act = ?");
		ps.setLong(1, id);
		ps.executeUpdate();
		ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
}


public List<Activite> ActivitesParMC(String mc) {
	
	List<Activite> activs= new ArrayList<Activite>();
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps= conn.prepareStatement("select * from activites where nom_act LIKE ? order by id_act desc ");
	ps.setString(1, "%"+mc+"%");
	ResultSet rs = ps.executeQuery();
	while (rs.next()) {
		Activite p = new Activite();
		p.setId_act(rs.getInt("id_a"));
		p.setNom_activite(rs.getString("nom_a"));
		activs.add(p);
	}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return activs;
}

public Activite updateActivite(Activite a) {
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps= conn.prepareStatement("UPDATE activites SET nom_act=?,description=?,duree=?,niveau=?,calories=?,prix_activite=?,id_img=?,disponible=? WHERE id_act=?");
		ps.setString(1, a.getNom_activite());
		ps.setString(2, a.getDescription());
		ps.setInt(3, a.getDuree());
		ps.setString(4, a.getNiveau());
		ps.setInt(5, a.getCalories());
		ps.setDouble(6, a.getPrix_activite());
		ps.setInt(7, a.getId_img());	
		ps.setString(8, a.getDispo());
		ps.setInt(9, a.getId_act());
		ps.executeUpdate();
		ps.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return a;
}

public void updateImage(Images image) {
	Connection conn=SingletonConnection.getConnection();
	
	try {
		PreparedStatement ps= conn.prepareStatement("UPDATE images set src_img=? where id_img=?");
		ps.setString(1, image.getSrc_image());
		ps.setInt(2, image.getId());
		ps.executeUpdate();
		ps.close();
	}catch (Exception e) {
		System.out.println(e);
	}
}

public Images getImage(int id) {
	Connection conn=SingletonConnection.getConnection();
	Images img=new Images();
	try {
		PreparedStatement ps=conn.prepareStatement("select src_img,i.id_img from images i,activites a where a.id_img=i.id_img and id_act=?");
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			img.setId(rs.getInt("id_img"));
			img.setSrc_image(rs.getString("src_img"));
		}
	}catch (Exception e) {
		System.out.println(e);
	}
	return img;
}

public Activite getActivite(int id) {
	Connection conn=SingletonConnection.getConnection();
	Activite a = new Activite();
	try {
		PreparedStatement ps= conn.prepareStatement("select * from activites where id_act = ?");
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			a.setId_act(rs.getInt("id_act"));
			a.setNom_activite(rs.getString("nom_act"));
			a.setCategorie(rs.getString("categorie"));
			a.setDescription(rs.getString("description"));
			a.setDuree(rs.getInt("duree"));
			a.setNiveau(rs.getString("niveau"));
			a.setCalories(rs.getInt("calories"));
			a.setPrix_activite(rs.getDouble("prix_activite"));
			a.setDispo(rs.getString("disponible"));
			a.setId_img(rs.getInt("id_img"));
			
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return a;
}

@Override
public Double getTotal(int id,Date d1) throws SQLException {
	Connection conn=SingletonConnection.getConnection();
		PreparedStatement ps=conn.prepareStatement("select montant from paiement where month(?)=month(date_paiement) and year(?)=year(date_paiement) and id_adherent=?");
		ps.setDate(1, d1);
		ps.setDate(2, d1);
		ps.setInt(3, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			rs.getDouble("montant");
		}
	return rs.getDouble("montant");
}

public void editAdherentPassword(String nom,String prenom,int gsm, String pass) {// modification du mot de passe de l'adherent lors de la recupération du mot de passe
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps= conn.prepareStatement("update inscription set password1= ? where nomA=? and prenomA=? and gsm=?  ");
		ps.setString(1, pass);
		ps.setString(2, nom);
		ps.setString(3, prenom);
		ps.setInt(4, gsm);	
		ps.executeUpdate();
		ps.close();	
	}catch (Exception e) {
		System.out.println(e);
	}
}

public List<Activite> ConcatNames(String act) {
	Connection conn=SingletonConnection.getConnection();
	List<Activite> activs = new ArrayList<>();
	try {
		PreparedStatement ps= conn.prepareStatement("select concat_ws('.',nom_moniteur,prenom_moniteur) from moniteurs, activites where nom_act=? and id_activite=id_act");
		ps.setString(1, act);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Activite a=new Activite();
			a.setNom_activite(rs.getString("concat_ws('.',nom_moniteur,prenom_moniteur)"));
			activs.add(a);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return activs;
}

public List<User> reporterUser(int ids) {// i dunno for what this function !!
	Connection conn=SingletonConnection.getConnection();
	List<User> users = new ArrayList<>();
	try {
		PreparedStatement ps= conn.prepareStatement("select id_ad from facture f	 \r\n" + 
				"where id_seance= ? \r\n" + 
				"and month(date_facture)=month(now()) \r\n" + 
				"and year(date_facture)=year(now())  \r\n" + 
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

@Override
public Seance getInfoSeance(int ids) {
	Connection conn=SingletonConnection.getConnection();
	Seance seance=new Seance();
	try {
		PreparedStatement ps= conn.prepareStatement("select nom_act,jour,horaire from activites a,seances s,moniteurs m\r\n" + 
				"where s.id_seance=? and m.id_moniteur=s.id_mon and id_act=id_activite");
		ps.setInt(1, ids);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			seance.setNom_activite(rs.getString("nom_act"));
			seance.setHoraire(rs.getString("horaire"));
			seance.setJour(rs.getString("jour"));
		}
		}catch (Exception e) {
			System.out.println(e);
		}
	
	return seance;
}

@Override
public void addNotif1(int ids, String text) {//seance ajoutée
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps= conn.prepareStatement("insert into notifications (id_seance,texte_notif,date_notif,action)\r\n" + 
				"values(?,?,now(),1) ");
		ps.setInt(1, ids);
		ps.setString(2, text);
		ps.executeUpdate();
		ps.close();
	}catch (Exception e) {
		System.out.println(e);
	}
	
}

public void addNotif2(int ids, String text) {//seance reportée
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps= conn.prepareStatement("insert into notifications (id_seance,texte_notif,date_notif,action)\r\n" + 
				"values(?,?,now(),2) ");
		ps.setInt(1, ids);
		ps.setString(2, text);
		ps.executeUpdate();
		ps.close();
	}catch (Exception e) {
		System.out.println(e);
	}
	
}

public User getAdherentt(String email, String password) {
	Connection conn=SingletonConnection.getConnection();
	User u=new User();
	try {
		PreparedStatement ps= conn.prepareStatement("select f.id_ad , i.nomA , i.prenomA , i.emailA , i.password1 from inscription i , facture f where f.id_ad=i.Idinscrir and f.confirmation=1 and i.emailA=? and i.password1=?");
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
	while(rs.next()) {
		
		u.setIdu(rs.getInt("id_ad"));
		u.setNom(rs.getString("nomA"));
		u.setPrenom(rs.getString("prenomA"));
		u.setEmail(rs.getString("emailA"));
		u.setPassword(rs.getString("password1"));
		
	}
	    ps.close();  		
	}catch (Exception e) {
		System.out.println(e);}
		return u;


}




}
