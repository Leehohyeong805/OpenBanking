<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>은행 Q&A</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 30px;
        }
        .question {
            cursor: pointer;
            margin-bottom: 10px;
            font-weight: bold;
            color: #007bff;
            padding: 10px;
            background-color: #f1f1f1;
            border-radius: 5px;
        }
        .question:hover {
            background-color: #e9ecef;
        }
        .answer {
            display: none;
            margin-bottom: 20px;
            padding: 10px;
            border-left: 4px solid #007bff;
            background-color: #f9f9f9;
            border-radius: 5px;
        }
        .links {
            text-align: center;
            margin-top: 30px;
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
    <script>
        function toggleAnswer(id) {
            var answer = document.getElementById(id);
            if (answer.style.display === "none") {
                answer.style.display = "block";
            } else {
                answer.style.display = "none";
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>은행 Q&A</h1>

        <div class="question" onclick="toggleAnswer('q7')">Q: 계좌를 개설하려면 어떤 절차를 거쳐야 하나요?</div>
        <div class="answer" id="q7">A: 계좌를 개설하려면 해당 은행 또는 금융 기관에 방문하여 개설 신청서와 신분증을 제출하면 됩니다. 신분증으로는 주민등록증 또는 운전면허증 등이 흔히 사용됩니다. 또한 개설할 계좌의 종류에 따라 추가적인 서류가 필요할 수 있습니다.</div>

        <div class="question" onclick="toggleAnswer('q8')">Q: 어떻게 계좌를 조회할 수 있나요?</div>
        <div class="answer" id="q8">A: 계좌를 조회하려면 해당 은행 또는 금융 기관의 온라인 뱅킹 시스템을 통해 조회할 수 있습니다. 또는 은행 지점에 방문하여 은행원에게 직접 조회를 요청할 수도 있습니다.</div>

        <div class="question" onclick="toggleAnswer('q9')">Q: 입금을 하려면 어떻게 해야 하나요?</div>
        <div class="answer" id="q9">A: 입금을 하려면 해당 은행 또는 금융 기관의 계좌번호와 입금할 금액을 알고 있어야 합니다. 그런 다음 은행 지점 또는 ATM을 통해 현금을 입금하거나 온라인 뱅킹을 통해 이체할 수 있습니다.</div>

        <div class="question" onclick="toggleAnswer('q10')">Q: 출금은 어떻게 할 수 있나요?</div>
        <div class="answer" id="q10">A: 출금을 하려면 해당 은행 또는 금융 기관의 지점 또는 ATM을 방문하여 출금 신청을 하면 됩니다. 출금할 금액과 본인 확인을 위한 신분증을 지참해야 합니다.</div>

        <div class="question" onclick="toggleAnswer('q11')">Q: Q&A를 통해 은행 서비스와 관련된 질문을 할 수 있나요?</div>
        <div class="answer" id="q11">A: 네, Q&A를 통해 은행 서비스와 관련된 다양한 질문을 할 수 있습니다. 우리는 최대한 빠르고 정확한 답변을 드리도록 노력하겠습니다.</div>

        <div class="question" onclick="toggleAnswer('q12')">Q: 게시판에서는 어떤 정보를 얻을 수 있나요?</div>
        <div class="answer" id="q12">A: 게시판을 통해 다른 사용자들과 은행 서비스에 관한 다양한 정보를 공유할 수 있습니다. 또한 공지사항이나 이벤트 정보 등을 확인할 수도 있습니다.</div>

        <div class="question" onclick="toggleAnswer('q13')">Q: 마이페이지에서 어떤 기능을 사용할 수 있나요?</div>
        <div class="answer" id="q13">A: 마이페이지에서는 개인 정보 수정, 계좌 관리, 거래 내역 조회 등의 다양한 기능을 사용할 수 있습니다. 사용자 개인에 맞는 서비스를 제공하기 위해 노력하고 있습니다.</div>

        <div class="links">
            <a href="main.jsp">메인 페이지로 돌아가기</a>
        </div>
    </div>
</body>
</html>
