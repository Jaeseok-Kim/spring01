package com.example.spring.member.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.example.spring.HomeController;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<MemberDTO> selectList(int pageX) {
		return sqlSession.selectList("member.selectList",pageX);
	}

	@Override
	public MemberDTO view(String userid) {
		return sqlSession.selectOne("member.viewMember",userid);
	}

	@Override
	public void insertMember(MemberDTO memberDto) {
		sqlSession.insert("member.insertMember",memberDto);
		
	}

	@Override
	public void updateMember(MemberDTO memberDto) {
		sqlSession.update("member.updateMember",memberDto);
		
	}

	@Override
	public int countMember() {
		int countResult = sqlSession.selectOne("member.countMember");
		return countResult;
	}

	@Override
	public void deleteMember(String userid) {
		sqlSession.delete("member.deleteMember",userid);
		
	}

	@Override
	public String getUserPw(String userid) {
		return sqlSession.selectOne("member.selectUserPw",userid);
	}

	
	
	

}
