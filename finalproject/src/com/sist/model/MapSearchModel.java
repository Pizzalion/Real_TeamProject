package com.sist.model;

import java.util.*;
import javax.servlet.http.HttpServletRequest;

import com.sist.mapsearch.dao.GPSVO;

public class MapSearchModel {
	
	public void MapSearch(HttpServletRequest request)
	{
		request.setAttribute("asdfasdf", "MapSearch/Map_Main.jsp");
	}
	
	
	//������ ��ǥ���� ����(x),�浵(y)�� �ʿ�
	public List<String> startMapSCH()
	{
		List<String> list = new ArrayList<String>();
		
		return list;
	}
}