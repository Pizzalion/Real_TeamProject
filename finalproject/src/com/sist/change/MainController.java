package com.sist.change;
//이게 떠야된다고요
import javax.servlet.http.HttpServletRequest;


import com.sist.main.model.RankingModel;
import com.sist.member.model.*;
import com.sist.model.MapSearchModel;
import com.sist.wedding.manager.EstiModel;
import com.sist.wedding.manager.ReviewModel;



public class MainController {
	public void controller(HttpServletRequest request) {
		RankingModel rm=new RankingModel();
		MemberModel mm=new MemberModel();
		ReviewModel rvm=new ReviewModel();
		MapSearchModel msm = new MapSearchModel();
		EstiModel em=new EstiModel();
		
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
		case 4:
			mm.memberDelete(request);
			break;
		case 5:
			mm.admin(request);
			break;
		
		/*case 6:
			mm.adminDelete(request);
			break;*/
			
		/*case 103:
			mm.memberUpdate(request);
			break;*/
		case 104:
			mm.likepage(request);
			break;
		case 200:
			rvm.ReviewAllData(request);
			break;
		case 201:
			rvm.WeddingDetailData(request);
			break;	
		case 202: //견적리스트
			em.EstiListData(request);
			break;
		case 203: //상세견적
			em.EstiDetailData(request);
			break;
		case 204: //견적내기
			em.estiMain(request);  
			break;	
			
		case 300:
			rvm.ReviewListData(request);
			rm.rankingMainListData(request);
			return;
		case 301:
			rm.rankingListData(request);
			break;
		case 302:
			rm.rankingDetailData(request);
			break;
		case 510:				//지도추가했습니다.
			msm.MapSearch(request);
			break;
		
		}
	}
}
