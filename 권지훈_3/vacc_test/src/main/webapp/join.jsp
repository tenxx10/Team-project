<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>백신친구</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>       
    
    <style>
        .phone-input {
            width: 50px; /*연락처 입력란의 너비*/
        }
    </style>
    
    <style>
        .email-input {
            width: 90px; /*이메일 입력란의 너비*/
        }
    </style>
    
    <style>
    .navbar {
        padding-top: 0;
        padding-bottom: 0;
    }
	</style>
    
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">접종 친구</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="board.jsp">Board</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="info.jsp">Info</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="mypage.jsp">Mypage</a>
            </li>
                        <%-- 세션에 user_id가 없으면 링크를 보여줌 --%>
    				<li class="nav-item">
    				<% if (session.getAttribute("user_id") == null) { %>
                    <a class="nav-link" href="login.jsp">Login</a>
    				<% } %></li>
    				
                    <li class="nav-item">
				    <% if (session.getAttribute("user_id") == null) { %>
				        <a class="nav-link" href="join.jsp">Join</a>
				    <% } %></li>
				    
				    <!-- 로그인 상태일 때 -->
							<jsp:include page="logout_modal.jsp" />
                    <% if (session.getAttribute("user_name") != null) { %>
                        <li class="nav-item"><p class="nav-link" data-bs-toggle="modal" data-bs-target="#logoutModal"> [로그아웃]</p></li>
                    <% } %>
          </ul>
        </div>
      </div>
    </nav>
    
    <!-- Page content -->
    <div class="container-fluid">
      <div class="row">
        <!-- Sidebar with categories -->
        <nav
          id="sidebar"
          class="col-lg-2 col-md-5 d-md-block bg-light sticky-top"
        >
          <div class="p-4">
            <h2 class="h4 mb-4"><br /><br />카테고리</h2>
            <div class="list-group">
              <a
                href="mypage.jsp"
                class="list-group-item list-group-item-action"
              >
                <i class="bi bi-person"></i> 마이페이지
              </a>
              <a
                href="vacccine.jsp"
                class="list-group-item list-group-item-action"
              >
                <i class="bi bi-file-earmark-text"></i> 예방접종정보
              </a>
              <a
                href="calendar.jsp"
                class="list-group-item list-group-item-action"
              >
                <i class="bi bi-calendar"></i> 캘린더
              </a>
              <a
                href="board.jsp"
                class="list-group-item list-group-item-action"
              >
                <i class="bi bi-chat-left"></i> 자유게시판
              </a>
              <a
                href="info.jsp"
                class="list-group-item list-group-item-action"
              >
                <i class="bi bi-info-circle"></i> 인포메이션
              </a>
            </div>
          </div>
        </nav>
    

    <main class="col-lg-10 col-md-7 ms-md-auto px-4">
        <div class="text-center my-5">
            <h1 class="fw-bolder"></h1>
            <h2>회원가입</h2>
            <h3>정보를 입력해주세요</h3>
            <hr>
            <center>
                <p class="lead mb-0">
                    <form action="register.jsp" method="post">
                        <table>
                            <tr>
                                <td>아이디 : </td>
                                <td><input type="text" name="user_id" id="user_id" placeholder="4~16자리 입력"></td>    
                                <td><button type="button" onclick="openDuplicateCheck()">중복 확인</button></td>     
                            </tr>
                            
                            <tr>
                                <td>비밀번호 : </td>
                                <td><input type="password" name="user_pw"></td>
                            </tr>
                            <tr>
                                <td>이름 : </td>
                                <td><input type="text" name="user_name"></td>
                            </tr>
                            <tr>
    							<td>성별 : </td>
    							<td>
        						<label><input type="radio" name="user_gen" value="male"> 남</label>
        						<label><input type="radio" name="user_gen" value="female"> 여</label>
							</tr>
                            <tr>
                                <td>연락처 : </td>
                                <td>
                                    <input type="text" name="user_phone1" id="user_phone1" maxlength="3" oninput="moveToNextInput(this, 'user_phone2')" placeholder="000" class="phone-input" required>
                                -
                                    <input type="text" name="user_phone2" id="user_phone2" maxlength="4" oninput="moveToNextInput(this, 'user_phone3')" placeholder="0000" class="phone-input" required>
                                -
                                    <input type="text" name="user_phone3" id="user_phone3" maxlength="4" placeholder="0000" class="phone-input" required>
                                </td>
                            </tr>
                            <tr>
                                <td>이메일 : </td>
                                <td><input type="text" name="user_email"class="email-input">
                              	@
        						<select name="user_email_domain" id="user_email_domain" required>
            						<option value="gmail.com">gmail.com</option>
            						<option value="naver.com">naver.com</option>
            						<option value="hanmail.net">hanmail.net</option>
        						</select>
        						</td>                                
                            </tr>
                            <tr>
                                <td>가입일 : </td>
                                <td><input type="date" name="user_date" id="user_date" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" readonly required></td>
                            </tr>
                        </table>
                        <br>
                        <button type="submit" class="btn btn-primary" onclick="combinePhoneNumber()">회원가입</button>
                        <button type="reset" class="btn btn-success">다시입력</button>  
                    </form>                  
        				
                </p>
            </center>
        </div>
    </main>     

    
<script>
//아이디 중복체크
    function openDuplicateCheck() {			
        var userId = document.getElementById("user_id").value;
        
     // user_id의 조건
        var idRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,16}$/;

        if (!idRegex.test(userId)) {
            alert("ID는 최소 4자리 이상 16자리 이하이어야 합니다.(영문자+숫자)");
            return;
        }

        // 새로운 창 열기
        var popupWidth = 400;
        var popupHeight = 200;
        var left = (screen.width - popupWidth) / 2;
        var top = (screen.height - popupHeight) / 2;

        var popup = window.open("about:blank", "DuplicateCheck", "width=" + popupWidth + ",height=" + popupHeight + ",left=" + left + ",top=" + top);

        // 중복 확인 페이지에 데이터 전송
        $.ajax({
            type: "POST",
            url: "checkUserId.jsp",
            data: { userId: userId },
            success: function (response) {
                // 결과를 새로운 창에 출력
                popup.document.write("<p>" + response + "</p>");
                
             // 확인 버튼 추가
                var confirmButton = popup.document.createElement("button");
                confirmButton.innerHTML = "확인";
                
                confirmButton.onclick = function () {
                    // 확인 버튼을 눌렀을 때 실행할 동작 추가              
                	popup.close();
                };	

                popup.document.body.appendChild(confirmButton);
            },
            error: function () {
                // 오류 처리
                popup.document.write("<p>서버와의 통신 중 오류가 발생했습니다.</p>");
            }
        });
    }
</script>

<script>  
//연락처 입력란 자동으로 넘기기
        function moveToNextInput(currentInput, nextInputId) {
            var maxLength = parseInt(currentInput.getAttribute('maxlength'));
            var currentLength = currentInput.value.length;

            if (currentLength === maxLength) {
                document.getElementById(nextInputId).focus();
            }
        }
</script>
    

 
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>   
   
</body>
</html>



