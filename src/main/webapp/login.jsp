<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 300px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #007bff;
        }

        form {
            margin-bottom: 20px;
        }

        input[type="text"], input[type="password"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        p.error-message {
            text-align: center;
            color: red;
        }

        .signup-link {
            text-align: center;
        }

        .signup-link a {
            text-decoration: none;
            color: #007bff;
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .signup-link a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>로그인</h2>
        <form action="loginProcess.jsp" method="post">
            아이디: <input type="text" name="username"><br>
            비밀번호: <input type="password" name="password"><br>
            <input type="submit" value="로그인">
        </form>

        <%-- 로그인 실패 시 오류 메시지 표시 --%>
        <% String error = request.getParameter("error");
        if ("true".equals(error)) { %>
            <p class="error-message">아이디 또는 비밀번호가 잘못되었습니다.</p>
        <% } %>

        <div class="signup-link">
            <a href="signup.jsp">회원가입</a>
        </div>
    </div>
</body>
</html>
