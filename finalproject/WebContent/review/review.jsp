<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
	
	<div class="w3-row-padding w3-grayscale" style="width:75%; margin-left:200px"  >
	<h2>����Ȧ ȸ�� ����</h2>
	<p>�� 1,073���� �˻����</p><p align="right">�ֽż� | ��ȸ�� | ������</p>
		<ul class="w3-ul w3-card-4">
			  <c:forEach var="vo" items="${rAllList }">  

				<li class="w3-bar" style="height: 180px">
				<span onclick="this.parentElement.style.display='none'"
					class="w3-bar-item w3-button w3-white w3-xlarge w3-right">��
					</span>
					 <!-- Ȧ���=>hoverȿ���ֱ� --> 
					
					 <a href="project.jsp?mode=201&com_no=${vo.com_no }">
					    <div style="width: 200px">
							<img src="${vo.img_src }"
								class="w3-bar-item w3-circle w3-hide-small"
								style="height: 150px; width: 180px">
						</div>

						<div class="w3-bar-item" style="width: 75%">
							<span class="w3-large">${vo.review_title }</span><br>
							<!-- Ȧ�̸� -->
						 ${vo.review_regdate } ${vo.review_writer }<br> 
							<!-- �ۼ���, �ۼ��� -->
							<span>${vo.review_comment }</span><br> 
							<!-- ���� -->
							<p>�ü�: ${vo.review_fscore } ����: ${vo.review_tscore } ����:
								${vo.review_mscore } ����: ${vo.review_pscore } ����:
								${vo.review_sscore } &nbsp; ����: ${vo.review_ave }</p> 
						</div> 
						</a>
						</li>

			  </c:forEach>  
		</ul>

		<div
			style="margin-left: 530px; margin-top: 30px; color: black; font-size: 12px;margin-bottom:50px;">
			<a href="project.jsp?page=${curpage>1?curpage-1:curpage }&mode=200">����</a>&nbsp;
			<a href="project.jsp?page=${curpage<totalpage?curpage+1:curpage }&mode=200">����</a>&nbsp;&nbsp;
			${curpage } page / ${totalpage } pages
		</div>
	</div>

</body>

</html>