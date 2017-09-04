package com.sist.change;

import javax.servlet.http.HttpServletRequest;

import com.sist.member.model.*;
import com.sist.model.MapSearchModel;



public class MainController {
	public void controller(HttpServletRequest request) {
	
		MemberModel mm=new MemberModel();
		MapSearchModel msm = new MapSearchModel();
		String mode=request.getParameter("mode");
		//기능 분리
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





		case 510:				//지도추가했습니다.
			msm.MapSearch(request);
			break;
		}
	}
}
