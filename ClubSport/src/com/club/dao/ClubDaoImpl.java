package com.club.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.club.metie.Activite;

import com.club.metie.Entrainer;
import com.club.metie.Equipement;
import com.club.metie.Images;
import com.club.metie.Inscription;
import com.club.metie.Paiement;
import com.club.metie.Programme;
import com.club.metie.Seance;
import com.club.metie.SingletonConnection;
import com.club.metie.Subject;
import com.club.metie.User;
import com.club.metie.comptead;





public class ClubDaoImpl implements InterClub {

	@Override
	public Subject saveSubject(Subject su) {
		
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("INSERT INTO subject(nom , email, sujet) VALUES(?,?,?)");
			ps.setString(1, su.getNom());
			ps.setString(2, su.getEmail());
			ps.setString(3, su.getSujet());
			ps.executeUpdate();
			PreparedStatement ps2= conn.prepareStatement("SELECT MAX(Idsujet) as MAX_ID FROM subject");
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

	@Override
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
	    					PreparedStatement ps3= conn.prepareStatement("Insert into comptead(id_cad) values(?)");	
	    					ps3.setInt(1,in.getIdinscrir());
	    					
	    					ps3.executeUpdate();
	    					ps.close();
	    					ps2.close();
	    					ps3.close();
	    					} catch (SQLException e) {
	    					e.printStackTrace();
	    					}
	        	
