
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to Happy Wallet</title>
<link rel="stylesheet" type="text/css" href="styles.css">


<script type="text/javascript">
	function Login() {
		alert("Login Successful ");
	}
</script>
<style>
:root {
	--main-blue: #1a237e;
	--blue-accent: #1565c0;
	--teal-accent: #009688;
	--page-bg: #e3eafc;
	--panel-bg: #fff;
	--primary-text: #222;
	--muted-text: #666;
}

*, *::before, *::after {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', 'Roboto', Arial, sans-serif;
}

body {
	min-height: 100vh;
	background: var(--page-bg);
	color: var(--primary-text);
	display: flex;
	flex-direction: column;
}

.poster-container {
	width: 98vw;
	max-width: 1200px;
	margin: 2rem auto;
	min-height: 68vh;
	display: flex;
	border-radius: 15px;
	box-shadow: 0 6px 30px rgba(23, 78, 166, 0.14);
	background: var(--panel-bg);
	overflow: hidden;
}

.welcome-section {
	flex: 4;
	background: linear-gradient(135deg, var(--main-blue) 70%,
		var(--blue-accent) 110%);
	color: #fff;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	padding: 3rem 1.6rem;
}

.welcome-section h1 {
	font-size: 2.3rem;
	letter-spacing: 1.5px;
	font-weight: 800;
	margin-bottom: 1.5rem;
	text-shadow: 0 2px 12px var(--blue-accent);
}

.welcome-section p {
	font-size: 1.15rem;
	opacity: 0.96;
	font-weight: 400;
	text-align: center;
	line-height: 1.7;
	max-width: 350px;
}

.login-section {
	flex: 5;
	display: flex;
	align-items: center;
	justify-content: center;
	background: var(--panel-bg);
	padding: 2.5rem;
}

form {
	width: 100%;
	max-width: 350px;
	margin: 0 auto;
	background: var(--page-bg);
	padding: 2.2rem 1.8rem 1.2rem;
	border-radius: 11px;
	box-shadow: 0 2px 14px rgba(33, 150, 243, 0.16);
	display: flex;
	flex-direction: column;
	gap: 1.3rem;
}

form h3 {
	text-align: center;
	font-size: 1.55rem;
	color: var(--main-blue);
	font-weight: 700;
	margin-bottom: 0.6rem;
}

.form-group {
	display: flex;
	flex-direction: column;
	gap: 0.30rem;
}

label {
	color: var(--blue-accent);
	font-weight: 600;
	margin-bottom: 0.2rem;
	font-size: 1.02rem;
}

input[type='text'], input[type='password'] {
	width: 100%;
	font-size: 1.05rem;
	padding: 0.7rem 0.9rem;
	border-radius: 6px;
	border: 1.5px solid var(--blue-accent);
	background: #fff;
	transition: border 0.17s;
	font-weight: 400;
}

input[type='text']:focus, input[type='password']:focus {
	outline: none;
	border-color: var(--main-blue);
}

.check {
	display: flex;
	align-items: center;
	justify-content: space-between;
	gap: 0.4rem;
}

.rem {
	display: flex;
	align-items: center;
	gap: 0.5rem;
}

.rem span {
	font-size: 0.95rem;
	color: var(--blue-accent);
	font-weight: 600;
}

a {
	color: var(--teal-accent);
	font-weight: 500;
	text-decoration: none;
	transition: color 0.2s;
}

a:hover, a:focus {
	color: var(--main-blue);
	text-decoration: underline;
	outline: none;
}

input[type='submit'] {
	background: var(--main-blue);
	color: #fff;
	font-size: 1.09rem;
	font-weight: bold;
	padding: 0.9rem 0;
	border: none;
	border-radius: 6px;
	box-shadow: 0 2px 7px rgba(30, 64, 175, 0.08);
	margin-top: 0.5rem;
	cursor: pointer;
	transition: background 0.17s;
}

input[type='submit']:hover, input[type='submit']:focus {
	background: var(--teal-accent);
	outline: none;
}

.register-section {
	text-align: center;
	color: var(--main-blue);
	font-size: 1rem;
	margin-top: 0.7rem;
}

.msg-box {
	background: #fff;
	color: #e53935;
	border: 2px solid #e57373;
	border-radius: 8px;
	padding: 1rem;
	margin: 1rem auto;
	max-width: 390px;
	font-size: 1.15rem;
	font-weight: 700;
	text-align: center;
	box-shadow: 0 2px 11px rgba(233, 30, 99, 0.08);
	animation: fadeIn 0.6s;
}

@
keyframes fadeIn {from { opacity:1;
	transform: translateY(-10px);
}

to {
	opacity: 1;
	transform: none;
}

}
.navabar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 1.2rem 2rem;
	background: linear-gradient(90deg, var(--main-blue), var(--teal-accent));
	color: #fff;
}

.nav-title {
	font-size: 2.5rem;
	font-weight: bold;
	letter-spacing: 2px;
}

