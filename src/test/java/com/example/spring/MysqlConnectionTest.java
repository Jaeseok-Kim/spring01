package com.example.spring;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.mysql.cj.MysqlConnection;

public class MysqlConnectionTest {

	private static final Logger logger = LoggerFactory.getLogger(MysqlConnection.class);
	
	private static final String DRIVER = "net.sf.log4jdbc.sql.jdbcapi.DriverSpy";
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/testdb?serverTimezone=UTC#";
	private static final String USER = "spring";
	private static final String PW = "spring";
	
	@Test
	public void testConnection() throws Exception{
		Class.forName(DRIVER);
		try(Connection conn = DriverManager.getConnection(URL,USER,PW)){
			System.out.println("mysql에 연결되었습니다.");
			logger.info("mysql에 연결되었습니다(logger)");
			System.out.println(conn);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
