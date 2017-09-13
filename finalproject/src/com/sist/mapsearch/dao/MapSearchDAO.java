package com.sist.mapsearch.dao;

import java.util.*;
import java.sql.*;
import java.io.*;
import org.apache.ibatis.io.*;
import org.apache.ibatis.session.*;
import org.apache.log4j.net.SyslogAppender;






public class MapSearchDAO {
	private static SqlSessionFactory ssf;
	
	static
	{
		try
		{
			Reader reader = Resources.getResourceAsReader("mpConfig.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	}
	
	public static List<GPSVO> realizeGPS()
	{
		List<GPSVO> glist = new ArrayList<GPSVO>();
		SqlSession session = null;
		
		try
		{
			session = ssf.openSession();
			glist = session.selectList("testGPS");
			System.out.println(glist.get(1).getX_p());
			System.out.println(glist.get(1).getY_p());
			
			
			
		}catch(Exception ex)
		{
			System.out.println("realizeGPS():"+ex.getMessage());
		}
		
		return glist;		
	}
	
}
