<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<div id="container">
		<div id="login">
			<form action="${pageContext.request.contextPath}/home" method="post">
				<br>
				<div>
					<label onclick="admintoggle();" id="admin">Admin</label> | <label
						onclick="custtoggle();" id="customer">Customer</label>
				</div>
				<br /> <br /> <br /> <input type="hidden" name="role" id="role"
					value="customer"> <input type="text" name="uname"
					placeholder="UserName/Email" required /> <br /> <br /> <input
					type="password" name="pass" id="pass" placeholder="Password"
					required /> <br /> <br />
				<div>
					<div id="checkbox_pass">
						<input type="checkbox" id="showPass" onclick="togglepass();" /> <label
							for="showPass" class="showpassCheck">Show Password</label>
					</div>
				</div>
				<br /> <br />
				<button type="submit">Login</button>
				<br />
				<p style="color: red; font-size: 14px">${msg}</p>
			</form>
			<br /> <a href="${pageContext.request.contextPath}/signup">Don't
				have an account ?...</a>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/validation.js">
		
	</script>
</body>
</html>