.nav-title span {
	color: var(--teal-accent);
	font-weight: 800;
	font-size: 2.5rem;
	font-weight: bold;
}

.nav-items {
	display: flex;
	gap: 1.2rem;
	list-style: none;
}

.nav-items>li {
	list-style: none;
	margin: 5px;
	border-radius: 5px;
	padding: 5px;
	font-size: large;
	font-weight: 800;
}

.items a {
	position: relative;
	text-decoration: none;
	color: white;
}

.items a:hover {
	color: white;
}

.items a::after {
	content: "";
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 3px;
	background-color: transparent;
	transform: scaleX(0);
	transition: transform 0.3s ease;
	transform-origin: left;
}

.items a:hover::after {
	box-shadow: 2px 2px 2px white;
	transform: scaleX(1);
	color: black;
}

.footer {
	width: 100%;
	background: linear-gradient(90deg, var(--main-blue), var(--teal-accent));
	color: white;
	padding: 1.2rem 0 0.7rem 0;
	margin-top: 2rem;
	box-shadow: 0 -2px 8px rgba(23, 78, 166, 0.07);
}

.footer-content {
	max-width: 1200px;
	margin: 0 auto;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	align-items: center;
	padding: 0 2rem;
	gap: 0.7rem;
}

.footer-brand {
	font-size: 1.2rem;
	font-weight: bold;
	letter-spacing: 1px;
}

.footer-brand span {
	color: var(--teal-accent);
	font-weight: 800;
}

.footer-copy {
	font-size: 1rem;
	opacity: 0.9;
}

.footer-links {
	display: flex;
	gap: 1.2rem;
}

.footer-links a {
	color: #fff;
	text-decoration: none;
	font-weight: 500;
	transition: text-decoration 0.2s, color 0.19s;
}

.footer-links a:hover, .footer-links a:focus {
	text-decoration: underline;
	color: var(--panel-bg);
}

/* Responsive Footer */
@media ( max-width : 700px) {
	.footer-content {
		flex-direction: column;
		align-items: center;
		gap: 0.85rem;
		padding: 0 0.8rem;
	}
	.footer-copy {
		font-size: 0.98rem;
		text-align: center;
	}
	.footer-links {
		gap: 0.7rem;
	}
}

@media ( max-width : 500px) {
	.footer-content {
		padding: 0 0.3rem;
	}
	.footer-brand {
		font-size: 1rem;
	}
	.footer-copy {
		font-size: 0.92rem;
	}
	.footer-links a {
		font-size: 0.97rem;
	}
}

/* Responsive Design */
@media ( max-width : 1020px) {
	.poster-container {
		flex-direction: column;
		width: 98vw;
		min-height: auto;
	}
	.welcome-section, .login-section {
		min-height: 200px;
		width: 100%;
		padding: 1.5rem 2vw;
	}
	.login-section {
		justify-content: flex-start;
	}
}
</style>
<script>
	window.onload = function() {
		var msg = document.getElementById('msg');
		if (msg) {
			setTimeout(function() {
				msg.style.display = 'none';
			}, 5000);
		}
	}
</script>
</head>
<body>
	<nav class="navabar">
		<h1 class="nav-title">
			Happy <span>Wallet</span>
		</h1>
		<div class="nav-items">
			<li class="items"><a href="#">Home</a></li>
			<li class="items"><a href="#">Support</a></li>		
			<li class="items"><a href="#">About us</a></li>
		</div>

	</nav>

	<div class="poster-container">
		<div class="welcome-section">
			<h1>Welcome to Happy Wallet</h1>
			<p>Experience secure, seam-less, and smart banking with Happy
				Wallet. Manage your finances online with confidence and ease.</p>
			<%
			String msg = (String) request.getAttribute("msg");
			if (msg != null && msg.trim().length() > 0) {
			%>
			<div class="msg-box" id='msg'><%=msg%></div>
			<%
			}
			%>
		</div>
		<div class="login-section">
			<form action="log" method="post">
				<h3>Login to your Account</h3>
				<div class="form-group">
					<label for="uname">User Name</label> <input type="text"
						name="uname" id="uname" required>
				</div>
				<div class="form-group">
					<label for="pass">Password</label> <input type="password"
						name="pass" id="pass" required>
				</div>
				<div class="check">
					<div class="rem">
						<input type="checkbox" name="remember" id="remember"> <span>Remember
							me</span>
					</div>
					<div>
						<a href="forgetpassword">Forgot Password?</a>
					</div>
				</div>
				<input type="submit" value="Login">
				<div class="register-section">
					<span>Don't have an account?</span> <a href="Register.html">Register</a>
				</div>
			</form>
		</div>
	</div>
	<footer class="footer">
		<div class="footer-content">
			<span class="footer-brand">Happy <span>Wallet</span></span> <span
				class="footer-copy">&copy; 2025 Happy Wallet. All rights
				reserved.</span>
			<div class="footer-links">
				<a href="#">About</a> <a href="#">Privacy Policy</a> <a href="#">Contact</a>
			</div>
		</div>
	</footer>

</body>
</html>
