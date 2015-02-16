package com.smo.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class SMOSearch implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6423886244334088488L;
	@Id
	private String id;
	private String query;
	private long count=0;
	private Date lastSearched;

	public long increseCount() {
		return ++this.count;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	public Date getLastSearched() {
		return lastSearched;
	}

	public void setLastSearched(Date lastSearched) {
		this.lastSearched = lastSearched;
	}

}
