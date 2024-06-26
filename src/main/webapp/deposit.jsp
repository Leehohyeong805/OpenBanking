<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>입금</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e9ecef;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
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
        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 15px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        p {
            color: #d9534f;
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
    <div class="container">
        <h1>입금</h1>

        <% 
            // 세션에서 계좌 정보 가져오기
            String accountNumber = (String) session.getAttribute("accountNumber");
            String accountHolder = (String) session.getAttribute("accountHolder");
            String balance = (String) session.getAttribute("balance");

            // 계좌 번호가 없으면 메시지 출력
            if (accountNumber == null || accountNumber.isEmpty()) {
        %>
            <p>계좌가 존재하지 않습니다. 계좌를 먼저 생성해주세요.</p>
        <%
            } else {
                // 유효한 입금 액수인지 확인
                boolean isValidAmount = true;
                int depositAmount = 0;

                String depositAmountStr = request.getParameter("amount");
                if (depositAmountStr != null && !depositAmountStr.isEmpty()) {
                    try {
                        depositAmount = Integer.parseInt(depositAmountStr);
                        if (depositAmount <= 0) {
                            isValidAmount = false;
                        }
                    } catch (NumberFormatException e) {
                        isValidAmount = false;
                    }
                } else {
                    isValidAmount = false;
                }

                // 유효한 금액일 경우 입금 처리
                if (isValidAmount) {
                    int newBalance = Integer.parseInt(balance) + depositAmount;
                    session.setAttribute("balance", String.valueOf(newBalance));

                    // 거래내역 저장
                    String transactions = (String) session.getAttribute("transactions");
                    if (transactions == null) {
                        transactions = "";
                    }
                    transactions += "입금: " + depositAmount + "원 - 잔액: " + newBalance + "원;";
                    session.setAttribute("transactions", transactions);

                    out.println("<p>입금이 완료되었습니다.</p>");
                } else {
        %>
            <!-- 유효하지 않은 입금 액수를 입력받는 폼 -->
            <form action="deposit.jsp" method="post">
                <label for="amount">입금액:</label>
                <input type="text" id="amount" name="amount">
                <input type="submit" value="입금">
            </form>
            <p>올바른 금액을 입력해주세요.</p>
        <%
                }
            }
        %>

        <div class="links">
            <a href="viewAccount.jsp">계좌 조회하기</a>
            <a href="main.jsp">메인 페이지로 돌아가기</a>
        </div>
    </div>
</body>