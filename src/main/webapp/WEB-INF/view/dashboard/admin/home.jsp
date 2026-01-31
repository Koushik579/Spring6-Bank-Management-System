<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.koushik.spring6Jdbc2.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	%>
	<div id=homemaindiv>
		<div id="sidepanel">
			<div style="margin-bottom: 20px; color: white;">
				<div style="font-size: 18px; font-weight: 700;">Indian Spring
					Bank</div>
				<div style="font-size: 12px; opacity: 0.8;">Admin Panel</div>
			</div>
			<div class="side-top">
				<a href="${pageContext.request.contextPath}/home"> <img
					src="${pageContext.request.contextPath}/img/home.png"
					style="height: 24px; weidth: 24px">Home
				</a> <a href="${pageContext.request.contextPath}/customers"> <img
					src="${pageContext.request.contextPath}/img/customers.png"
					style="height: 24px; weidth: 24px">Customers
				</a>

			</div>

			<div class="side-bottom">
				<a href="${pageContext.request.contextPath}/logout"> <img
					src="${pageContext.request.contextPath}/img/logout.png"
					style="height: 24px; weidth: 24px">Logout
				</a>
			</div>
		</div>
		<div id="homediv">
			<div class="admin-header">
				<%
				List<Admin> details = (List<Admin>) request.getAttribute("users");
				Admin a = details.get(0);
				%>
				<h1>Indian Spring Bank — Admin Dashboard</h1>
				<h4>
					Welcome back,
					<%=a.getFname()%>
					• Manager ID:
					<%=a.getId()%></h4>
			</div>
			<div id=tablediv>
				<strong>Administrator Profile</strong>
				<br><br>
				Name :
				<%=a.getFname()%>
				<%=a.getLname()%><br> <br> Role :
				<%=a.getDesignation()%><br> <br> Email :
				<%=a.getEmail()%><br> <br> Contact Number :
				<%=a.getPhn()%><br> <br> Office Address :
				<%=a.getAddress()%><br> <br><br> <br>
			</div>
			<div style="text-align:center; font-size:12px; color:#6C757D; margin-top: 10px;">
				© 2026 Indian Spring Bank. All rights reserved.
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/validation.js">
		
	</script>
</body>
</html>