package com.example.spring.member.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.spring.member.model.MemberDAO;
import com.example.spring.member.model.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Inject
	MemberDAO memberDao;
	
	@Inject
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public List<MemberDTO> selectList(int pageX) {
		return memberDao.selectList(pageX);
	}

	@Override
	public MemberDTO view(String userid) {
		return memberDao.view(userid);
	}
	
	@Override
	public void insertMember(MemberDTO memberDto) throws Exception{
		 String encPassword = passwordEncoder.encode(memberDto.getPasswd());
		 memberDto.setPasswd(encPassword);
		 memberDao.insertMember(memberDto);
	}

	@Override
	public boolean checkPw(String userid,String passwd) {		
		String encPw = memberDao.getUserPw(userid); //DB에 저장되있는 암호화된 비밀번호
		logger.info("암호화 된 비밀번호 : "+encPw);
		logger.info("사용자가 입력한 비밀번호 : "+passwd);
		return passwordEncoder.matches(passwd, encPw);
	}

	@Override
	public void updateMember(MemberDTO memberDto) {
		memberDao.updateMember(memberDto);
	}

	@Override
	public int countMember() {
		return memberDao.countMember();
	}
	
	@Override
	public void deleteMember(String userid) {
		memberDao.deleteMember(userid);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public int idCheck(String userid) {
		return memberDao.idCheck(userid);
	}

}
