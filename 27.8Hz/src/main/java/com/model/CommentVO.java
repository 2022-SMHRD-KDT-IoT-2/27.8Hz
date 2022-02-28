package com.model;

public class CommentVO {
	
	private	int commentSeq;	//
	private	String articleSeq; // 
	private	String commentCon; // 
	private String commentDate; // 
	private String userID; // 
	private  String commentLikes; // 
	
	
	public CommentVO(int commentSeq, String articleSeq, String commentCon, String commentDate, String userID,
			String commentLikes) {
		super();
		this.commentSeq = commentSeq;
		this.articleSeq = articleSeq;
		this.commentCon = commentCon;
		this.commentDate = commentDate;
		this.userID = userID;
		this.commentLikes = commentLikes;
	}


	public int getCommentSeq() {
		return commentSeq;
	}


	public String getArticleSeq() {
		return articleSeq;
	}


	public String getCommentCon() {
		return commentCon;
	}


	public String getCommentDate() {
		return commentDate;
	}


	public String getUserID() {
		return userID;
	}


	public String getCommentLikes() {
		return commentLikes;
	}
	
	
	
	
	

}
