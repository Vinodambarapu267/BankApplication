<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
<style>
.logout {
    position: absolute;
    top: 200px;
    left: 50%;
    transform: translateX(-50%);
    border:2px solid red;
    padding:20px;
    border-radius:20px 0;
    box-shadow:2px 2px 2px red;
}
</style>
</head>
<body>
<h1 class="logout">Logout successfully</h1>

<script>
    setTimeout(() => {
        window.location.href = "bankLogin.jsp";
    }, 2000);  // Redirect after 3 seconds
</script>
</body>
</html>