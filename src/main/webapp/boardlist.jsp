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

    // 게시글 삭제 처리
    String deleteIndex = request.getParameter("deleteIndex");
    if (deleteIndex != null) {
        // 삭제 인덱스 확인
        int index = -1;
        try {
            index = Integer.parseInt(deleteIndex);
            if (index >= 0 && index < posts.size()) {
                posts.remove(index);
                session.setAttribute("posts", posts);
                response.sendRedirect("boardlist.jsp"); // 수정: 삭제 후 boardlist.jsp로 이동
                return;
            }
        } catch (NumberFormatException e) {
            // 삭제 인덱스가 유효하지 않음
            e.printStackTrace(); // 에러 로그 출력
        }
    }

    // 게시글 수정 처리
    String editIndex = request.getParameter("editIndex");
    if (editIndex != null) {
        // 수정 인덱스 확인
        int index = -1;
        try {
            index = Integer.parseInt(editIndex);
            if (index >= 0 && index < posts.size()) {
                String newTitle = request.getParameter("newTitle");
                String newAuthor = request.getParameter("newAuthor");
                String newContent = request.getParameter("newContent");
                if (newTitle != null && newAuthor != null && newContent != null &&
                        !newTitle.trim().isEmpty() && !newAuthor.trim().isEmpty() && !newContent.trim().isEmpty()) {
                    String[] post = posts.get(index);
                    post[0] = newTitle;
                    post[1] = newAuthor;
                    post[2] = newContent;
                    post[3] = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
                    posts.set(index, post);
                    session.setAttribute("posts", posts);
                    response.sendRedirect("boardlist.jsp"); // 수정 후 페이지 다시 로드
                    return;
                }
            }
        } catch (NumberFormatException e) {
            // 수정 인덱스가 유효하지 않음
            e.printStackTrace(); // 에러 로그 출력
        }
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
        session.setAttribute("posts", posts);
        response.sendRedirect("boardlist.jsp");
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
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
        }
        .edit-form, .delete-form {
            display: inline-block;
            margin-top: 10px;
        }
        .edit-form input[type="text"], .edit-form textarea, .delete-form input[type="submit"] {
            display: block;
            margin: 5px 0;
        }
        .edit-form input[type="submit"], .delete-form input[type="submit"] {
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        .transition: background-color 0.3s;
        }
        .edit-form input[type="submit"]:hover, .delete-form input[type="submit"]:hover {
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
    <script>
        // 삭제 버튼 클릭 시, 폼의 제출을 막고, 삭제 폼 제출
        function deletePost(index) {
            if (confirm('정말로 삭제하시겠습니까?')) {
                document.getElementById('delete-form-' + index).submit();
            }
            return false; // 폼 제출 막기
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>게시판</h1>
    
        <%-- 게시글 목록 --%>
        <% if (posts != null && !posts.isEmpty()) { %>
            <ul>
                <% for (int i = 0; i < posts.size(); i++) { %>
                    <li>
                        <h2><%= posts.get(i)[0] %></h2>
                        <p>작성자: <%= posts.get(i)[1] %></p>
                        <p>작성일시: <%= posts.get(i)[3] %></p>
                        <p><%= posts.get(i)[2] %></p>
                        <%-- 수정 폼 추가 --%>
                        <form id="edit-form-<%= i %>" class="edit-form" action="boardlist.jsp" method="post">
                            <input type="hidden" name="editIndex" value="<%= i %>">
                            <input type="text" name="newTitle" placeholder="새 제목" required>
                            <input type="text" name="newAuthor" placeholder="새 작성자" required>
                            <textarea name="newContent" placeholder="새 내용" required></textarea>
                            <input type="submit" value="수정">
                        </form>
                        <%-- 삭제 폼 추가 --%>
                        <form id="delete-form-<%= i %>" class="delete-form" action="boardlist.jsp" method="post" onsubmit="return deletePost(<%= i %>);">
                            <input type="hidden" name="deleteIndex" value="<%= i %>">
                            <input type="submit" value="삭제">
                        </form>
                    </li>
                <% } %>
            </ul>
        <% } else { %>
            <p>게시글이 없습니다.</p>
        <% } %>

        <%-- 목록으로 돌아가는 링크 --%>
        <div class="back-link">
            <a href="main.jsp">메인 페이지로 돌아가기</a>
        </div>
    </div>
</body>
</html>
            