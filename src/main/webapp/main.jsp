<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인 페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e9ecef;
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
            margin-bottom: 30px;
        }
        .options {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            margin-bottom: 30px;
        }
        .option {
            flex: 1 1 calc(33.333% - 20px);
            background-color: #ffffff;
            padding: 20px;
            margin: 10px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .option:hover {
            transform: translateY(-5px);
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        .option a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            display: block;
            padding: 10px 0;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .option a:hover {
            background-color: #007bff;
            color: #ffffff;
        }
        .option ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            text-align: center;
        }
        .mypage {
            text-align: center;
            margin-top: 20px; /* 로그아웃 버튼과의 간격 조절 */
        }
        .mypage a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        .mypage a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>환영합니다!</h1>
        <div class="options">
            <div class="option">
                <a href="createAccount.jsp">계좌 개설</a>
            </div>
            <div class="option">
                <a href="viewAccount.jsp">계좌 조회</a>
            </div>
            <div class="option">
                <a href="deposit.jsp">입금</a>
            </div>
            <div class="option">
                <a href="withdraw.jsp">출금</a>
            </div>
            <div class="option">
                <a href="transfer.jsp">송금</a> <!-- 송금 기능 추가 -->
            </div>
            <div class="option">
                <a href="transactionHistory.jsp">거래 내역</a> <!-- 거래 내역 조회 기능 추가 -->
            </div>
            <div class="option">
                <a href="q&a.jsp">Q&A</a> <!-- Q&A 기능 추가 -->
            </div>
        </div>
        <div class="mypage">
            <a href="mypage.jsp">마이페이지</a>
        </div>
        <!-- 로그아웃 버튼 -->
        <div class="mypage">
            <a href="logout.jsp">로그아웃</a>
        </div>
    </div>
</body>
</html>
