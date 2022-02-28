package com.model;

public class MonitoringVO {

	private String driver_id; // ID
	private int heartrate; // �ɹڼ�
	private int o2; // �����ȭ��
	private int temp; // ü��
	private int regdate; // ���� ��¥
	
	public MonitoringVO(String driver_id, int heartrate, int o2, int temp, int regdate) {
		super();
		this.driver_id = driver_id;
		this.heartrate = heartrate;
		this.o2 = o2;
		this.temp = temp;
		this.regdate = regdate;
	}
	
	
	public String getDriver_id() {
		return driver_id;
	}

	public int getHeartrate() {
		return heartrate;
	}
	public int getO2() {
		return o2;
	}
	public int getTemp() {
		return temp;
	}
	public int getRegdate() {
		return regdate;
	}
	
	
	
}
