<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 결과</title>
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

        p {
            text-align: center;
            margin-top: 20px;
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
    <%-- 로그인 결과 메시지 --%>
    <h2>로그인 결과</h2>
    <% if (request.getParameter("error") != null && request.getParameter("error").equals("true")) { %>
        <p>아이디 또는 비밀번호가 올바르지 않습니다. 다시 시도해 주세요.</p>
    <% } else { %>
        <p>로그인이 성공적으로 완료되었습니다. 환영합니다!</p>
    <% } %>

    <%-- 메인 페이지로 이동 링크 --%>
    <a href="main.jsp">메인 페이지로 이동</a>
</body>
</html>
