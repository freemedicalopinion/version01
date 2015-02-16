package com.smo.model;

import java.io.Serializable;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.TextIndexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.TextScore;

@Document
public class SMOCity implements Serializable{

	private static final long serialVersionUID = -1003227955892615946L;
	@Id
	private String id;
	@TextIndexed
	private String city;
	@TextScore
	Float score;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Float getScore() {
		return score;
	}
	public void setScore(Float score) {
		this.score = score;
	}
	
	
	@Override
	public String toString() {
		return "SMOCity [id=" + id + ", city=" + city + "]";
	}
	
}
