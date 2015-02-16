package com.smo.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class SMODoctorTiming implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -55078528240097290L;

	private String hospitalId;
	private List<SMOTiming> timings;

	public void addTiming(SMOTiming time) {
		if (this.timings == null) {
			this.timings = new ArrayList<SMOTiming>();

		}
		this.timings.add(time);
	}

	public String getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(String hospitalId) {
		this.hospitalId = hospitalId;
	}

	public List<SMOTiming> getTimings() {
		return timings;
	}

	public void setTimings(List<SMOTiming> timings) {
		this.timings = timings;
	}

}
