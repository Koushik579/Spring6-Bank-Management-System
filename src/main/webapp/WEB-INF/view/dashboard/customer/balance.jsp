<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.koushik.spring6Jdbc2.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Balance</title>
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
				<h1>Account Balance</h1>
				<h3>
					₹
					<%=u.getBalance()%></h3>
			</div>
			<div id=tablediv>
				<div>
					<h3>Transaction History</h3>
				</div>
				<table>
					<tr>
						<th>Transaction Id</th>
						<th>Amount</th>
						<th>Type</th>
						<th>Balance</th>
						<th>Date & Time</th>
					</tr>

					<%
					List<Transactions> tran = (List<Transactions>) request.getAttribute("transactions");
					for (Transactions t : tran) {
					%>
					<tr>
					<tr>
						<td><%=t.getTxnId()%></td>
						<td>₹ <%=t.getAmount()%></td>
						<td><%=t.getTxnType()%></td>
						<td>₹ <%=t.getBalance()%></td>
						<td><%=t.getDate()%></td>
					</tr>
					</tr>

					<%}%>
				</table>
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