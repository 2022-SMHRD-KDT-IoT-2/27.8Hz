package com.model;

public class CenterCommentVO {
	
	private	int aSeq;	//
	private	int qSeq; // 
	private	int aContent; // 
	private String aFile ; // 
	private String aDate; // 
	private  String userID; // 
	
	public CenterCommentVO(int aSeq, int qSeq, int aContent, String aFile, String aDate, String userID) {
		super();
		this.aSeq = aSeq;
		this.qSeq = qSeq;
		this.aContent = aContent;
		this.aFile = aFile;
		this.aDate = aDate;
		this.userID = userID;
	}

	public int getaSeq() {
		return aSeq;
	}

	public int getqSeq() {
		return qSeq;
	}

	public int getaContent() {
		return aContent;
	}

	public String getaFile() {
		return aFile;
	}

	public String getaDate() {
		return aDate;
	}

	public String getUserID() {
		return userID;
	}
	
	

	
	
	
}
