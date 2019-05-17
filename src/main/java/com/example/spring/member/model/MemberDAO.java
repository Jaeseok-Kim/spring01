package com.example.spring.member.model;

import java.util.List;

public interface MemberDAO {
	
	public List<MemberDTO> selectList(int pageX); 
	public MemberDTO view(String userid);
	public void insertMember(MemberDTO memberDto);
	public void updateMember(MemberDTO memberDto);
	public void deleteMember(String userid);
	
	public int countMember();
	public String getUserPw(String userid);
	
	public int idCheck(String userid);

}
