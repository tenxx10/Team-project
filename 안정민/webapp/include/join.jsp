<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>회원가입</title>
<link rel="icon" type="image/x-icon" href="../assets/favicon1.png" />

<link rel="stylesheet" type="text/css" href="../css/style.css">
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

</head>
<body>

	<!-- Include header.jsp -->
	<%@ include file="/include/header.jsp"%>

	<!-- Page content -->
	<div class="container-fluid">
		<div class="row">

			<!-- Include cate.jsp -->
			<%@ include file="/include/cate.jsp"%>

			<main class="col-lg-10 col-md-7 ms-md-auto px-4">


				<div class="container my-5">
					<h1 class="fw-bolder"></h1>
					<h2 class="text-center">회원가입</h2>
					<h3 class="text-center">정보를 입력해주세요</h3>
					<hr>
					<div class="text-center">
						<form action="register.jsp" method="post">
							<table class="mx-auto">
								<tr>
									<td>아이디 :</td>
									<td><input type="text" name="user_id" id="user_id"
										placeholder="4~16자리 입력">
										<button type="button" onclick="openDuplicateCheck()">중복
											확인</button></td>
								</tr>
								<tr>
									<td>비밀번호 :</td>
									<td><input type="password" name="user_pw"></td>
								</tr>
								<tr>
									<td>이름 :</td>
									<td><input type="text" name="user_name"></td>
								</tr>
								<tr>
									<td>성별 :</td>
									<td><label><input type="radio" name="user_gen"
											value="male"> 남</label> <label><input type="radio"
											name="user_gen" value="female"> 여</label></td>
								</tr>
								<tr>
									<td>연락처 :</td>
									<td><input type="text" name="user_phone1" id="user_phone1"
										maxlength="3" oninput="moveToNextInput(this, 'user_phone2')"
										placeholder="000" class="phone-input" required> - <input
										type="text" name="user_phone2" id="user_phone2" maxlength="4"
										oninput="moveToNextInput(this, 'user_phone3')"
										placeholder="0000" class="phone-input" required> - <input
										type="text" name="user_phone3" id="user_phone3" maxlength="4"
										placeholder="0000" class="phone-input" required></td>
								</tr>
								<tr>
									<td>이메일 :</td>
									<td><input type="text" name="user_email"
										class="email-input"> @ <select
										name="user_email_domain" id="user_email_domain" required>
											<option value="gmail.com">gmail.com</option>
											<option value="naver.com">naver.com</option>
											<option value="hanmail.net">hanmail.net</option>
									</select></td>
								</tr>
								<tr>
									<td>가입일 :</td>
									<td><input type="date" name="user_date" id="user_date"
										value="<%=new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date())%>"
										readonly required></td>
								</tr>
							</table>
							<br>
							<button type="submit" class="btn btn-primary"
								onclick="combinePhoneNumber()">회원가입</button>
							<button type="reset" class="btn btn-success">다시입력</button>
						</form>

					</div>
				</div>



			</main>
		</div>
	</div>


	<!-- Include footer.jsp -->
	<%@ include file="/include/footer.jsp"%>


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

			var popup = window.open("about:blank", "DuplicateCheck", "width="
					+ popupWidth + ",height=" + popupHeight + ",left=" + left
					+ ",top=" + top);

			// 중복 확인 페이지에 데이터 전송
			$.ajax({
				type : "POST",
				url : "checkUserId.jsp",
				data : {
					userId : userId
				},
				success : function(response) {
					// 결과를 새로운 창에 출력
					popup.document.write("<p>" + response + "</p>");

					// 확인 버튼 추가
					var confirmButton = popup.document.createElement("button");
					confirmButton.innerHTML = "확인";

					confirmButton.onclick = function() {
						// 확인 버튼을 눌렀을 때 실행할 동작 추가              
						popup.close();
					};

					popup.document.body.appendChild(confirmButton);
				},
				error : function() {
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>
