package com.hy.spring.book.model;

import java.sql.Timestamp;

public class BookVO {
	int no;
	String title;
	String publisher;
	int price;
	Timestamp joindate;

	public BookVO() {
		super();
	}

	public BookVO(int no, String title, String publisher, int price, Timestamp joindate) {
		super();
		this.no = no;
		this.title = title;
		this.publisher = publisher;
		this.price = price;
		this.joindate = joindate;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Timestamp getJoindate() {
		return joindate;
	}
	public void setJoindate(Timestamp joindate) {
		this.joindate = joindate;
	}

	@Override
	public String toString() {
		return "BookVO [no=" + no + ", title=" + title + ", publisher=" + publisher + ", price=" + price + ", joindate="
				+ joindate + "]";
	}


	
	
	
	
	
	
}
