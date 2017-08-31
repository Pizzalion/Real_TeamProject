package com.sist.change;

import javax.servlet.http.HttpServletRequest;

import com.sist.member.model.MemberModel;



public class MainController {
	public void controller(HttpServletRequest request) {
		MemberModel mm=new MemberModel();
		String mode=request.getParameter("mode");
		//��� �и�
		if(mode==null)
			mode="0";
		int index=Integer.parseInt(mode);
		switch(index) {
		case 0:
			mm.mainContent(request);
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
		}
	}
}
