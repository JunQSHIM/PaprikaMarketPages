package com.spring.myweb.VO.MyMannerVO;

import java.util.Date;

import com.spring.myweb.VO.PostVO.Time;

import lombok.Data;


public class MyMannerVO {
	private int user_seq; //구매한 유저
	private int	sell_user_seq; // 판매한 유저
	private int post_seq; // 판매된 게시물
	private int manner_temp; // 별점개수
	private String manner_compliment; // 칭찬 매너
	private String bad_manner; // 비매너
	private String manner_review; //후기작성
	private String create_date; // 생성날짜
	
	private String nickname;
	private String post_title;
	
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public int getSell_user_seq() {
		return sell_user_seq;
	}
	public void setSell_user_seq(int sell_user_seq) {
		this.sell_user_seq = sell_user_seq;
	}
	public int getPost_seq() {
		return post_seq;
	}
	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}
	public int getManner_temp() {
		return manner_temp;
	}
	public void setManner_temp(int manner_temp) {
		this.manner_temp = manner_temp;
	}
	public String getManner_compliment() {
		return manner_compliment;
	}
	public void setManner_compliment(String manner_compliment) {
		this.manner_compliment = manner_compliment;
	}
	public String getBad_manner() {
		return bad_manner;
	}
	public void setBad_manner(String bad_manner) {
		this.bad_manner = bad_manner;
	}
	public String getManner_review() {
		return manner_review;
	}
	public void setManner_review(String manner_review) {
		this.manner_review = manner_review;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = Time.calculateTime(create_date);
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
	@Override
	public String toString() {
		return "MyMannerVO [user_seq=" + user_seq + ", sell_user_seq=" + sell_user_seq + ", post_seq=" + post_seq
				+ ", manner_temp=" + manner_temp + ", manner_compliment=" + manner_compliment + ", bad_manner="
				+ bad_manner + ", manner_review=" + manner_review + ", create_date=" + create_date + ", nickname="
				+ nickname + ", post_title=" + post_title + "]";
	}
	
	

}
