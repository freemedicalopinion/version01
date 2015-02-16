package com.smo.model;

import java.util.Date;

import com.smo.constant.PublicEnums.Day;

public class SMOTiming {

	private long id = new Date().getTime();
	private Day day;
	private String startingTime;
	private String endingTime;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public Day getDay() {
		return day;
	}
	public void setDay(Day day) {
		this.day = day;
	}
	public String getStartingTime() {
		return startingTime;
	}
	public void setStartingTime(String startingTime) {
		this.startingTime = startingTime;
	}
	public String getEndingTime() {
		return endingTime;
	}
	public void setEndingTime(String endingTime) {
		this.endingTime = endingTime;
	}
	
	

}
