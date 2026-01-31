<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.koushik.spring6Jdbc2.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indian Spring Bank - Customers</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	%>

	<div id="homemaindiv">


		<div id="sidepanel">

			<div style="margin-bottom: 20px; color: white;">
				<div style="font-size: 18px; font-weight: 700;">Indian Spring
					Bank</div>
				<div style="font-size: 12px; opacity: 0.8;">Admin Panel</div>
			</div>

			<div class="side-top">
				<a href="${pageContext.request.contextPath}/home"> <img
					src="${pageContext.request.contextPath}/img/home.png"
					style="height: 20px; width: 20px"> Home
				</a> <a href="${pageContext.request.contextPath}/customers"
					class="active"> <img
					src="${pageContext.request.contextPath}/img/customers.png"
					style="height: 20px; width: 20px"> Customers
				</a>
			</div>

			<div class="side-bottom">
				<a href="${pageContext.request.contextPath}/logout"> <img
					src="${pageContext.request.contextPath}/img/logout.png"
					style="height: 20px; width: 20px"> Logout
				</a>
			</div>
		</div>
		<%
		List<User> user = (List<User>) request.getAttribute("users");
		%>

		<div id="homediv">

			<div class="admin-header compact">
				<h2>Customers</h2>
				<span class="header-meta">Total customers: <%=user.size()%></span>
			</div>

			<div id="tablediv" class="table-scroll">
				<div style="height: 6px;"></div>
				<table>
					<thead>
						<tr>
							<th style="padding-left: 15px">Name</th>
							<th>Email Address</th>
							<th>Contact Number</th>
						</tr>
					</thead>

					<tbody>
						<%
						for (User u : user) {
							char fst = u.getFname().charAt(0);
							char snd = u.getLname().charAt(0);
						%>

						<tr>
							<td>
								<form action="${pageContext.request.contextPath}/custDetails"
									method="post" class="name-cell">
									<input type="hidden" name="uname" value="<%=u.getUser()%>" />

									<button type="submit" class="avatar-btn">
										<%=fst%><%=snd%>
									</button>

									<span class="customer-name"> <%=u.getFname()%> <%=u.getLname()%>
									</span>
								</form>
							</td>

							<td><%=u.getEmail()%></td>
							<td><%=u.getPhn()%></td>
						</tr>


						<%
						}
						%>
					</tbody>
				</table>

			</div>


			<div
				style="text-align: center; font-size: 12px; color: #6C757D; margin-top: 10px;">
				© 2026 Indian Spring Bank. All rights reserved.</div>

		</div>
	</div>

	<script src="${pageContext.request.contextPath}/js/validation.js"></script>
</body>
</html>