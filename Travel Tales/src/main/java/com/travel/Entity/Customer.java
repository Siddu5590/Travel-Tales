package com.travel.Entity;

public class Customer {

	private int customer_id;
	private String c_name;
	private String c_mail;
	private String c_phone;
	private String password;
	
	
	public int getCustomer_id() {
		return customer_id;
	}
	
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	
	public String getC_name() {
		return c_name;
	}
	
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	
	public String getC_mail() {
		return c_mail;
	}
	public void setC_mail(String c_mail) {
		this.c_mail = c_mail;
	}
	
	public String getC_phone() {
		return c_phone;
	}
	
	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
