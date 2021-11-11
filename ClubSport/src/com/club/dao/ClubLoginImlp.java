package com.club.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.club.metie.SingletonConnection;
import com.club.metie.User;

public class ClubLoginImlp implements InterClubLogin {

	@Override
	public int logging(User u) {
		int status=0;
		Connection conn=SingletonConnection.getConnection();
		try {
			PreparedStatement ps= conn.prepareStatement("select * from admin where email_admin= ? and pass_admin= ?");
			ps.setString(1, u.getEmail());
			ps.setString(2, u.getPassword());			

			ResultSet rs = ps.executeQuery();
			if(rs.next()) 
				status=1;
			else {
				PreparedStatement ps1= conn.prepareStatement("select * from adherents where email_adherent ? and pass_adherent =?");
				ps1.setString(1, u.getEmail());
				ps1.setString(2, u.getPassword());				
				
				ResultSet rs1 = ps1.executeQuery();				
				if(rs1.next()) 
					status=2;
				else {					
					PreparedStatement ps2= conn.prepareStatement("select * from moniteurs where email_moniteur ? and pass_moniteur =?");
					ps2.setString(1, u.getEmail());
					ps2.setString(2, u.getPassword());					
					ResultSet rs2 = ps2.executeQuery();
					if(rs2.next())
						status=3;
				}				
			}			
		}catch (Exception e) {
			System.out.println("erreur fonction BD");
			System.out.println(e);
		}
		return status;		
	
	}

}
