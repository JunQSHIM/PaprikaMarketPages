package com.spring.myweb.VO.PostVO;

import java.util.Date;


public class PostVO {
	
	private int post_seq;
	private int user_seq;
	private String nickname;
	private String post_title;
	private String post_content;
	private int price;
	private String location1;
	private String location2;
	private int category_seq;
	private int cnt;
	private int prod_status;

	public int getProd_status() {
		return prod_status;
	}
	public void setProd_status(int prod_status) {
		this.prod_status = prod_status;
	}
	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}
	public String getLocation1() {
		return location1;
	}
	public void setLocation1(String location1) {
		this.location1 = location1;
	}
	public String getLocation2() {
		return location2;
	}
	public void setLocation2(String location2) {
		this.location2 = location2;
	}
	private String upload_date;
	private int sell_status;
	private int status;
	private int pay_check;
	
	public int getPay_check() {
		return pay_check;
	}
	public void setPay_check(int pay_check) {
		this.pay_check = pay_check;
	}
	public int getPost_seq() {
		return post_seq;
	}
	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	public int getCategory_seq() {
		return category_seq;
	}
	public void setCategory_seq(int category_seq) {
		this.category_seq = category_seq;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(Date upload_date) {
		this.upload_date = Time.calculateTime(upload_date);
	}
	public int getSell_status() {
		return sell_status;
	}
	public void setSell_status(int sell_status) {
		this.sell_status = sell_status;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "PostVO [post_seq=" + post_seq + ", user_seq=" + user_seq + ", nickname=" + nickname + ", post_title="
				+ post_title + ", post_content=" + post_content + ", price=" + price + ", location1=" + location1
				+ ", location2=" + location2 + ", category_seq=" + category_seq + ", cnt=" + cnt + ", upload_date="
				+ upload_date + ", sell_status=" + sell_status + ", status=" + status + ", pay_check=" + pay_check
				+ "]";
	}
	

}
