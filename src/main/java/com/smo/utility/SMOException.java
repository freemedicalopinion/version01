package com.smo.utility;

public class SMOException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String reason;
	int errorCode;

	public SMOException() {

	}
	public SMOException(String reason) {
		super(reason);
	}

	public SMOException(String reason, int errorCode) {
		super(reason);
		this.errorCode = errorCode;

	}
	public SMOException( int errorCode) {
		this.errorCode = errorCode;

	}

}
