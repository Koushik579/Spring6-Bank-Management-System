<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
	<div id="container">
		<div id="signup">

			<form action="${pageContext.request.contextPath}/register"
				method="post">
				<h2 class="signup-title">Open an account with Indian Spring Bank</h2>
				<br><br>
				<div id="div1">
					<input type="text" name="fname" placeholder="First Name" required />
					<input type="text" name="lname" placeholder="Last Name" required />
				</div>
				<br /> <br />
				<div id="div2">
					<input type="text" name="dob" placeholder="Date of Birth"
						onfocus="this.type='date'"
						onblur="if(!this.value)this.type='text'" required> <input
						type="text" name="email" placeholder="Email Id" required />
				</div>
				<br /> <br />
				<div id="addr">
					<input type="text" name="address" placeholder="Address" required>
				</div>
				<br /> <br />
				<div id="div3">
					<input type="text" name="phn" placeholder="Phone" required /> <input
						type="text" name="accType" list="AccountType"
						placeholder="Account Type" required>

					<datalist id="AccountType">
						<option value="Current">
						<option value="Savings">
					</datalist>
				</div>
				<br /> <br />
				<div id="div4">
					<input type="text" name="user" placeholder="Create Username"
						required /> <input type="password" name="pass" id="pass2"
						placeholder="Password" required />
				</div>

				<div>
					<br /> 
					<div id="checkbox_pass">
						<input type="checkbox" id="showPass" onclick="togglepass2();" /> <label
							for="showPass" class="showpassCheck">Show Password</label>
					</div>
				</div>
				<br />
				<button type="submit">Signup</button>
				<br />
				<p style="color: red; font-size: 14px">${error}</p>
			</form>
			<br /> 
			<div id="log">
				<a href="${pageContext.request.contextPath}/login">Already
				have an account ?..</a>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/validation.js"></script>
</body>
</html>