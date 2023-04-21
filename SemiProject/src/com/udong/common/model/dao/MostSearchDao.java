package com.udong.common.model.dao;

import java.sql.Statement;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;


import com.udong.common.JDBCTemplate;

public class MostSearchDao {
	
	private Properties prop = new Properties();
	
	public MostSearchDao() {
		String filePath = MostSearchDao.class.getResource("/sql/mostSearch/mostsearch-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (InvalidPropertiesFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<String> getKeyword(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<String> mostSearch = new ArrayList<>();
		String sql = prop.getProperty("getKeyword");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				mostSearch.add(rset.getString("KEYWORD"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		
		return mostSearch;
	}

}
