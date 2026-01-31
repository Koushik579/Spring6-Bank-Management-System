<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.koushik.spring6Jdbc2.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer</title>
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
			<%
			List<User> details = (List<User>) request.getAttribute("details");
			User u = details.get(0);
			%>
			<div class="customer-header detail-header">
				<div>
					<h2>Customer Profile</h2>
					<h3><%=u.getFname()%>
						<%=u.getLname()%></h3>
					<span class="sub-meta">Account No: <%=u.getAccNum()%></span>
				</div>

				<span class="status-badge <%=u.getStatus().toLowerCase()%>">
					<%=u.getStatus()%>
				</span>
			</div>
			<div id=tablediv>

				<u><h3>Customer Details</h3></u> <b>Name :</b>
				<%=u.getFname()%>
				<%=u.getLname()%><br> <b>Date Of Birth :</b>
				<span><%=u.getDob()%> (YYYY/DD/MM)</span>
				 <br> <u><h3>Account Details</h3></u> <b>Account
					Number :</b>
				<%=u.getAccNum()%>
				<br>
				<b>Account Type :</b>
				<%=u.getAccType()%>
				<br> <u><h3>Contact Details</h3></u> <b>Address :</b>
				<%=u.getAddress()%>
				<br>
				<b>Email id :</b>
				<%=u.getEmail()%><br>
				<b>Phone No :</b>
				<%=u.getPhn()%>

				<br> <u><h3>Status</h3></u>
				<b>Account Opening Date :</b>
				<%=u.getOpenDate()%><br> <b>Account Status : </b><span
					style="color: green"><%=u.getStatus()%></span>

			</div>
			<div
				style="text-align: center; font-size: 12px; color: #6C757D; margin-top: 10px;">
				© 2026 Indian Spring Bank. All rights reserved.</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/validation.js">
		
	</script>
</body>
</html>