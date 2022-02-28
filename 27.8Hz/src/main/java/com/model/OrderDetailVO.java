package com.model;

public class OrderDetailVO {
	
	private int orderDetailSEQ;
	private int goodsSEQ;
	private int goodsCNT;
	private int orderSEQ;
	
	public OrderDetailVO(int orderDetailSEQ, int goodsSEQ, int goodsCNT, int orderSEQ) {
		super();
		this.orderDetailSEQ = orderDetailSEQ;
		this.goodsSEQ = goodsSEQ;
		this.goodsCNT = goodsCNT;
		this.orderSEQ = orderSEQ;
	}
	public int getOrderDetailSEQ() {
		return orderDetailSEQ;
	}
	public int getGoodsSEQ() {
		return goodsSEQ;
	}
	public int getGoodsCNT() {
		return goodsCNT;
	}
	public int getOrderSEQ() {
		return orderSEQ;
	}
	
	

}