		return in;
	}

	
	@Override
	public List<Equipement> getAllEquipements() {
		List<Equipement> equipement= new ArrayList<Equipement>();
		Connection conn=SingletonConnection.getConnection();
		try {
		PreparedStatement ps= conn.prepareStatement("select * from equipements");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
		Equipement eq = new Equipement();
		eq.setId_e(rs.getInt("Id_e"));
		eq.setNom_e(rs.getString("nom_e"));
		eq.setMarque(rs.getString("marque"));
		eq.setDate_installe(rs.getTimestamp("date_installe"));
	    
		equipement.add(eq);
		}
		} catch (SQLException e) {
		e.printStackTrace();
		}
		return equipement;
	}

	@Override
	public Equipement ajouterEquip(Equipement eq) {
		Connection conn=SingletonConnection.getConnection();
			try {
				PreparedStatement ps=conn.prepareStatement("INSERT INTO equipements (nom_e,marque) VALUES (?,?)");			
				ps.setString(1,eq.getNom_e() );
				ps.setString(2,eq.getMarque() );
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

	@Override
	public List<Seance> getAllSeance(int id_activite) {
		List<Seance> seance= new ArrayList<Seance>();
	
		Connection conn=SingletonConnection.getConnection();
		try {
		PreparedStatement ps= conn.prepareStatement("SELECT `s`.`id_seance`, `s`.`jour`, TIME_FORMAT(`s`.`horaire`,' %H : %i %p') AS heure , `m`.`nom_moniteur`,`m`.`prenom_moniteur`, `a`.`nom_act`, `a`.`id_act` FROM `seances` AS `s` LEFT JOIN `moniteurs` AS `m` ON `s`.`id_mon` = `m`.`id_moniteur` LEFT JOIN `activites` AS `a` ON `m`.`id_activite` = `a`.`id_act`  WHERE `m`.`id_activite` = ? ;");
		 ps.setInt(1, id_activite);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
		Seance sea=new Seance();
		sea.setId_seance(rs.getInt("id_seance"));
		sea.setJour(rs.getString("jour"));
		sea.setHoraire(rs.getString("heure"));
		sea.setNom_mon(rs.getString("nom_moniteur"));
		sea.setPrenom_mon(rs.getString("prenom_moniteur"));
		sea.setId_activite(rs.getInt("id_act"));
	    
		seance.add(sea);
		}
		} catch (SQLException e) {
		e.printStackTrace();
		}
		return seance;
	}

	@Override
	public Seance saveSeance(Seance sea) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void choisirProg(Programme p ) {
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps=conn.prepareStatement("INSERT INTO entrainerpro (id_cad, id_programme) VALUES(?,?) ");
		
		ps.setInt(2,p.getId_prog() );
		ps.setInt(1, p.getId_cad());
		ps.executeUpdate();
		PreparedStatement ps2=conn.prepareStatement("INSERT INTO facture (date_facture,id_ad,id_prog) VALUES( current_timestamp ,?,?) ");
		ps2.setInt(1, p.getId_cad());
		ps2.setInt(2, p.getId_prog());
		ps2.executeUpdate();
		ps.close();
		ps2.close();}
		  catch (SQLException e) {
			   e.printStackTrace();
			   }
		
	}

	@Override
	public Seance getSeance(int id , int id_activite) {
		
		Connection conn=SingletonConnection.getConnection();
		Seance sea =new Seance();
		try {
			PreparedStatement ps=conn.prepareStatement("select Id_seance , jour, horaire,  nom_mon from seances where  id_act=id_activite  and id_moniteur=id_mon and Id_seance = ? and id_activite=?");
		   ps.setInt(1, id);
		   ps.setInt(2, id_activite);
		   ResultSet rs=ps.executeQuery();
		   if(rs.next()) {
			   sea.setId_seance(rs.getInt("Id_seance"));
			   sea.setJour(rs.getString("jour"));
			   sea.setHoraire(rs.getString("horaire"));
			   sea.setNom_mon(rs.getString("nom_mon"));
			   
			  
			}
             
		   }
		   catch (SQLException e) {
			   e.printStackTrace();
			   }
			
			return sea;
	}

	@Override
	public void choisirSeance(Entrainer en) {
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("INSERT INTO entrainer (id_cad,id_seance) VALUES (?,?)  ");	
				ps.setInt(1, en.getId_cad());
				ps.setInt(2, en.getId_seance());
			    ps.executeUpdate();
			    PreparedStatement ps2=conn.prepareStatement("INSERT INTO facture (date_facture,id_ad,id_seance) VALUES( current_timestamp ,?,?) ");
				ps2.setInt(1, en.getId_cad());
				ps2.setInt(2, en.getId_seance());
				ps2.executeUpdate();
				ps.close();
			    ps2.close();
				
		} catch (Exception e) {
			System.out.println(e);
		}
		
	}

	@Override
	public int getIdAd(String nomA , String prenomA) {
		Connection conn=SingletonConnection.getConnection();
		 Inscription ins=new Inscription();
		try {
			PreparedStatement ps=conn.prepareStatement("select Idinscrir from inscription where nomA=? and prenomA=?");
		   ResultSet rs=ps.executeQuery();
		   if(rs.next()) {
			
			  ins.setIdinscrir(rs.getInt("Idinscrir"));
			  ins.setNomA(rs.getString("nomA"));
			  ins.setPrenomA(rs.getString("prenomA"));
			   
			  
			}
             
		   }
		   catch (SQLException e) {
			   e.printStackTrace();
			   }
		return	ins.getIdinscrir();
			
		
	}

	@Override
	public List<Activite> getAllActivites(int id_activite) {
		List<Activite> activites= new ArrayList<Activite>();
		Connection conn=SingletonConnection.getConnection();
		
		try{PreparedStatement ps2= conn.prepareStatement("select nom_act  , description, duree, niveau, calories from  activites  where   id_act=?");
		 ps2.setInt(1, id_activite);
		 ResultSet rs2 = ps2.executeQuery();
		 while (rs2.next()) {
				Activite act= new Activite();
			
				act.setNom_activite(rs2.getString("nom_act"));
				act.setDescription(rs2.getString("description"));
				act.setDuree(rs2.getInt("duree"));
				act.setNiveau(rs2.getString("niveau"));
				act.setCalories(rs2.getInt("calories"));
				activites.add(act);
		}}  catch (SQLException e) {
			   e.printStackTrace();
			   }
		
		 return activites;
	}


	public List<Entrainer> getMontantTotal(int id_cad, int id_seance) {
		List<Entrainer> ent= new ArrayList<Entrainer>();
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("select e.id_cad, e.id_seance, s.prix_seance from entrainer e , seances s where e.id_seance = s.id_seance;");
		   ResultSet rs=ps.executeQuery();
		   if(rs.next()) {
			Entrainer entrainer=new Entrainer();
			entrainer.setId_cad(rs.getInt("id_cad"));
			 entrainer.setId_seance(rs.getInt("id_seance"));
			 entrainer.setPrix(rs.getDouble("prix_seance"));
			 ent.add(entrainer);
			   
			  
			}
             
		   }
		   catch (SQLException e) {
			   e.printStackTrace();
			   }
		return ent;
	}

	
	public List<Activite> getActiviterV(int id_cad ) {
		List<Activite> act= new ArrayList<Activite>();
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("select id_act,nom_act,categorie,src_img,prix_activite,count(e.id_seance) as \"Nombre de seances\" from inscription i,entrainer e,activites a,seances s, moniteurs m,images im where Idinscrir = ? and e.id_cad=Idinscrir and s.id_seance=e.id_seance and m.id_moniteur=s.id_mon and a.id_act=m.id_activite and im.id_img=a.id_img group by nomA,prenomA,nom_act ");
			 ps.setInt(1, id_cad);
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
	//select DISTINCT a.nom_act, a.prix_activite , a.categorie, i.src_img , count(s.id_seance) from images i ,seance s , entrainer e , activites a ,moniteur m where e.id_seance=s.id_seance and s.id_mon=m.id_moniteur and m.id_activite=a.id_act and i.id_img=a.id_img and e.id_cad=27

	@Override
	public int getMo(int id_cad , Activite a) {
		Connection conn=SingletonConnection.getConnection();
	Entrainer entrainer = new Entrainer();
		try {
			
			PreparedStatement ps=conn.prepareStatement("select count(f.id_seance) as mont from seances s , facture f , activites a , moniteurs m where f.id_ad=? and"
					+ " f.id_seance=s.id_seance and s.id_mon=m.id_moniteur and month(f.date_facture)=month(now()) and year(f.date_facture)=year(now()) and m.id_activite=a.id_act and id_act=?");
			 ps.setInt(1, id_cad);
			 ps.setInt(2, a.getId_act());
			ResultSet rs=ps.executeQuery();
		   if(rs.next()) {
			
			  entrainer.setMont(rs.getInt("mont"));
			   
			  
			}
            
		   }
		   catch (SQLException e) {
			   e.printStackTrace();
			   }
		
		return  entrainer.getMont();}

	
	public int getMoo(int id_cad , int id_act) {
		Connection conn=SingletonConnection.getConnection();
	Entrainer entrainer = new Entrainer();
		try {
			
			PreparedStatement ps=conn.prepareStatement("select count(e.id_seance) as mont from seances s , entrainer e , activites a , moniteurs m where e.id_cad=? and e.id_seance=s.id_seance and s.id_mon=m.id_moniteur and m.id_activite=a.id_act and id_act=?");
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
	
	
	
	
	
	
	
	@Override
	public double getPrix(Activite a) {
		Connection conn=SingletonConnection.getConnection();
		Entrainer entrainer = new Entrainer();
		
			try {
				
				PreparedStatement ps=conn.prepareStatement("select prix_activite  from activites where id_act= ?");
				 ps.setInt(1, a.getId_act());
				ResultSet rs=ps.executeQuery();
			   if(rs.next()) {
				
				  entrainer.setPrix(rs.getDouble("prix_activite"));
				   
				  
				}
	            
			   }
			   catch (SQLException e) {
				   e.printStackTrace();
				   }
			
			return entrainer.getPrix();
	}
	public double getPrixx(int id_act) {
		Connection conn=SingletonConnection.getConnection();
		Entrainer entrainer = new Entrainer();
		
			try {
				
				PreparedStatement ps=conn.prepareStatement("select a.prix_activite  from activites a where id_act= ?");
				 ps.setInt(1, id_act);
				ResultSet rs=ps.executeQuery();
			   if(rs.next()) {
				
				  entrainer.setPrix(rs.getDouble("prix_activite"));
				   
				  
				}
	            
			   }
			   catch (SQLException e) {
				   e.printStackTrace();
				   }
			
			return entrainer.getPrix();
	}

	@Override
	public void enregisterMontant(double m , int id_cad) {
		
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps=conn.prepareStatement("Update comptead set montant_apayer =  ? where id_cad=?");	
				ps.setDouble(1, m);
				ps.setInt(2, id_cad);
			    ps.executeUpdate();
		
			    ps.close();
				
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	
public Activite ajouterActivite(Activite act , Images img) {
	
	/*
	 * Connection conn=SingletonConnection.getConnection(); try { PreparedStatement
	 * ps=conn.prepareStatement("INSERT INTO images (src_img) VALUES (?)");
	 * ps.setString(1,img.getSrc_image() );
	 * 
	 * ps.executeUpdate(); PreparedStatement ps2= conn.prepareStatement
	 * ("SELECT MAX(id_img) as MAX_ID FROM images"); ResultSet rs
	 * =ps2.executeQuery(); if (rs.next()) { img.setId(rs.getInt("MAX_ID")); }
	 * PreparedStatement ps3= conn.prepareStatement
	 * ("INSERT INTO activites (nom_act,description,duree,niveau,calories,prix_activite, id_img) values(?,?,?,?,?,?, ?)"
	 * ); ps3.setString(1, act.getNom_activite()); ps3.setString(2,
	 * act.getDescription()); ps3.setInt(3, act.getDuree()); ps3.setString(4,
	 * act.getNiveau()); ps3.setInt(5, act.getCalories()); ps3.setDouble(6,
	 * act.getPrix_activite()); ps3.setInt(7, img.getId()); ps3.executeUpdate();
	 * ps.close();
	 * 
	 * 
	 * 
	 * 
	 * ps2.close(); ps3.close(); } catch (Exception e) { System.out.println(e); }
	 */
	return act;
}

@Override
public Images enregistrerImages(Images img) {
	/*
	 * Connection conn=SingletonConnection.getConnection(); try { PreparedStatement
	 * ps=conn.prepareStatement("INSERT INTO images (src_img) VALUES (?)");
	 * ps.setString(1,img.getSrc_image() );
	 * 
	 * ps.executeUpdate(); PreparedStatement ps2= conn.prepareStatement
	 * ("SELECT MAX(id_img) as MAX_ID FROM images"); ResultSet rs
	 * =ps2.executeQuery(); if (rs.next()) { img.setId(rs.getInt("MAX_ID")); }
	 * ps.close(); ps2.close(); } catch (Exception e) { System.out.println(e); }
	 */
	return img;
}

@Override
public List<Activite> getAllActivitesSansId(String cate) {
	
	List<Activite> activites= new ArrayList<Activite>();
	Connection conn=SingletonConnection.getConnection();
	
	try{PreparedStatement ps2= conn.prepareStatement("select a.id_act, a.nom_act, a.categorie, a.description, a.duree, a.niveau , a.calories , a.prix_activite, i.src_img from  activites a, images i where i.id_img=a.id_img and a.categorie LIKE ? ");
	ps2.setString(1, "%"+cate+"%");
	ResultSet rs2 = ps2.executeQuery();
	 while (rs2.next()) {
			Activite act= new Activite();
		   act.setId_act(rs2.getInt("id_act"));
			act.setNom_activite(rs2.getString("nom_act"));
			act.setCategorie(rs2.getString("categorie"));
			act.setDescription(rs2.getString("description"));
			act.setDuree(rs2.getInt("duree"));
			act.setNiveau(rs2.getString("niveau"));
			act.setCalories(rs2.getInt("calories"));
			act.setPrix_activite(rs2.getDouble("prix_activite"));
			act.setFile(rs2.getString("src_img"));
			
			activites.add(act);
	}}  catch (SQLException e) {
		   e.printStackTrace();
		   }
	
	 return activites;
}

@Override
public double getMontant(int id_cad) {
	Connection conn=SingletonConnection.getConnection();
	comptead cad= new comptead();
		try {
			
			PreparedStatement ps=conn.prepareStatement("select montant_apayer from comptead where id_cad= ?");
			 ps.setInt(1, id_cad);
			ResultSet rs=ps.executeQuery();
		   if(rs.next()) {
			
			  cad.setMontant_a_payer(rs.getDouble("montant_apayer"));
			   
			  
			}
		   }
		   catch (SQLException e) {
			   e.printStackTrace();
			   }
		
		return cad.getMontant_a_payer();
	
}


@Override
public List<Activite> getAllActivs( int id_ad) {
	
	List<Activite> act= new ArrayList<Activite>();
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps=conn.prepareStatement("SELECT DISTINCT a.id_act  from seances s, facture f,moniteurs m,activites a where f.id_ad=? and year(date_facture)=year(now()) and month(date_facture)=month(now()) and day(date_facture)=day(now()) "
				+ "and day(date_facture)=day(now()) and s.id_seance=f.id_seance and m.id_moniteur=s.id_mon and a.id_act=m.id_activite ");
		 ps.setInt(1, id_ad);
		 
	
		ResultSet rs=ps.executeQuery();
		   while(rs.next()) {
			   Activite activite = new Activite();
			   activite.setId_act(rs.getInt("id_act"));			 
			  
				
			act.add(activite);
	   }
	}catch (SQLException e) {
		   e.printStackTrace();
		   }
	return act;
}

@Override
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
		    PreparedStatement ps3=conn.prepareStatement("DELETE FROM facture where confirmation = 0 and id_ad=?");
		    ps3.setInt(1, p.getId_cad());
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
public int  tester(int a) {
	Connection conn=SingletonConnection.getConnection();
	comptead cad= new comptead();
		try {
			
			PreparedStatement ps=conn.prepareStatement("select id_programme from comptead where id_cad= ?");
			 ps.setInt(1, a);
			ResultSet rs=ps.executeQuery();
		   if(rs.next()) {
			
			  cad.setProgrramme(rs.getInt("id_programme"));
			   
			  
			}
		   }
		   catch (SQLException e) {
			   e.printStackTrace();
			   }
		
		return cad.getProgrramme();
}

@Override
public double getPrixpro(int id_prog) {
	Connection conn=SingletonConnection.getConnection();
	Programme prog= new Programme();
	try {
		
		PreparedStatement ps=conn.prepareStatement("select prix_prog from programme   where id_prog = ?");
		 ps.setInt(1, id_prog);
		ResultSet rs=ps.executeQuery();
	   if(rs.next()) {
		
		  prog.setPrix_programme(rs.getInt("prix_prog"));
		   
		  
		}
	   }
	   catch (SQLException e) {
		   e.printStackTrace();
		   }
	
	return prog.getPrix_programme();
}

@Override
public List<Entrainer> getPrixSeance(int id_cad) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public List<Programme> getProgrammeV(int id_cad) {
	
	
	
	List<Programme> ent= new ArrayList<Programme>();
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps=conn.prepareStatement("SELECT  p.contenir,p.nom_prog, p.id_prog , p.prix_prog, i.src_img FROM entrainerpro pr ,"
				+ " programme p, images i WHERE p.id_prog=pr.id_programme and i.id_img= p.image and pr.id_cad= ?;");
		 ps.setInt(1, id_cad);
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

@Override
public List<Programme> getAllpro(int id) {
	Connection conn=SingletonConnection.getConnection();
	List<Programme> ent= new ArrayList<Programme>();
	try {
		PreparedStatement ps=conn.prepareStatement("SELECT   f.id_prog  FROM facture f , programme p, images i WHERE p.id_prog=f.id_prog and i.id_img= p.image and  month(f.date_facture)=month(now()) and year(f.date_facture)= year(now()) and day(date_facture)=day(now()) and f.id_ad= ?");
		 ps.setInt(1, id);
		ResultSet rs=ps.executeQuery();
	   while(rs.next()) {
		  Programme p = new Programme();
		  p.setId_prog(rs.getInt("id_prog"));
		
		  ent.add(p);
		}
         
	   }
	   catch (SQLException e) {
		   e.printStackTrace();
		   }
	return ent;
}

@Override
public void deleteInfoSeance(int id_ad, int id_act) {
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps=conn.prepareStatement("DELETE FROM facture WHERE id_ad = ? and id_seance  IN (select s.id_seance FROM entrainer e , activites a, moniteurs m , seances s where s.id_mon=m.id_moniteur and m.id_activite=a.id_act and s.id_seance=e.id_seance and a.id_act =?)");
		ps.setInt(1, id_ad);
		ps.setInt(2, id_act);
		ps.executeUpdate();
		PreparedStatement ps2=conn.prepareStatement("DELETE FROM entrainer WHERE id_cad= ? and id_seance IN (select s.id_seance FROM entrainer e , activites a, moniteurs m , seances s where s.id_mon=m.id_moniteur and m.id_activite=a.id_act and s.id_seance=e.id_seance and a.id_act =?) ");
		ps2.setInt(1, id_ad);
		ps2.setInt(2, id_act );
		ps2.executeUpdate();
		ps.close();
		ps2.close();
	}catch (SQLException e) {
		e.printStackTrace();
	}
	

	
}

	

public void deleteInfoProgramme(int id_ad, int id_pro) {
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps=conn.prepareStatement("DELETE FROM entrainerpro WHERE id_cad= ? and id_programme= ?");
		ps.setInt(1, id_ad);
		ps.setInt(2, id_pro);
		ps.executeUpdate();
		PreparedStatement ps2=conn.prepareStatement("DELETE FROM facture  WHERE id_ad= ? and id_prog= ?");
		ps2.setInt(1, id_ad);
		ps2.setInt(2, id_pro);
		ps2.executeUpdate();
		ps.close();
		ps2.close();
	}catch (SQLException e) {
		e.printStackTrace();
	}
}
	
	
	
public void subMontantSeance(double m, int id_cad) {

	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps=conn.prepareStatement("Update comptead set montant_apayer =  montant_apayer - ? where id_cad=?");	
			ps.setDouble(1, m);
			ps.setInt(2, id_cad);
		    ps.executeUpdate();
	
		    ps.close();
			
	} catch (Exception e) {
		System.out.println(e);
	}
}
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
public int testerPersonne(int id) {
	Connection conn=SingletonConnection.getConnection();
	
	int i=0;
	try {
		PreparedStatement ps=conn.prepareStatement("select id_paiement from paiement where id_adherent=? ");
		 ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				i=1;
			}else {
				i=0;
			}
	}catch (SQLException e) {
		   e.printStackTrace();
		   }
		
		
		return i;
}



