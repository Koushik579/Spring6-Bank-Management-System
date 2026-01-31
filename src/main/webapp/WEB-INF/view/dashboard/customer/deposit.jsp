<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.koushik.spring6Jdbc2.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Deposit</title>
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
				</a> <a href="${pageContext.request.contextPath}/transactions"> <img
					src="${pageContext.request.contextPath}/img/balance.png"
					style="height: 24px; weidth: 24px"> Check Balance
				</a> <a href="${pageContext.request.contextPath}/deposit"> <img
					src="${pageContext.request.contextPath}/img/deposit.png"
					style="height: 24px; weidth: 24px">Deposit
				</a> <a href="${pageContext.request.contextPath}/withdraw"> <img
					src="${pageContext.request.contextPath}/img/withdraw.png"
					style="height: 24px; weidth: 24px">Withdraw
				</a>
			</div>

			<div class="side-bottom">
				<a href="${pageContext.request.contextPath}/custup"> <img
					src="${pageContext.request.contextPath}/img/settings.png"
					style="height: 24px; weidth: 24px">Settings
				</a> <a href="${pageContext.request.contextPath}/logout"> <img
					src="${pageContext.request.contextPath}/img/logout.png"
					style="height: 24px; weidth: 24px">Logout
				</a>
			</div>
		</div>
		<div id="homediv">
			<div class="customer-header">
				<h1>Deposit</h1>
			</div>
			<div id=moneydiv>
				<br> <br>
				<div>
					<form action="${pageContext.request.contextPath}/redeposit"
						method="post">
						<label>Enter Deposit amount</label><br>
						<p style="color:#E55039">${amerror}</p>
						<input type="text" name="dipamount" placeholder="Enter the amount" />
						<br> <br><input type="password" name="pass" id="pass"
							placeholder="Password" required /> <br><br>
						
						<br> <br>
						<button type="submit">Submit</button>
						<br> <br>
						<h2 style="color: green">${success}</h2>
						<br>
						<p style="color:#E55039">${balerror}</p>
					</form>
					
				</div>
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