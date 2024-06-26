<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    // 게시글 리스트를 세션에서 가져오기
    List<String[]> posts = (List<String[]>) session.getAttribute("posts");
    if (posts == null) {
        posts = new ArrayList<>();
        session.setAttribute("posts", posts);
    }

    // 게시글 작성 처리
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String content = request.getParameter("content");

    if (title != null && author != null && content != null &&
        !title.trim().isEmpty() && !author.trim().isEmpty() && !content.trim().isEmpty()) {
        
        String[] post = new String[4];
        post[0] = title;
        post[1] = author;
        post[2] = content;
        post[3] = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
        posts.add(post);

        // 작성 후 새로고침 방지
        response.sendRedirect("board.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
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
        .form-container {
            margin-top: 30px;
            border-top: 1px solid #ccc;
            padding-top: 20px;
        }
        .form-container h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .form-container textarea, .form-container input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .form-container input[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .form-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .back-link {
            display: block;
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
        <h1>게시판</h1>

        <%-- 게시글 작성 폼 --%>
        <div class="form-container">
            <h2>게시글 작성</h2>
            <form action="board.jsp" method="post">
                <input type="text" name="title" placeholder="게시글 제목을 입력하세요" required><br>
                <input type="text" name="author" placeholder="작성자명을 입력하세요" required><br>
                <textarea name="content" placeholder="게시글 내용을 입력하세요" required></textarea><br>
                <input type="submit" value="작성">
            </form>
        </div>
        
        <%-- 목록으로 돌아가는 링크 --%>
        <div class="back-link">
            <a href="main.jsp">메인 페이지로 돌아가기</a>
        </div>
    </div>
</body>
</html>
