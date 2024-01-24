<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Vaccine Friend</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
    <main class="col-lg-10 col-md-7 ms-md-auto px-4">
        <center>
            <form action="find_pw_result.jsp" method="post">
                <br><br>
                <h2>비밀번호 찾기</h2>
                <br>
                <div class="mb-3">
                    <label for="username" class="form-label">아이디</label>
                    <input type="text" class="form-control" id="user_id" name="user_id" style="width:300px" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">이메일</label>
                    <input type="email" class="form-control" id="user_email" name="user_email" style="width:300px" required>
                </div>
                <br><button type="submit" class="btn btn-primary">비밀번호 찾기</button>
            </form>
        </center>
    </main>
</body>
</html>
