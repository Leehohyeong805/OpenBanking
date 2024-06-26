<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashSet" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 결과</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #007bff;
        }
        p {
            text-align: center;
            margin-top: 20px;
            font-size: 18px;
        }
        .back-link {
            text-align: center;
            margin-top: 20px;
        }
        .back-link a {
            text-decoration: none;
            color: #007bff;
            padding: 10px 20px;
            background-color: #f1f1f1;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .back-link a:hover {
            background-color: #e9ecef;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>회원가입 결과</h1>
        <% 
        // 이미 존재하는 아이디를 저장하는 HashSet 생성
        HashSet<String> existingUsernames = new HashSet<>();
        existingUsernames.add("user1");
        existingUsernames.add("user2");
        existingUsernames.add("user3");

        // 회원가입 폼에서 전달된 아이디
        String username = request.getParameter("username");

        // 이미 존재하는 아이디인지 확인
        boolean isUsernameExists = existingUsernames.contains(username);

        // 이미 존재하는 아이디인 경우
        if (isUsernameExists) {
        %>
            <p>이미 존재하는 아이디입니다.</p>
        <% 
        } else {
            // 아이디가 존재하지 않는 경우에만 회원가입 처리
            // 실제 회원가입 처리 코드를 여기에 추가
        %>
            <p>회원가입이 완료되었습니다.</p>
        <% } %>
        <div class="back-link">
            <a href="login.jsp">로그인 페이지로 돌아가기</a>
        </div>
    </div>
</body>
</html>
