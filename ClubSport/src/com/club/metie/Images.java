package com.club.metie;

public class Images {
private int id;
private String src_image;

public Images() {
	
}

public Images(int id, String src_image) {
	super();
	this.id = id;
	this.src_image = src_image;
}

public Images(String src_image) {
	super();
	this.src_image = src_image;
}
public String getSrc_image() {
	return src_image;
}
public void setSrc_image(String src_image) {
	this.src_image = src_image;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
}
