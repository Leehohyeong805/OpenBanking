<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>계좌 개설</title>
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
        }
        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 30px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }
        input[type="text"],
        input[type="number"],
        input[type="password"] {
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
            text-align: center;
        }
        .home-link,
        .mypage-link {
            text-align: center;
            margin-top: 20px;
        }
        .home-link a,
        .mypage-link a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        .home-link a:hover,
        .mypage-link a:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>계좌 개설</h1>
        <form action="createAccount.jsp" method="post">
            <label for="accountHolder">예금주:</label>
            <input type="text" id="accountHolder" name="accountHolder" required><br>
            <label for="balance">잔액:</label>
            <input type="number" id="balance" name="balance" required><br>
            <label for="accountName">계좌 별칭:</label>
            <input type="text" id="accountName" name="accountName" required><br>
            <label for="password">계좌 비밀번호:</label>
            <input type="password" id="password" name="password" minlength="4" maxlength="4" required><br>
            <label for="confirmPassword">계좌 비밀번호 확인:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" minlength="4" maxlength="4" required><br>
            <input type="submit" value="계좌 개설">
        </form>

        <%
            if (request.getMethod().equalsIgnoreCase("POST")) { // POST 메서드 요청 확인
                request.setCharacterEncoding("UTF-8");  // 인코딩 설정
                String accountHolder = request.getParameter("accountHolder"); // 예금주 입력 값 가져오기
                String balance = request.getParameter("balance"); // 잔액 입력 값 가져오기
                String accountName = request.getParameter("accountName"); // 계좌 별칭 입력 값 가져오기
                String password = request.getParameter("password"); // 비밀번호 입력 값 가져오기
                String confirmPassword = request.getParameter("confirmPassword"); // 비밀번호 확인 입력 값 가져오기

                // 비밀번호 일치 여부 확인
                if (!password.equals(confirmPassword)) { // 비밀번호와 비밀번호 확인 값이 다를 경우
                    out.println("<p>비밀번호가 일치하지 않습니다.</p>"); // 오류 메시지 출력
                } else { // 비밀번호가 일치할 경우
                    // 11자리 랜덤 계좌번호 생성
                    java.util.Random rand = new java.util.Random();
                    String accountNumber = String.format("%011d", rand.nextLong() & Long.MAX_VALUE % 100000000000L); // 계좌번호 생성

                    // 생성된 계좌 정보를 세션에 저장
                    session.setAttribute("accountNumber", accountNumber); // 계좌번호 저장
                    session.setAttribute("accountHolder", accountHolder); // 예금주 저장
                    session.setAttribute("balance", balance); // 잔액 저장
                    session.setAttribute("accountName", accountName); // 계좌 별칭 저장
                    session.setAttribute("password", password); // 비밀번호 저장

                    out.println("<p>계좌가 성공적으로 개설되었습니다!</p>"); // 성공 메시지 출력
                    out.println("<p>계좌번호: " + accountNumber + "</p>"); // 생성된 계좌번호 출력
                    out.println("<div class='home-link'><a href='main.jsp'>홈으로 이동</a></div>"); // 홈으로 이동 링크
                    out.println("<div class='mypage-link'><a href='mypage.jsp'>마이페이지로 이동</a></div>"); // 마이페이지로 이동 링크
                }
            }
        %>
    </div>
</body>
</html>
