
package com.sist.change;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.member.model.MemberModel;
import com.sist.wedding.manager.ReviewModel;

import javax.servlet.http.HttpServletRequest;

import com.sist.member.model.MemberModel;



public class MainController {
	public void controller(HttpServletRequest request) {
		MemberModel mm=new MemberModel();
		ReviewModel rm=new ReviewModel();
		String mode=request.getParameter("mode");
		//기능 분리
		if(mode==null)
			mode="0";
		int index=Integer.parseInt(mode);
		switch(index) {
		case 0:
		//	mm.mainContent(request);
			rm.ReviewListData(request);
			return;
		case 1:
			mm.isLogin(request);
			return;
		case 2:
			mm.memberJoin(request);
			break;
		case 3:
			mm.memberUpdate(request);
			break;
		case 4:
			mm.likepage(request);
			break;
		case 200:
			rm.ReviewAllData(request);
			break;
		case 201:
			rm.WeddingDetailData(request);
			break;				
		}
	}
}

