package com.model;

public class BasketVO { 
	
	private	int basketSeq; // 장바구니 번호
	private	int goodsSeq; // 상품 번호
	private String userID ; // 사용자 ID
	private int goodsCnt; // 상품 개수
	private  String basketDate; // 장바구니 날짜
	
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
