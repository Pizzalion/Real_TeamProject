package com.sist.member.model;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.*;
import com.sist.member.*;

public class ReserveModel {
	public void reserve_ok(ReserveVO vo, HttpServletResponse response) {
		MemberDAO dao = new MemberDAO();
		dao.reserveOk(vo);
		try {
			response.sendRedirect("../project.jsp?mode=4");	
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
	
	/*public void reserveMain(HttpServletRequest request){
		
		//request.setAttribute("main_jsp", "../reserve/reserve_main.jsp");
	}*/

	public void reserveDate() {
		System.out.println("완료");
		Date date = new Date();//오늘날짜?
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
		String today = sdf.format(date);
		//  System.out.println("오늘날짜:"+today);
		
		StringTokenizer st = new StringTokenizer(today,"-");
		String strYear = st.nextToken();
		String strMonth = st.nextToken();
		String strDay = st.nextToken();
		System.out.println("완료");
		int year = Integer.parseInt(strYear);
		int month = Integer.parseInt(strMonth);
		int day = Integer.parseInt(strDay);
		
		 // 제어문 ==> 메소드 ==> 클래스 ==> 인터페이스 ==> 예외처리 
		  // 라이브러리 ==> 웹 / 빅데이터  / 게임
		  // 웹 => 컬렉션 , 데이터베이스
		  // 빅데이터 => 정규식
		  // 게임 => 쓰레드 , 네트워크
		
		int total = (year-1)*365 + (year-1)/4 - (year-1)/100 + (year-1)/400;
		//서기 연도기준 총 day계산 : 0년부터 2016년까지
		//윤년 조정 : + (year-1)/4 - (year-1)/100 + (year-1)/400
		
		int[] DayOfMonths = { 31,28, 31,30,31,30,31, 31,30,31,30,31};
		if((year%4==0)&&(year%100!=0)||(year%400==0)) {//+이면 ==, -이면 !=: 윤년에 걸리는 조건이다
			DayOfMonths[1]=29; //윤년일 때 2월의 일수
		}else {
			DayOfMonths[1]=28; //윤년아닐 때 2월의 일수
		}
		
		//이월의 날짜수 합
		for(int i=0;i<month-1;i++) {//lastDay를 위해서 month-1한다
			total+=DayOfMonths[i];
		}//8월 30일까지 합한다
		total++;//9월1일을 만든다.
		
		//요일- 서기 0년 1월 1일이 일요일이다.
		int firstdayOfWeek = total%7;//9월 1일의 요일을 찾는다.0이면 일요일이다.
		
		String[] strWeek= {"일","월","화","수","목","금","토"};
		
		System.out.println("완료");
		/*request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("week", firstdayOfWeek);
		request.setAttribute("strWeek", strWeek);
		request.setAttribute("DayOfMonths", DayOfMonths[month-1]);
		*/
		//예약일

	}

	}
