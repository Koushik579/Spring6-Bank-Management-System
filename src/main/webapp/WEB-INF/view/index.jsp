<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indian Spring Bank</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="landing">
	<div class="hero-overlay">
		<div class="logo">
			<span class="logo-main">Indian Spring</span> <span class="logo-sub">Bank</span>
		</div>

		<p class="bank-tagline">Secure • Simple • Smart Banking</p>

		<div id="log_reg_button">
			<a class="hero-btn" href="${pageContext.request.contextPath}/login">Login</a>

			<a class="hero-btn outline"
				href="${pageContext.request.contextPath}/signup">Register</a>
		</div>
	</div>
</body>

</html>