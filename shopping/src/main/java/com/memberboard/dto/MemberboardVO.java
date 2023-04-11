package com.memberboard.dto;

import java.sql.Timestamp;

public class MemberboardVO {
<<<<<<< HEAD
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Timestamp regdate;
	private int viewcnt;
	private String user_name;
	private int recnt;
	
	public int getBno() {
		return bno;
=======
	private int cs_id;
	private String cs_type;
	private String cs_title;
	private String cs_context;
	private Timestamp cs_date;
	private int cs_viewcnt;
	private String cs_answer;
	private Timestamp cs_ansdate;
	private String cs_status;
	private String cs_writer;
	private int cs_recnt;

	public int getCs_id() {
		return cs_id;
>>>>>>> branch 'N.D.O' of https://github.com/kimd0hee/Project_ShoppingMall.git
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getUserName() {
		return user_name;
	}
	public void setUserName(String userName) {
		this.user_name = userName;
	}
	public int getRecnt() {
		return recnt;
	}
	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}

	@Override
	public String toString() {
		return "MemberboardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", userName=" + user_name + ", recnt=" + recnt + "]";
	}
	
}
