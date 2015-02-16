package com.smo.model;

import java.io.Serializable;

public class SMOKeyValue implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6460074290864799350L;
	private String key;
	private String value;

	public SMOKeyValue() {

	}

	public SMOKeyValue(String key, String value) {
		this.key = key;
		this.value = value;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
