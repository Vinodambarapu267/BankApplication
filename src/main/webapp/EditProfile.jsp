<%@page import="com.happy_wallet.Bean.BankUserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
:root {
	--primary: #237A57;
	--secondary: #02BC77;
	--accent: #008CBA;
	--background: #F9FCFA;
	--white: #fff;
	--text-main: #2C3E50;
	--nav-blue: #1565c0;
	--nav-teal: #009688;
}

*, *::before, *::after {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', 'Roboto', Arial, sans-serif;
}

body {
	background-color: var(--background);
	color: var(--text-main);
}

.navabar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 1.1rem 2rem;
	background: linear-gradient(90deg, var(--nav-blue), var(--nav-teal));
	color: #fff;
	flex-wrap: wrap;
}

.nav-title {
	font-size: 2.25rem;
	font-weight: bold;
	letter-spacing: 2px;
}

.nav-title span {
	color: var(--nav-teal);
	font-weight: 800;
}

.nav-items {
	display: flex;
	gap: 1.1rem;
	list-style: none;
	margin: 0;
	padding: 0;
}

.nav-items>li {
	border-radius: 5px;
	padding: 0.57rem 1.05rem;
	font-size: 1.08rem;
	font-weight: 700;
	transition: background 0.17s;
}

.items a {
	color: #fff;
	text-decoration: none;
	position: relative;
	font-weight: 650;
	padding-bottom: 2px;
	transition: color 0.19s;
}

.items a:hover, .items a:focus {
	color: #f8fdfa;
}

.items a::after {
	content: "";
	position: absolute;
	bottom: -2px;
	left: 0;
	width: 100%;
	height: 3px;
	background: #fff;
	transform: scaleX(0);
	transition: transform 0.3s ease;
	transform-origin: left;
	border-radius: 2px;
}

.items a:hover::after, .items a:focus::after {
	box-shadow: 2px 2px 4px #fff5;
	transform: scaleX(1);
}

h1, h2, h3 {
	text-align: center;
	margin-top: 30px;
	margin-bottom: 10px;
}

h2 {
	color: var(--accent);
	font-weight: 700;
}

form {
	background-color: var(--white);
	max-width: 420px;
	margin: 30px auto 0 auto;
	padding: 24px 28px;
	box-shadow: 0 2px 22px #02BC7722;
	border-radius: 13px;
	border: 1.5px solid var(--secondary);
	display: flex;
	flex-direction: column;
	gap: 10px;
}

label {
	color: var(--primary);
	display: block;
	margin-bottom: 7px;
	font-weight: 600;
	font-size: 1rem;
}

input[type="number"], input[type="text"] {
	width: 100%;
	padding: 10px 13px;
	margin-bottom: 14px;
	border: 1.5px solid var(--secondary);
	border-radius: 6px;
	font-size: 1rem;
	background: var(--white);
	color: var(--text-main);
	box-sizing: border-box;
	transition: border-color 0.18s;
}

input[type="number"], input[type="text"]:focus {
	border-color: var(--primary);
	outline: none;
}

input[type="submit"] {
	background-color: var(--primary);
	color: var(--white);
	border: none;
	padding: 13px 0;
	border-radius: 6px;
	width: 100%;
	font-size: 1.1rem;
	font-weight: bold;
	cursor: pointer;
	box-shadow: 0 2px 8px #02BC7722;
	transition: background 0.20s, transform 0.15s;
	margin-top: 8px;
}

input[type="submit"]:hover, input[type="submit"]:focus {
	background-color: var(--accent);
	transform: scale(1.04);
}

.navabar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 1.1rem 2rem;
	background: linear-gradient(90deg, var(--nav-blue), var(--nav-teal));
	color: #fff;
	flex-wrap: wrap;
}

.nav-title {
	font-size: 2.25rem;
	font-weight: bold;
	letter-spacing: 2px;
}

.nav-title span {
	color: var(--nav-teal);
	font-weight: 800;
}

.nav-items {
	display: flex;
	gap: 1.1rem;
	list-style: none;
	margin: 0;
	padding: 0;
}

.nav-items>li {
	border-radius: 5px;
	padding: 0.57rem 1.05rem;
	font-size: 1.08rem;
	font-weight: 700;
	transition: background 0.17s;
}

.items a {
	color: #fff;
	text-decoration: none;
	position: relative;
	font-weight: 650;
	padding-bottom: 2px;
	transition: color 0.19s;
}

.items a:hover, .items a:focus {
	color: #f8fdfa;
}

.items a::after {
	content: "";
	position: absolute;
	bottom: -2px;
	left: 0;
	width: 100%;
	height: 3px;
	background: #fff;
	transform: scaleX(0);
	transition: transform 0.3s ease;
	transform-origin: left;
	border-radius: 2px;
}

.items a:hover::after, .items a:focus::after {
	box-shadow: 2px 2px 4px #fff5;
	transform: scaleX(1);
}

h1, h2, h3 {
	text-align: center;
	margin-top: 30px;
	margin-bottom: 10px;
}

h2 {
	color: var(--accent);
	font-weight: 700;
}
</style>
</head>

<body>
	<%
	BankUserBean bean = (BankUserBean) session.getAttribute("BankUserBean");
	%>
	<nav class="navabar">
		<h1 class="nav-title">
			Happy <span>Wallet</span>
		</h1>
		<div class="nav-items">
			<li class="items"><a href="#">Home</a></li>
			<li class="items"><a href="#">About us</a></li>
			<li class="items"><a href="#">Support</a></li>
			<li class="items"><a href="logout">Logout</a></li>
		</div>
	</nav>
	<div class="Edit-container">
		<h1>Edit profile</h1>
		<form action="updateProfile" method="post">
			<div>
				<label for="uname"> UserName </label> <input type="text"
					name="uname" id="" value="<%=bean.getUsername()%>">
			</div>
			<div>
				<label for="email"> Email </label> <input type="text" name="mail"
					value="<%=bean.getEmail()%>" id="">
			</div>
			<div>
				<label for="fname">Full Name</label> <input type="text" name="fname"
					value="<%=bean.getFullName()%>" id="">
			</div>
			<div>
				<label for="phone"> Phone Number </label> <input type="text"
					name="phone" id="" value="<%=bean.getPhoneNumber()%>">
			</div>
			<div>
				<label for="accnum">Account Number </label> <input type="text"
					name="accnum" id="" value="<%=bean.getAccountNumber()%>" readonly>
			</div>
			<div>
				<label for="balance">Current Balance </label> <input type="number"
					name="balance" id="" value="<%=bean.getBalance()%>" readonly>
			</div>
			<div>
				<label for="pass">Password </label> <input type="text" name="pass"
					id="" value="<%=bean.getPassword().trim()%>">
			</div>
			<div>
				<label for="confirm-password"> Confirm Password </label> <input
					type="text" name="confi-pass" id=""
					value="<%=bean.getPassword().trim()%> ">
			</div>
			<div>
				<span> </span> <input type="submit" name="Save-changes"
					value="Save Change">
			</div>
		</form>
	</div>
</body>
</html>