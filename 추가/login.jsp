<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Vaccine Friend</title>
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
        
        <!-- 여기부터 작성하면 됩니다.-->    
                
                    <form action="login_Process.jsp" method="post">
                    	<div class="container">
                        <br><br>
                        <h2>로그인</h2>
                        <br>
                        <div class="mb-3">
                            <label for="username" class="form-label">아이디</label>
                            <input type="text" class="form-control" id="user_id" name="user_id" style="width:300px" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">비밀번호</label>
                            <input type="password" class="form-control" id="user_pw" name="user_pw" style="width:300px" required>
                        </div>
                        <button type="submit" class="btn btn-primary">로그인</button>
                        
                        <!-- 여기 form 위치가 잘못됐다고 뜨는데
                        아마 form 태그 안에 또 form 태그를 넣어서 그럴거예요
                        나중에 수정 필요해야하는 부분입니다! -->
                        
                       
                        <form action="find_pw.jsp" method="post">
                        <a href="find_pw.jsp" class="btn btn-success" onclick="find_pw()">비밀번호 찾기
                        </a></form><br>
                	</div>
                </form>                
            </main>
            </div>
        </div>

<!-- Include footer.jsp -->
    <%@ include file="/include/footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
