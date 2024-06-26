<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>계좌 조회</title>
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #f8f9fa;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
            transition: color 0.3s ease;
        }
        a:hover {
            color: #0056b3;
        }
        .links {
            text-align: center;
            margin-top: 20px;
        }
        .links a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .links a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>계좌 조회</h1>

        <%
            // 세션에서 계좌 정보를 가져옴
            String accountNumber = (String) session.getAttribute("accountNumber");
            String accountHolder = (String) session.getAttribute("accountHolder");
            String balance = (String) session.getAttribute("balance");

            // 세션에 계좌 정보가 있는지 확인
            if (accountNumber != null && accountHolder != null && balance != null) {
        %>
            <!-- 계좌 정보 출력 테이블 -->
            <table>
                <tr>
                    <th>계좌번호</th>
                    <th>예금주</th>
                    <th>잔액</th>
                    <th>해지</th>
                </tr>
                <tr>
                    <!-- 계좌 정보 출력 -->
                    <td><%= accountNumber %></td>
                    <td><%= accountHolder %></td>
                    <td><%= balance %>원</td>
                    <!-- 계좌 해지 링크 -->
                    <td><a href="deleteAccount.jsp?accountNumber=<%= accountNumber %>">해지</a></td>
                </tr>
            </table>
        <%
            } else {
                // 세션에 계좌 정보가 없을 경우 출력
        %>
            <p>등록된 계좌가 없습니다.</p>
        <%
            }
        %>

        <div class="links">
            <a href="createAccount.jsp">새 계좌 개설하기</a>
            <a href="main.jsp">홈으로 돌아가기</a>
        </div>
    </div>
</body>
</html>
