package com.sist.wedding.manager;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class WeddingManager {
	public static void main(String[] args) {
		WeddingManager wm=new WeddingManager();
		wm.weddingAllData();
	}
	
	/*데이터 가져올수 있는 웨딩홀 주소*/
	 public List<String> weddingSiteData(){
		  List<String> list= new ArrayList<String>();
			try {
				int j=0;
				for(int k=0; k<53; k++) {
				
				Document doc=Jsoup.connect("http://www.ihall.co.kr/rank?start="+(k*50)).get();
				Elements site=doc.select("div.btn_hall_view").select("[onclick]");
			
					for(int i=0; i<site.size(); i++) {
						
						Element atag=site.get(i);
						String code_ip=atag.attr("onClick").substring(16,56);
						
						String ahref=atag.attr("onclick");

						list.add("http://www.ihall.co.kr/"+code_ip);
						
						j++;
					}
				}
			}catch(Exception ex) {
				System.out.println("WeddingManager: "+ex.getMessage());
			}
			
			return list;
	  }
	 /*업체 정보 데이터 파싱*/
	 public List<String> weddingAllData(){
		  List<String> list= new ArrayList<String>();
		  try {
			  List<String> site=weddingSiteData();
			
			  for(int i=0; i<site.size(); i++) {
				  String url=site.get(i);
				  Document doc=Jsoup.connect(url).get(); //포스터
				  int hNo=i+1;
				  Element hName=doc.select("div.hall_info_box div.name").first(); //홀이름
				  Element hScore=doc.select("div.star_score b").first(); //별점
				  Element hAddress=doc.select("div.hall_ctn tr").get(0); //주소
				  String hAdd=hAddress.text().replace("\u00a0", ""); //
				  Element hAddress2=doc.select("div.hall_ctn tr").get(1);//도로명 주소
				  String hAdd2=hAddress2.text().replace("\u00a0", "");//주소 끝에 ? 가 안사라짐
				  Element ht=doc.select("div.hall_ctn tr").get(2); //홀타입
				  String hType=ht.text().replace("\u00a0", "");
				  Element hPrice=doc.select("div.hall_ctn tr").get(3); //식사비용			  
				  String hp=hPrice .text().replace("\u00a0", "");
				  Element hm=doc.select("div.hall_ctn tr").get(4); //메뉴종류		  
				  String hMenu=hm .text().replace("\u00a0", "");
				  Element hpn=doc.select("div.hall_ctn tr").get(5); //보증인원	  
				  String hPerson=hpn .text().replace("\u00a0", "");
				  Element he=doc.select("div.hall_ctn tr").get(6); //보증인원	  
				  String hEvent=he .text().replace("\u00a0", "");
				  Element hc=doc.select("div.checkpoint").first(); //체크포인트
				  String hCheck=hc .text().replace("\u00a0", "");
				  Element poster=doc.select("div.hall_pic img").get(1); //사진 출력결과를 http://www.ihall.co.kr 뒤에 붙여야함
				  String hPoster="http://www.ihall.co.kr"+poster.attr("src");
				
				  System.out.println(hNo+"."+hName.text());
				  System.out.println("별점 :"+hScore.text());
				  System.out.println("주소 :"+hAdd);
				  System.out.println("도로명 주소 :" +hAdd2);
				  System.out.println("홀타입 :" +hType);
				  System.out.println("식사비용:"+hp);
				  System.out.println("메뉴종류:"+hMenu);
				  System.out.println("보증인원:"+hPerson);
				  System.out.println("가능행사:"+hEvent);
				  System.out.println("체크포인트:"+hCheck);				 
				  System.out.println("사진:"+hPoster);
				  System.out.println("===================");
		
				 
	             
	           
			  }
		  }catch(Exception ex) {
			  System.out.println("WeddingAllData:"+ex.getMessage());
		  }
		  return list;
	  }
	  


}
