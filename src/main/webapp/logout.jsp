<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그아웃</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            color: #007bff;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
            padding: 10px 20px;
            background-color: #f1f1f1;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #e9ecef;
        }
    </style>
</head>
<body>
    <%-- 세션 초기화 --%>
    <% session.invalidate(); %>
    
    <%-- 로그아웃 메시지 --%>
    <h2>로그아웃 되었습니다.</h2>
    
    <%-- 로그인 페이지로 이동 --%>
    <a href="login.jsp">로그인 페이지로 이동</a>
</body>
</html>
