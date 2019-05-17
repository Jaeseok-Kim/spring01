package com.example.spring.member.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.spring.member.model.MemberDTO;

public interface MemberService {
	
	
	public List<MemberDTO> selectList(int pageX);
	public MemberDTO view(String userid);
	public void insertMember(MemberDTO memberDto) throws Exception;
	public boolean checkPw(String userid,String passwd);
	public void updateMember(MemberDTO memberDto);
	public void deleteMember(String userid);
	
	public int countMember();
	
	public void logout(HttpSession session);
	public int idCheck(String userid);
}
