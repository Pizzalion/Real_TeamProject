package com.sist.board;

import javax.servlet.http.HttpServletRequest;





public class MainController {
	public void controller(HttpServletRequest request) {
		
		BoardModel bm= new BoardModel();
		String mode=request.getParameter("mode");
		//기능 분리
		if(mode==null)
			mode="300";
		int index=Integer.parseInt(mode);
		switch(index) {
	/*	case 0:
			mm.mainContent(request);
			return;
		case 1:
			mm.isLogin(request);
			return;
		case 2:
			mm.memberJoin(request);
			break;
		case 103:
			mm.memberUpdate(request);
			break;
		case 104:
			mm.likepage(request);
			break;
		case 105:
			rsm.reservePage(request);
			break;	



		case 510:				//지도추가했습니다.
			msm.MapSearch(request);
			break;
		case 300:
			rm.rankingMainListData(request);
			return;
		case 301:
			cm.companyDetailData(request);
			break;*/
		case 400:
			bm.boardAllData(request);
			break;
		}
	}
}
