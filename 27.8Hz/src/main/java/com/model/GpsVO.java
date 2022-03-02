package com.model;

public class GpsVO {
	private double lat; 
	private double lon;
	
	public GpsVO(double lat, double lon) {
		super();
		this.lat = lat;
		this.lon = lon;
	}

	public double getLat() {
		return lat;
	}

	public double getLon() {
		return lon;
	}
}