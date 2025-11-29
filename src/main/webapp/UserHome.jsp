
<%@page import="com.happy_wallet.Bean.TransactionBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.happy_wallet.Dao.Bank_TransactionDAO"%>
<%@page import="com.happy_wallet.Bean.BankUserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Home</title>
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

/* Reset & font */
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

/* NAVBAR */
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

/* HEADINGS */
h1, h2, h3 {
	text-align: center;
	margin-top: 30px;
	margin-bottom: 10px;
}

h2 {
	color: var(--accent);
	font-weight: 700;
}

/* FORM */
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

input[type="text"] {
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

input[type="text"]:focus {
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

/* TRANSACTION TABLE */
table {
	width: 92%;
	max-width: 1000px;
	margin: 32px auto;
	border-collapse: collapse;
	font-size: 1rem;
	background-color: #fff;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.04);
	border-radius: 9px;
	overflow: hidden;
}

thead tr {
	background-color: var(--primary);
	color: #fff;
	text-transform: uppercase;
	letter-spacing: 0.06em;
}

th, td {
	padding: 13px 15px;
	text-align: center;
	border-bottom: 1px solid #eef4ee;
}

tbody tr:nth-child(even) {
	background-color: #f8fdfa;
}

tbody tr:hover {
	background-color: var(--secondary);
	color: white;
	cursor: pointer;
	transition: background-color 0.22s;
}

td.status-success {
	background-color: #4CAF50;
	color: white;
	font-weight: 600;
	border-radius: 4px;
}

td.status-pending {
	background-color: #ff9800;
	color: white;
	font-weight: 600;
	border-radius: 4px;
}

.status-success, .status-pending {
	padding: 7px 0;
}

tr.success-row {
	background-color: #d4edda;
}

tr.pending-row {
	background-color: #fff3cd;
}

/* SUCCESS MESSAGE */
.success-msg {
	background: #d1fae5;
	color: var(--primary);
	border: 1.5px solid var(--secondary);
	border-radius: 7px;
	max-width: 420px;
	margin: 24px auto 0;
	text-align: center;
	font-weight: 650;
	font-size: 1.22rem;
	padding: 13px 15px;
	letter-spacing: 0.01em;
	box-shadow: 0 2px 16px #02BC771a;
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
	.footer {
		background: linear-gradient(90deg, var(--main-blue), var(--teal-accent));
		color: white;
	}
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
	.nav-title {
		font-size: 1.08rem;
		padding-bottom: 2px;
	}
	.navabar {
		padding: 0.52rem 0.09rem;
	}
	.nav-items>li {
		font-size: 0.95rem;
	}
	.footer {
		background: linear-gradient(90deg, var(--main-blue), var(--teal-accent));
		color: white;
	}
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

/* NAVBAR Responsive */
@media ( max-width : 900px) {
	.navabar {
		flex-direction: column;
		align-items: flex-start;
		gap: 0.55rem;
		padding: 0.75rem 0.4rem;
	}
	.nav-title {
		font-size: 1.2rem;
		margin-bottom: 0.3rem;
		text-align: left;
	}
	.nav-items {
		flex-direction: column;
		align-items: flex-start;
		gap: 0.43rem;
		margin-top: 0.22rem;
		width: 100%;
	}
	.nav-items>li {
		font-size: 1rem;
		padding: 0.38rem 0.7rem;
		margin-left: 0;
		width: 100%;
	}
	.items a {
		width: 100%;
		display: block;
		padding-left: 0;
	}
}

@media ( max-width : 600px) {
	.nav-title {
		font-size: 1rem;
		padding-bottom: 2px;
	}
	.navabar {
		padding: 0.4rem 0.03rem;
	}
	.nav-items>li {
		font-size: 0.92rem;
		padding: 0.25rem 0.5rem;
	}
}
</style>
</head>

<body>
	<nav class="navabar">
		<h1 class="nav-title">
			Happy <span>Wallet</span>
		</h1>
		<div class="nav-items">
			<li class="items"><a href="#">Home</a></li>
			<li class="items"><a href="#">About Us</a></li>
			<li class="items"><a href="#">support</a></li>
			<li class="items"><a href="logout">Logout</a></li>
			<li class="items"><a href="EditProfile.jsp">Edit Profile</a></li>
		</div>

	</nav>
	<div>
		<div>
			<%
			BankUserBean bean = (BankUserBean) session.getAttribute("BankUserBean");
			String phone = (String) session.getAttribute("LoginPhone");
			if (bean != null) {

				String msg = (String) request.getAttribute("msg");
				out.println("<h1> Welcome " + bean.getUsername() + "</h1>");
				out.println("<h3>Current Balance: ₹" + Bank_TransactionDAO.getBalance(bean.getAccountNumber()) + "</h3>");
				if(msg!=null)
				{
				out.println("<h2 id='msg'>" + msg + "</h2>");
				}
			}
			String success = (String) request.getAttribute("success");
			if ("true".equals(success)) {
			%>
		</div>
		<div class="success-msg">Transaction Successful!</div>
		<%
		}
		%>
		<form action="transfer" method="post">
			Enter the phone number to transfer:<input type="text" name="phone"
				value="<%=request.getAttribute("phone") != null ? request.getAttribute("phone") : ""%>"><br>
			<br> enter amount <input type="text" name="amount"
				value="<%=request.getAttribute("amount") != null ? request.getAttribute("amount") : ""%>"><br>
			<br> <input type="submit" value="send">
		</form>
	</div>
	<div>
		<%
		ArrayList<TransactionBean> al = new Bank_TransactionDAO().getTransactionList(session);

		if (al.size() == 0) {
		%>
		<h4 style='text-align: center;'>Transaction not done</h4>
		<%
		} else {
		%><h2 style='color: red; text-decoration: underline'>Your
			Transactions</h2>

		<table>
			<thead>
				<tr>
					<th>Transaction ID</th>
					<th>Date</th>
					<th>Description</th>
					<th>Type</th>
					<th>Amount (₹)</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<%
				int count = 0;
				int maxTransactions = 5; // or remove this line if you want all debit transactions
				for (TransactionBean t : al) {
					if (!"DEBIT".equalsIgnoreCase(t.getTxnType())) {
						continue;
					}
					if (count >= maxTransactions) { // only if you want to limit the number displayed
						break;
					}
				%>
				<tr>
					<td><%=t.getTxnId()%></td>
					<td><%=t.getTxnDate()%></td>
					<td><%=t.getDescription()%></td>
					<td><%=t.getTxnType()%></td>
					<td><%=t.getAmount()%></td>
					<td><%=t.getStatus()%></td>
				</tr>
				<%
				count++;
				}
				}
				%>

			</tbody>
		</table>
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
</body>
</html>