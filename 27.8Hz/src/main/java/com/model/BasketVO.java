package com.model;

public class BasketVO { 
	
	private	int basketSeq; // ��ٱ��� ��ȣ
	private	int goodsSeq; // ��ǰ ��ȣ
	private String userID ; // ����� ID
	private int goodsCnt; // ��ǰ ����
	private  String basketDate; // ��ٱ��� ��¥
	
	public BasketVO(int basketSeq, int goodsSeq, String userID, int goodsCnt, String basketDate) {
		super();
		this.basketSeq = basketSeq;
		this.goodsSeq = goodsSeq;
		this.userID = userID;
		this.goodsCnt = goodsCnt;
		this.basketDate = basketDate;
	}

	public int getBasketSeq() {
		return basketSeq;
	}

	public int getGoodsSeq() {
		return goodsSeq;
	}

	public String getUserID() {
		return userID;
	}

	public int getGoodsCnt() {
		return goodsCnt;
	}

	public String getBasketDate() {
		return basketDate;
	}

	
	
 

}
