<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>계좌 해지</title>
    <style>
        /* 스타일 시트 */
    </style>
</head>
<body>
    <h1>계좌 해지</h1>

    <%
        // 해지할 계좌번호 받아오기
        String accountNumber = request.getParameter("accountNumber");

        // 세션에서 계좌 정보 가져오기
        String savedAccountNumber = (String) session.getAttribute("accountNumber");

        if (accountNumber != null && accountNumber.equals(savedAccountNumber)) {
            // 세션에서 계좌 정보 삭제
            session.removeAttribute("accountNumber");
            session.removeAttribute("accountHolder");
            session.removeAttribute("balance");
            out.println("<p>계좌가 성공적으로 해지되었습니다.</p>");
        } else {
            out.println("<p>잘못된 요청입니다. 계좌를 찾을 수 없거나 잘못된 계좌번호입니다.</p>");
        }
    %>

    <!-- 계좌 조회 페이지로 이동하는 링크 -->
    <div>
        <a href="viewAccount.jsp">계좌 조회하기</a>
    </div>

    <!-- 홈으로 돌아가기 링크 -->
    <div>
        <a href="main.jsp">홈으로 돌아가기</a>
    </div>
</body>
</html>
