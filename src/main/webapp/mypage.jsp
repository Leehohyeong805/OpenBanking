<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
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
        .account-info {
            margin-top: 20px;
        }
        .account-info h2 {
            color: #333;
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .account-info p {
            margin-bottom: 10px;
            font-size: 16px;
        }
        .home-link {
            text-align: center;
            margin-top: 20px;
        }
        .home-link a {
            text-decoration: none;
            color: #007bff;
            padding: 10px 20px;
            background-color: #f1f1f1;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .home-link a:hover {
            background-color: #e9ecef;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>마이페이지</h1>
        <div class="account-info">
            <h2>계좌 정보</h2>
            <p>계좌번호: <%= session.getAttribute("accountNumber") %></p>
            <p>예금주: <%= session.getAttribute("accountHolder") %></p>
            <p>잔액: <%= session.getAttribute("balance") %>원</p>
        </div>
        <div class="home-link">
            <a href="main.jsp">홈으로 이동</a>
        </div>
    </div>
</body>
</html>
