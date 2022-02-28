package com.model;

public class CenterVO {
	
	private	int qSeq;	//
	private	String qTitle; // 
	private	String qContent; // 
	private String qFile ; // 
	private String qDate; // 
	private  String userID; // 
	
	public CenterVO(int qSeq, String qTitle, String qContent, String qFile, String qDate, String userID) {
		super();
		this.qSeq = qSeq;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qFile = qFile;
		this.qDate = qDate;
		this.userID = userID;
	}

	public int getqSeq() {
		return qSeq;
	}

	public String getqTitle() {
		return qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public String getqFile() {
		return qFile;
	}

	public String getqDate() {
		return qDate;
	}

	public String getUserID() {
		return userID;
	}
	
	
	
	
}
