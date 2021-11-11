package com.club.servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.club.dao.*;

import com.club.metie.*;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.FontProgramFactory;
import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.kernel.colors.*;


@WebServlet ({"*.prog","/FacturePDF"})
public class ControllerPDF extends HttpServlet{

	AdminDAO metier;
       AdherentinterfaceDAO metier1;
	private static final long serialVersionUID = -5842397689327724123L;
	
	public void init() throws ServletException {	
		metier = new ImplementeAdminDAO();
		metier1=new AdherentImplementDAO();
		super.init();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String path=request.getServletPath();		
		if(path.equals("/easy_army.prog")) {
		String masterPath = request.getServletContext().getRealPath( "/WEB-INF/easyArmy.pdf" );
		response.setContentType( "application/pdf" );
		
			try ( PdfReader reader = new PdfReader( masterPath );
	              PdfWriter writer = new PdfWriter( response.getOutputStream() );
	              PdfDocument document = new PdfDocument( reader, writer ) ) {
			
					PdfPage page = document.getPage( 1 );
					PdfCanvas canvas = new PdfCanvas( page );
			
					FontProgram fontProgram = FontProgramFactory.createFont();
					PdfFont font = PdfFontFactory.createFont( fontProgram, "utf-8", true );
					canvas.setFontAndSize( font, 12 );
			}
		}
		
		else if(path.equals("/easy_cardio.prog")) {
			String masterPath = request.getServletContext().getRealPath( "/WEB-INF/easyCardio.pdf" );
			response.setContentType( "application/pdf" );
			
				try ( PdfReader reader = new PdfReader( masterPath );
		              PdfWriter writer = new PdfWriter( response.getOutputStream() );
		              PdfDocument document = new PdfDocument( reader, writer ) ) {
				
						PdfPage page = document.getPage( 1 );
						PdfCanvas canvas = new PdfCanvas( page );
				
						FontProgram fontProgram = FontProgramFactory.createFont();
						PdfFont font = PdfFontFactory.createFont( fontProgram, "utf-8", true );
						canvas.setFontAndSize( font, 12 );
				}
			}
		
		else if(path.equals("/easy_dance.prog")) {
			String masterPath = request.getServletContext().getRealPath( "/WEB-INF/easyDance.pdf" );
			response.setContentType( "application/pdf" );
			
				try ( PdfReader reader = new PdfReader( masterPath );
		              PdfWriter writer = new PdfWriter( response.getOutputStream() );
		              PdfDocument document = new PdfDocument( reader, writer ) ) {
				
						PdfPage page = document.getPage( 1 );
						PdfCanvas canvas = new PdfCanvas( page );
				
						FontProgram fontProgram = FontProgramFactory.createFont();
						PdfFont font = PdfFontFactory.createFont( fontProgram, "utf-8", true );
						canvas.setFontAndSize( font, 12 );
				}
			}
		
		else if(path.equals("/easy_defence.prog")) {
			String masterPath = request.getServletContext().getRealPath( "/WEB-INF/easyDefense.pdf" );
			response.setContentType( "application/pdf" );
			
				try ( PdfReader reader = new PdfReader( masterPath );
		              PdfWriter writer = new PdfWriter( response.getOutputStream() );
		              PdfDocument document = new PdfDocument( reader, writer ) ) {
				
						PdfPage page = document.getPage( 1 );
						PdfCanvas canvas = new PdfCanvas( page );
				
						FontProgram fontProgram = FontProgramFactory.createFont();
						PdfFont font = PdfFontFactory.createFont( fontProgram, "utf-8", true );
						canvas.setFontAndSize( font, 12 );
				}
			}
		
		else if(path.equals("/easy_equilibre.prog")) {
			String masterPath = request.getServletContext().getRealPath( "/WEB-INF/easyEquilibre.pdf" );
			response.setContentType( "application/pdf" );
			
				try ( PdfReader reader = new PdfReader( masterPath );
		              PdfWriter writer = new PdfWriter( response.getOutputStream() );
		              PdfDocument document = new PdfDocument( reader, writer ) ) {
				
						PdfPage page = document.getPage( 1 );
						PdfCanvas canvas = new PdfCanvas( page );
				
						FontProgram fontProgram = FontProgramFactory.createFont();
						PdfFont font = PdfFontFactory.createFont( fontProgram, "utf-8", true );
						canvas.setFontAndSize( font, 12 );
				}
			}
		
		else if(path.equals("/easy_Minceur.prog")) {
			String masterPath = request.getServletContext().getRealPath( "/WEB-INF/easyMinceur.pdf" );
			response.setContentType( "application/pdf" );
			
				try ( PdfReader reader = new PdfReader( masterPath );
		              PdfWriter writer = new PdfWriter( response.getOutputStream() );
		              PdfDocument document = new PdfDocument( reader, writer ) ) {
				
						PdfPage page = document.getPage( 1 );
						PdfCanvas canvas = new PdfCanvas( page );
				
						FontProgram fontProgram = FontProgramFactory.createFont();
						PdfFont font = PdfFontFactory.createFont( fontProgram, "utf-8", true );
						canvas.setFontAndSize( font, 12 );
				}
			}
		
		
		else if(path.equals("/FacturePDF")) {			
			int id=Integer.parseInt(request.getParameter("id"));
			Date dt=Date.valueOf(request.getParameter("d"));
			com.club.metie.User adherent=metier.getAdherent(id);
			List<Activite> Activites = new ArrayList<Activite>();
			List<Activite> programmes = new ArrayList<Activite>();
			Activites=metier.getActiviteAdh(id,dt);
			programmes=metier.getProgAdh(id,dt);
						
			String masterPath = request.getServletContext().getRealPath( "/WEB-INF/facture.pdf" );
			response.setContentType( "application/pdf" );
			
			try ( PdfReader reader = new PdfReader( masterPath );
		              PdfWriter writer = new PdfWriter( response.getOutputStream() );
		              PdfDocument document = new PdfDocument( reader, writer ) ) {
				
				PdfPage page = document.getPage( 1 );
				PdfCanvas canvas = new PdfCanvas( page );
				
				FontProgram fontProgram = FontProgramFactory.createFont();
	            PdfFont font = PdfFontFactory.createFont( fontProgram, "utf-8", true );
	            canvas.setFontAndSize( font, 12 );				
				canvas.beginText();
				
				canvas.setTextMatrix(410, 748);
	            canvas.showText("0102"+id);
	    		
				canvas.setTextMatrix(390,723);
		        canvas.showText(""+dt);
			
				
				canvas.setTextMatrix(270,542);
				canvas.showText(""+adherent.getNom()+" "+adherent.getPrenom());
				
				canvas.setTextMatrix(250,516);
				canvas.showText("0"+adherent.getGsm());
				
				canvas.setTextMatrix(210,492);
				canvas.showText(""+adherent.getEmail());
				
				int posy=393;
				for (Activite activ : Activites) {
					
					canvas.setTextMatrix(50, posy);
	                canvas.showText(""+activ.getNom_activite()+"" );
	                
	                canvas.setTextMatrix(240, posy);
	                canvas.showText(""+activ.getNb_seance()+"" );
	                
	                canvas.setTextMatrix(309, posy);
	                canvas.showText(""+activ.getPrix_activite()+"" );
	                
	                posy-=30;				
				}				
				int posy1=393;
				for (Activite activ : programmes) {
					
					canvas.setTextMatrix(371, posy1);
	                canvas.showText(""+activ.getNom_activite()+"" );
	                
	                canvas.setTextMatrix(490, posy1);
	                canvas.showText(""+activ.getPrix_activite()+"" );
	                
	                posy1-=30;				
				}						
				Double total;
				try {
					total = metier.getTotal(id,dt);
					canvas.setTextMatrix(448,163);
		            canvas.showText(""+total);
				} catch (SQLException e) {
					e.printStackTrace();
				}												
				canvas.endText();
			}			
		}	
		
		else if(path.equals("/seances.prog")) {
			String masterPath = request.getServletContext().getRealPath( "/WEB-INF/seances.pdf" );
			response.setContentType( "application/pdf" );
			
			int id=Integer.parseInt(request.getParameter("id"));
			//int id=6;
			com.club.metie.User adherent=metier.getAdherent(id);
			List<Seance> seances = new ArrayList<Seance>();
			seances=metier1.getSeancesAdh(id);
			
				try ( PdfReader reader = new PdfReader( masterPath );
		              PdfWriter writer = new PdfWriter( response.getOutputStream() );
		              PdfDocument document = new PdfDocument( reader, writer ) ) {
				
						PdfPage page = document.getPage( 1 );
						PdfCanvas canvas = new PdfCanvas( page );
				
						FontProgram fontProgram = FontProgramFactory.createFont();
						PdfFont font = PdfFontFactory.createFont( fontProgram, "utf-8", true );				
						canvas.setFontAndSize( font, 12 );
						canvas.beginText();
						
						canvas.setTextMatrix(170,650);
						canvas.showText(""+adherent.getNom());
						
						canvas.setTextMatrix(178,625);
						canvas.showText(""+adherent.getPrenom());
						
						canvas.setTextMatrix(200,600);
						canvas.showText(""+adherent.getEmail());
						
						for (Seance sea : seances) {
							
							if(sea.getJour().equals("Lundi")) {
								int posy=365;
								int pos=350;							
								canvas.setFontAndSize( font, 8 );
								canvas.setTextMatrix(48, posy);
				                canvas.showText(""+sea.getNom_activite()+"" );
				                
				                canvas.setFontAndSize( font, 12 );
				                canvas.setTextMatrix(50,pos );
				                canvas.showText(""+sea.getHoraire()+"" );
				             
				                posy-=39;
				                pos-=39;
							}
							
							if(sea.getJour().equals("Mardi")) {
								int posy=326;
								int pos=311;							
								canvas.setFontAndSize( font, 8 );
								canvas.setTextMatrix(128, posy);
				                canvas.showText(""+sea.getNom_activite()+"" );
				                
				                canvas.setFontAndSize( font, 12 );
				                canvas.setTextMatrix(133,pos );
				                canvas.showText(""+sea.getHoraire()+"" );
				             
				                posy-=39;
				                pos-=39;
							}
							
							if(sea.getJour().equals("Mercredi")) {
								int posy=287;
								int pos=272;							
								canvas.setFontAndSize( font, 8 );
								canvas.setTextMatrix(212, posy);
				                canvas.showText(""+sea.getNom_activite()+"" );
				                
				                canvas.setFontAndSize( font, 12 );
				                canvas.setTextMatrix(219,pos );
				                canvas.showText(""+sea.getHoraire()+"" );
				             
				                posy-=39;
				                pos-=39;
							}
							
							if(sea.getJour().equals("Jeudi")) {
								int posy=248;
								int pos=233;							
								canvas.setFontAndSize( font, 8 );
								canvas.setTextMatrix(298, posy);
				                canvas.showText(""+sea.getNom_activite()+"" );
				                
				                canvas.setFontAndSize( font, 12 );
				                canvas.setTextMatrix(303,pos );
				                canvas.showText(""+sea.getHoraire()+"" );
				             
				                posy-=39;
				                pos-=39;
							}
							
							if(sea.getJour().equals("Samedi")) {
								int posy=365;
								int pos=350;							
								canvas.setFontAndSize( font, 8 );
								canvas.setTextMatrix(380, posy);
				                canvas.showText(""+sea.getNom_activite()+"" );
				                
				                canvas.setFontAndSize( font, 12 );
				                canvas.setTextMatrix(386,pos );
				                canvas.showText(""+sea.getHoraire()+"" );
				             
				                posy-=39;
				                pos-=39;
							}
							
							if(sea.getJour().equals("Dimanche")) {
								int posy=326;
								int pos=311;							
								canvas.setFontAndSize( font, 8 );
								canvas.setTextMatrix(465, posy);
				                canvas.showText(""+sea.getNom_activite()+"" );
				                
				                canvas.setFontAndSize( font, 12 );
				                canvas.setTextMatrix(471,pos );
				                canvas.showText(""+sea.getHoraire()+"" );
				             
				                posy-=39;
				                pos-=39;
							}
						}					
						canvas.endText();
				}
			}
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
}
