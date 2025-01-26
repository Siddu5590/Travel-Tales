package com.travel.Entity;

public class Guide_Avail {

	private int id;
	private int guide_id;
	private String slot_date;
	private String avail;
	private int  book_id;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGuide_id() {
		return guide_id;
	}
	public void setGuide_id(int guide_id) {
		this.guide_id = guide_id;
	}
	public String getSlot_date() {
		return slot_date;
	}
	public void setSlot_date(String slot_date) {
		this.slot_date = slot_date;
	}
	public String getAvail() {
		return avail;
	}
	public void setAvail(String avail) {
		this.avail = avail;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	
	
}
