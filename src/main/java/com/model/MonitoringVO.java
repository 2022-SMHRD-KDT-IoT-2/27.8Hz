package com.model;

public class MonitoringVO {

	private String driver_id; // ID
	private int monitoring_seq;
	private int heartrate; // �ɹڼ�
	private int o2; // �����ȭ��
	private int temp; // ü��
	private String regdate; // ���� ��¥
	
	public MonitoringVO(String driver_id, int monitoring_seq, int heartrate, int o2, int temp, String regdate) {
		super();
		this.driver_id = driver_id;
		this.monitoring_seq = monitoring_seq;
		this.heartrate = heartrate;
		this.o2 = o2;
		this.temp = temp;
		this.regdate = regdate;
	}
	
	
	public String getDriver_id() {
		return driver_id;
	}
	
	public int getMonitoring_seq() {
		return monitoring_seq;
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
	public String getRegdate() {
		return regdate;
	}
	
	
	
}
