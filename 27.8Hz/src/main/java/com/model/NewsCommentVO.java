package com.model;

public class NewsCommentVO {
	private int nc_seq;
	private int news_seq;
	private String nc_content;
	private String nc_date;
	private String user_id;
	private int nc_likes;
	
	public NewsCommentVO(int nc_seq, int news_seq, String nc_content, String nc_date, String user_id, int nc_likes) {
		super();
		this.nc_seq = nc_seq;
		this.news_seq = news_seq;
		this.nc_content = nc_content;
		this.nc_date = nc_date;
		this.user_id = user_id;
		this.nc_likes = nc_likes;
	}

	public int getNc_seq() {
		return nc_seq;
	}

	public int getNews_seq() {
		return news_seq;
	}

	public String getNc_content() {
		return nc_content;
	}

	public String getNc_date() {
		return nc_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public int getNc_likes() {
		return nc_likes;
	}
}