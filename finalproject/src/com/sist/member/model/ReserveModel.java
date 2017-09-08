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
import com.sist.wedding.dao.ComVO;

public class ReserveModel {
	
	public void reserve_ok(ReserveVO vo, HttpServletResponse response) {
		MemberDAO dao = new MemberDAO();
		dao.reserveOk(vo);
		try {
			response.sendRedirect("../project.jsp?mode=104");	
		} catch (Exception e) {
			System.out.println("reserve_ok():"+e.getMessage());
		}	
	}
	
	/*public void reservePage(HttpServletRequest request) {
		MemberDAO dao = new MemberDAO();
		HttpSession session=request.getSession();			 
		 String id =(String)session.getAttribute("id");			 	 
		 String strPage=request.getParameter("page");
		 if(strPage==null)
		 	strPage="1";
		 int curpage=Integer.parseInt(strPage);
		 int rowSize=5;
		 int start=(curpage*rowSize)-(rowSize-1);
		 int end=curpage*rowSize;
		List<ComVO> list = dao.bkListData(id,start,end);
		
		double a = dao.totalBkData(id)/(double)rowSize; 
		 int totalpage = (int) Math.ceil(a);
		 request.setAttribute("hlist", list); 			  
		 request.setAttribute("curpage", curpage);
		 request.setAttribute("totalpage", totalpage);			
	}*/
	


	public void reserveDate() {
		System.out.println("�Ϸ�");
		Date date = new Date();//���ó�¥?
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
		String today = sdf.format(date);
		//  System.out.println("���ó�¥:"+today);
		
		StringTokenizer st = new StringTokenizer(today,"-");
		String strYear = st.nextToken();
		String strMonth = st.nextToken();
		String strDay = st.nextToken();
		System.out.println("�Ϸ�");
		int year = Integer.parseInt(strYear);
		int month = Integer.parseInt(strMonth);
		int day = Integer.parseInt(strDay);
		
		 // ��� ==> �޼ҵ� ==> Ŭ���� ==> �������̽� ==> ����ó�� 
		  // ���̺귯�� ==> �� / ������  / ����
		  // �� => �÷��� , �����ͺ��̽�
		  // ������ => ���Խ�
		  // ���� => ������ , ��Ʈ��ũ
		
		int total = (year-1)*365 + (year-1)/4 - (year-1)/100 + (year-1)/400;
		//���� �������� �� day��� : 0����� 2016�����
		//���� ���� : + (year-1)/4 - (year-1)/100 + (year-1)/400
		
		int[] DayOfMonths = { 31,28, 31,30,31,30,31, 31,30,31,30,31};
		if((year%4==0)&&(year%100!=0)||(year%400==0)) {//+�̸� ==, -�̸� !=: ���⿡ �ɸ��� �����̴�
			DayOfMonths[1]=29; //������ �� 2���� �ϼ�
		}else {
			DayOfMonths[1]=28; //����ƴ� �� 2���� �ϼ�
		}
		
		//�̿��� ��¥�� ��
		for(int i=0;i<month-1;i++) {//lastDay�� ���ؼ� month-1�Ѵ�
			total+=DayOfMonths[i];
		}//8�� 30�ϱ��� ���Ѵ�
		total++;//9��1���� �����.
		
		//����- ���� 0�� 1�� 1���� �Ͽ����̴�.
		int firstdayOfWeek = total%7;//9�� 1���� ������ ã�´�.0�̸� �Ͽ����̴�.
		
		String[] strWeek= {"��","��","ȭ","��","��","��","��"};
		
		System.out.println("�Ϸ�");
		/*request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("week", firstdayOfWeek);
		request.setAttribute("strWeek", strWeek);
		request.setAttribute("DayOfMonths", DayOfMonths[month-1]);
		*/
		//������

	}

	}
