<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>로그인</title>
    <link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
    <link href="../css/styles.css" rel="stylesheet" />
</head>

<body>
    <!-- Include header.jsp -->
    <%@ include file="/include/header.jsp" %>
    
    <!-- Page content -->
    <div class="container-fluid">
        <div class="row">
            <!-- Include cate.jsp -->
            <%@ include file="/include/cate.jsp" %>
            
            <!-- Main content -->
            <main class="col-lg-10 col-md-7 ms-md-auto px-4">
                <div class="container">
                    <br><br>
                    <h2>로그인</h2>
                    <br>
                    <form action="login_Process.jsp" method="post">
    <div class="mb-3">
        <label for="username" class="form-label">아이디</label>
        <input type="text" class="form-control" id="user_id" name="user_id" style="width:300px" required>
    </div>
    <div class="mb-3">
        <label for="password" class="form-label">비밀번호</label>
        <input type="password" class="form-control" id="user_pw" name="user_pw" style="width:300px" required>
    </div>
    
    <!-- returnUrl을 hidden input으로 추가 -->
    <input type="hidden" name="returnUrl" value="<%= request.getParameter("returnUrl") %>">
    
    <button type="submit" class="btn btn-primary">로그인</button>
</form>
<br>
                    <!-- 비밀번호 찾기 폼 -->
                    <form action="find_pw.jsp" method="post">
                        <a href="find_pw.jsp" class="btn btn-success" onclick="find_pw()">비밀번호 찾기</a>
                    </form>
                    <br>
                </div>
            </main>
        </div>
    </div>

    <!-- Include footer.jsp -->
    <%@ include file="/include/footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
