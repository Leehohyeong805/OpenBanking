<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>송금</title>
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
        input[type="text"], input[type="number"] {
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
        <h1>송금</h1>

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
                // 유효한 송금 트랜잭션인지 확인
                boolean isValidTransaction = true;
                int transferAmount = 0;
                String targetAccountNumber = request.getParameter("targetAccountNumber");

                String transferAmountStr = request.getParameter("amount");
                if (transferAmountStr != null && !transferAmountStr.isEmpty()) {
                    try {
                        transferAmount = Integer.parseInt(transferAmountStr);
                        // 송금액이 유효한지, 잔액보다 작거나 같은지 확인
                        if (transferAmount <= 0 || transferAmount > Integer.parseInt(balance)) {
                            isValidTransaction = false;
                        }
                        // 대상 계좌 번호가 입력되었는지 확인
                        if (targetAccountNumber == null || targetAccountNumber.isEmpty()) {
                            isValidTransaction = false;
                        }
                    } catch (NumberFormatException e) {
                        isValidTransaction = false;
                    }
                } else {
                    isValidTransaction = false;
                }

                // 유효한 트랜잭션일 경우 송금 처리
                if (isValidTransaction) {
                    int newBalance = Integer.parseInt(balance) - transferAmount;
                    session.setAttribute("balance", String.valueOf(newBalance));

                    // 거래내역 저장
                    String transactions = (String) session.getAttribute("transactions");
                    if (transactions == null) {
                        transactions = "";
                    }
                    transactions += "송금: " + transferAmount + "원 - 잔액: " + newBalance + "원;";
                    session.setAttribute("transactions", transactions);

                    out.println("<p>송금이 완료되었습니다.</p>");
                } else {
        %>
            <!-- 유효하지 않은 정보를 입력받는 폼 -->
            <form action="transfer.jsp" method="post">
                <label for="targetAccountNumber">송금할 계좌 번호:</label>
                <input type="text" id="targetAccountNumber" name="targetAccountNumber">

                <label for="amount">송금액:</label>
                <input type="number" id="amount" name="amount">
                <input type="submit" value="송금">
            </form>
            <p>올바른 정보를 입력해주세요.</p>
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
</html>
