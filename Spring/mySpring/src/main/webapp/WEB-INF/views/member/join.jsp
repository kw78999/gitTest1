<!-- WEB-INF/views/member/joinForm.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Join</h3>
아이디 : ${member.id}<br>
pwd : ${member.getPwd()}<br>
name : ${member.getName()}<br>
email : ${member.getEmail()}<br>

</body>
</html>






