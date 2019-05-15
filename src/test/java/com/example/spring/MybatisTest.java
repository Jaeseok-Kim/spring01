package com.example.spring;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)

//mybatis에서 참조하는 설정파일의 위치
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MybatisTest {
	private static final Logger logger = LoggerFactory.getLogger(MybatisTest.class);
	
	@Inject // @Autowired와 같은 어노테이션
	private SqlSessionFactory sqlFactory;
	//SqlSessionFactory는 root-context에서 생성된 빈에 의해 이미 메모리에 올라가있음
	
	@Test
	public void testFactory() throws Exception{
		System.out.println(sqlFactory);
	}
	
	@Test
	public void testSession() throws Exception{
		//mybatis 실행을 위한 SqlSession 객체 생성
		try(SqlSession sqlsession = sqlFactory.openSession()){
			logger.info("sqlSession = "+sqlsession);
			logger.info("mybatis 연결 성공");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
