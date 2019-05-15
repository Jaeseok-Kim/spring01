package com.example.spring.member.model;

import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class MemberDTO {
	
	private String userid;
	private String passwd;
	private String name;
	private String email;
	private String comment;
	private char gender;
	private String phone;
	private Date join_date;
	
	public MemberDTO() {
		
	}
	public MemberDTO(String userid, String passwd, String name, String email, String comment, char gender, String phone,
			Date join_date) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.email = email;
		this.comment = comment;
		this.gender = gender;
		this.phone = phone;
		this.join_date = join_date;
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", email=" + email
				+ ", comment=" + comment + ", gender=" + gender + ", phone=" + phone + ", join_date=" + join_date + "]";
	}
	
	
	
	
	
	
}
