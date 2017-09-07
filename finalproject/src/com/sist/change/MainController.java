package com.sist.change;
//�̰� ���ߵȴٰ��
import javax.servlet.http.HttpServletRequest;

import com.sist.main.model.CompanyModel;
import com.sist.main.model.RankingModel;
import com.sist.member.model.*;
import com.sist.model.MapSearchModel;
import com.sist.wedding.manager.ReviewModel;



public class MainController {
	public void controller(HttpServletRequest request) {
		RankingModel rm=new RankingModel();
		CompanyModel cm=new CompanyModel();
		MemberModel mm=new MemberModel();
		ReviewModel rvm=new ReviewModel();
		MapSearchModel msm = new MapSearchModel();
		String mode=request.getParameter("mode");
		//��� �и�
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
		case 103:
			mm.memberUpdate(request);
			break;
		case 104:
			mm.likepage(request);
			break;
		case 200:
			rvm.ReviewAllData(request);
			break;
		case 201:
			rvm.WeddingDetailData(request);
			break;	
		case 300:
			rvm.ReviewListData(request);
			rm.rankingMainListData(request);
			return;
		case 301:
			cm.companyDetailData(request);
			break;


		case 510:				//�����߰��߽��ϴ�.
			msm.MapSearch(request);
			break;
		
		}
	}
}
