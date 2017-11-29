package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.example.demo.stories.StoriesDao;


@RunWith(SpringRunner.class)
@SpringBootTest
public class T1ApplicationTests {

	@Autowired
	private StoriesDao storiesDao;
	
	
	public void contextLoads() throws Exception{
		
		String DRIVER = "com.mysql.jdbc.Driver";
		String URL = "jdbc:mysql://192.168.56.1:3306/chat";
		
		Class.forName(DRIVER);
		
		try(Connection con = DriverManager.getConnection(URL,"root","1234")){
			System.out.println(con);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Test
	public void testte() throws Exception{
		System.out.println("111111");
		
		List<HashMap<String, String>> listAll = storiesDao.getStories(3, 2);
		
			System.out.println(listAll.size());
		
	}

}
