package com.sist.model;

import java.util.*;
import javax.servlet.http.HttpServletRequest;

import com.sist.mapsearch.dao.GPSVO;

public class MapSearchModel {
	
	public void MapSearch(HttpServletRequest request)
	{
		request.setAttribute("main_jsp", "MapSearch/Map_Main.jsp");
	}
	
	
	//지도에 좌표점은 위도(x),경도(y)가 필요
	public List<String> startMapSCH()
	{
		List<String> list = new ArrayList<String>();
		
		list.add("");
		
		return list;
	}
}
