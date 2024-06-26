<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>거래 내역</title>
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
            text-align: center;
        }
        h1 {
            color: #007bff;
            margin-bottom: 30px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .links {
            margin-top: 20px;
        }
        .links a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .links a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h2>거래 내역</h2>
    <%
        // 세션에서 거래내역 문자열 가져오기
        String transactions = (String) session.getAttribute("transactions");

        if (transactions == null || transactions.isEmpty()) {
            out.println("<p>No transactions found.</p>");
        } else {
            // 거래내역을 세미콜론으로 분리
            String[] transactionArray = transactions.split(";");
    %>
            <table>
                <%
                    for (String transaction : transactionArray) {
                %>
                <tr>
                    <td><%= transaction %></td>
                </tr>
                <%
                    }
                %>
            </table>
    <%
        }
    %>
    <div class="links">
        <a href="viewAccount.jsp">계좌 조회하기</a>
        <a href="main.jsp">메인 페이지로 돌아가기</a>
    </div>
</body>
</html>