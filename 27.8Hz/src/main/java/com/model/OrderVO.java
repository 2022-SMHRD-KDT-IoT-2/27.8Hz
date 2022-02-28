package com.model;

public class OrderVO {
	
	private int orderSEQ;
	private String orderDATE;
	private String userID;
	private int totalAmount;
	private int discountAmount;
	private int payAmount;
	private char payMethod;
	private int getOrderSEQ() {
		return orderSEQ;
	}
	public String getOrderDATE() {
		return orderDATE;
	}
	public String getUserID() {
		return userID;
	}
	public int getTotalAmount() {
		return totalAmount;
	}
	public int getDiscountAmount() {
		return discountAmount;
	}
	public int getPayAmount() {
		return payAmount;
	}
	public char getPayMethod() {
		return payMethod;
	}
	
	

}
