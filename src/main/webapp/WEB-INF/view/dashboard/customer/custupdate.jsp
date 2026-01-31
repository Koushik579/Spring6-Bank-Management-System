<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.koushik.spring6Jdbc2.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Settings</title>
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
			<%
			List<User> details = (List<User>) request.getAttribute("users");
			User u = details.get(0);
			%>
			<div class="customer-header">
				<h2>Settings</h2> <h5>(This only updates following records for now)</h5>
			</div>
			<div id=tablediv>

				<form action="${pageContext.request.contextPath}/updatecust"
					method="post">
					<div>
						<h3>Update Records</h3>
						<h5 style="color:green">${msg}</h5>
						<h5 style="color:green">${ermsg}</h5>
					</div>
					<br>
					<label>First Name</label><br>
					<input type="text" name="fname" value="<%=u.getFname()%>" /><br>
					<br> <label>Last Name</label><br>
					<input type="text" name="lname" value="<%=u.getLname()%>" /><br>
					<br> <label>Email</label><br>
					<input type="text" name="email" value="<%=u.getEmail()%>" /><br>
					<br> <label>Contact Number</label><br>
					<input type="text" name="phn" value="<%=u.getPhn()%>" /><br>
					<br> <label>Address</label><br>
					<input type="text" name="address"
						value="<%=u.getAddress()%>" /><br> <br>
					<button type="submit">Submit</button>
				</form>

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