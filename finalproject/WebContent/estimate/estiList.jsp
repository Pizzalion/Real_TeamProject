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

	<div class="w3-row-padding w3-grayscale"
		style="width: 80%; margin-left: 200px">
		<h2>����Ȧ ������</h2>
		<!-- <p>�� 1,073���� �˻����</p> -->
		<!-- <p align="right">�ֽż� | ��ȸ�� | ������</p> -->
		<ul class="w3-ul w3-card-4">
			<c:forEach var="vo" items="${eList }">
			
				<li class="w3-bar" style="height: 180px; valign: center">
				<!-- Ȧ���=>hoverȿ���ֱ� --> 
			
					<a href="project.jsp?mode=203&com_no=${vo.no }">
						<div style="width: 200px">
							<img src="${vo.com_pic }"
								class="w3-bar-item w3-circle w3-hide-small"
								style="height: 150px; width: 180px">
						</div>

						<div class="w3-bar-item" style="width: 80%; margin-top:30px;">

							<span class="w3-large">${vo.com_title }</span><br>
							${vo.opt_name} | ${vo.opt_price }
							 <br>
							�� ���� �ݾ� : ${vo.tot_price }
						${vo.hall_no }  ${vo.com_no }  ${vo.no }
						</div>
						<a href="project.jsp?mode=203&com_no=${vo.no }">
						<span class="w3-bar-item w3-button w3-black w3-large w3-right" style="margin-top:-50px;"> ���� �󼼺��� </span></a>
	
				</a>
				</li>

			</c:forEach>
		</ul>

		<div
			style="margin-left: 530px; margin-top: 30px; color: black; font-size: 12px; margin-bottom: 50px;">
			<a href="project.jsp?page=${curpage>1?curpage-1:curpage }&mode=202">����</a>&nbsp;
			<a
				href="project.jsp?page=${curpage<totalpage?curpage+1:curpage }&mode=202">����</a>&nbsp;&nbsp;
			${curpage } page / ${totalpage } pages
		</div>
	</div>

</body>

</html>