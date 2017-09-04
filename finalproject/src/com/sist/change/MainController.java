package com.sist.change;

import javax.servlet.http.HttpServletRequest;

import com.sist.main.model.CompanyModel;
import com.sist.main.model.RankingModel;
import com.sist.member.model.*;
import com.sist.model.MapSearchModel;



public class MainController {
	public void controller(HttpServletRequest request) {
		RankingModel rm=new RankingModel();
		CompanyModel cm=new CompanyModel();
		MemberModel mm=new MemberModel();
		MapSearchModel msm = new MapSearchModel();
		String mode=request.getParameter("mode");
		//기능 분리
		if(mode==null)
			mode="300";
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
		case 510:				//지도
			msm.MapSearch(request);
			break;
		case 300:
			rm.rankingMainListData(request);
			return;
		case 301:
			cm.companyDetailData(request);
			break;
		}
	}
}
