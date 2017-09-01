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
	
	/*������ �����ü� �ִ� ����Ȧ �ּ�*/
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
	 /*��ü ���� ������ �Ľ�*/
	 public List<String> weddingAllData(){
		  List<String> list= new ArrayList<String>();
		  try {
			  List<String> site=weddingSiteData();
			
			  for(int i=0; i<site.size(); i++) {
				  String url=site.get(i);
				  Document doc=Jsoup.connect(url).get(); //������
				  int hNo=i+1;
				  Element hName=doc.select("div.hall_info_box div.name").first(); //Ȧ�̸�
				  Element hScore=doc.select("div.star_score b").first(); //����
				  Element hAddress=doc.select("div.hall_ctn tr").get(0); //�ּ�
				  String hAdd=hAddress.text().replace("\u00a0", ""); //
				  Element hAddress2=doc.select("div.hall_ctn tr").get(1);//���θ� �ּ�
				  String hAdd2=hAddress2.text().replace("\u00a0", "");//�ּ� ���� ? �� �Ȼ����
				  Element ht=doc.select("div.hall_ctn tr").get(2); //ȦŸ��
				  String hType=ht.text().replace("\u00a0", "");
				  Element hPrice=doc.select("div.hall_ctn tr").get(3); //�Ļ���			  
				  String hp=hPrice .text().replace("\u00a0", "");
				  Element hm=doc.select("div.hall_ctn tr").get(4); //�޴�����		  
				  String hMenu=hm .text().replace("\u00a0", "");
				  Element hpn=doc.select("div.hall_ctn tr").get(5); //�����ο�	  
				  String hPerson=hpn .text().replace("\u00a0", "");
				  Element he=doc.select("div.hall_ctn tr").get(6); //�����ο�	  
				  String hEvent=he .text().replace("\u00a0", "");
				  Element hc=doc.select("div.checkpoint").first(); //üũ����Ʈ
				  String hCheck=hc .text().replace("\u00a0", "");
				  Element poster=doc.select("div.hall_pic img").get(1); //���� ��°���� http://www.ihall.co.kr �ڿ� �ٿ�����
				  String hPoster="http://www.ihall.co.kr"+poster.attr("src");
				
				  System.out.println(hNo+"."+hName.text());
				  System.out.println("���� :"+hScore.text());
				  System.out.println("�ּ� :"+hAdd);
				  System.out.println("���θ� �ּ� :" +hAdd2);
				  System.out.println("ȦŸ�� :" +hType);
				  System.out.println("�Ļ���:"+hp);
				  System.out.println("�޴�����:"+hMenu);
				  System.out.println("�����ο�:"+hPerson);
				  System.out.println("�������:"+hEvent);
				  System.out.println("üũ����Ʈ:"+hCheck);				 
				  System.out.println("����:"+hPoster);
				  System.out.println("===================");
		
				 
	             
	           
			  }
		  }catch(Exception ex) {
			  System.out.println("WeddingAllData:"+ex.getMessage());
		  }
		  return list;
	  }
	  


}
