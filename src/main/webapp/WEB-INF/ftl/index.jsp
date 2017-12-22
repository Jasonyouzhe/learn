<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<script src="../resources/js/jquery-1.11.2.min.js"></script>
			welcome:<lable>${user.userName}</lable>
			<p>
			<a href="user/userDetail?userId=${user.id}">查看详细</a>
			</p>
	<script>
		$(document).ready(function() {
		});
	</script>
</body>
</html>