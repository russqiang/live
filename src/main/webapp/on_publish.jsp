<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="jquery/jquery.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form id="checkForm" action="stream.do" method="post">
		<input name="name" value="${name }">
		<input name="password" value="${password }">
	</form>
	<!-- <script type="text/javascript">
		$("#checkForm").submit();
	</script> -->
</body>
</html>