@Override
public int testerAdhe(int id) {
Connection conn=SingletonConnection.getConnection();
	
	int i=0;
	try {
		PreparedStatement ps=conn.prepareStatement("select  count(id_paiement) as nb from paiement where id_adherent=? ");
		 ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				i=rs.getInt("nb");
			}
	}catch (SQLException e) {
		   e.printStackTrace();
		   }
		
		
		return i;
}

@Override
public List<Seance> getAllSeanceAdh( int id_ad , Date d) {
	List<Seance> seance= new ArrayList<Seance>();
	
	Connection conn=SingletonConnection.getConnection();
	try {
	PreparedStatement ps= conn.prepareStatement("select s.id_seance  from facture f,seances s where  f.id_ad=? and month(date_facture) =month(?) and year(date_facture) =year(?) and confirmation=1 and s.id_seance=f.id_seance ");
	 ps.setInt(1, id_ad);
	 ps.setDate(2, d);
	 ps.setDate(3, d);
	ResultSet rs = ps.executeQuery();
	while (rs.next()) {
	Seance sea=new Seance();
	sea.setId_seance(rs.getInt("id_seance"));
	
    
	seance.add(sea);
	}
	} catch (SQLException e) {
	e.printStackTrace();
	}
	return seance;
}

@Override
public List<Programme> getAllprogAdh(int id_ad, Date d) {
	List<Programme> ent= new ArrayList<Programme>();
	Connection conn=SingletonConnection.getConnection();
	try {
		PreparedStatement ps=conn.prepareStatement("SELECT  p.id_prog  FROM facture f , programme p WHERE p.id_prog=f.id_prog  and f.id_ad= ?  and month(f.date_facture) =month(?) and year(f.date_facture) =year(?)  and confirmation=1;");
		 ps.setInt(1, id_ad);
		 ps.setDate(2, d);
		 ps.setDate(3, d);
		ResultSet rs=ps.executeQuery();
	   while(rs.next()) {
		  Programme p = new Programme();
		  p.setId_prog(rs.getInt("id_prog"));
		 
		  ent.add(p);
		}
         
	   }
	   catch (SQLException e) {
		   e.printStackTrace();
		   }
	return ent;

}













}

	

	
	
	


























































































/*
 * @Override public Emploi enregisterEmpl(Emploi emploi) {
 * 
 * Connection conn=SingletonConnection.getConnection(); try { PreparedStatement
 * ps=conn.
 * prepareStatement("INSERT INTO emploi(activite ,lundi, mardi, mercredi , jeudi , samedi , dimanche) VALUES(?,?,?,?,?,?,?)"
 * ); ps.setString(1, emploi.getActivite()); ps.setString(2, emploi.getLundi());
 * ps.setString(3, emploi.getMardi()); ps.setString(4, emploi.getMercredi());
 * ps.setString(5, emploi.getJeudi()); ps.setString(6, emploi.getSamedi());
 * ps.setString(7, emploi.getDimanche()); ps.executeUpdate();
 * 
 * 
 * ps.close();
 * 
 * } catch (SQLException e) { e.printStackTrace(); }
 * 
 * return emploi; }
 */
	
	
	
	
	
	
	


	



