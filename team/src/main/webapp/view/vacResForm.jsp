<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ page
	import="java.net.URL, java.net.URLEncoder, java.io.BufferedReader, java.io.InputStreamReader, java.io.StringReader, javax.xml.parsers.DocumentBuilderFactory, javax.xml.parsers.DocumentBuilder, org.w3c.dom.Document, org.w3c.dom.NodeList, org.xml.sax.InputSource"%>
<%@ page import="org.w3c.dom.Node, org.w3c.dom.Element"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>예약신청페이지</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon1.png" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" type="text/css" href="../css/style.css">

<!-- jsp. 490p 참조 -->
<style>
table {
	width: 400px;
	border: 0px solid gray;
}

.card {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.td_title {
	font-size: 24px;
	font-weight: bold;
	text-align: center;
}

.form-group {
	margin-bottom: 20px;
}

button[type="submit"] {
	width: 100%;
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
			<!-- Main content -->
			<main class="col-lg-10 col-md-7 ms-md-auto px-4">
				<br>
				<br>
				<div class="container">
					<h2 style="font-family: 'Black Han Sans', sans-serif;">예약페이지</h2>
				</div>


				<!-- 여기부터 작성하면 됩니다.-->

				<%
// 이전 페이지 URL을 가져오기
String returnUrl = request.getParameter("returnUrl");
// 세션 겟
HttpSession userSession = request.getSession(true);

if (userSession != null && userSession.getAttribute("user_id") != null) {
    // 로그인 o

    String userId = (String) userSession.getAttribute("user_id");
    String userName = (String) userSession.getAttribute("user_name");
    String userGen = (String) userSession.getAttribute("user_gen");
    String userEmail = (String) userSession.getAttribute("user_email");
    String userPhone = (String) userSession.getAttribute("user_phone");
    String userDate = (String) userSession.getAttribute("user_date");
    // 사용자 성별 정보 가져오기
    

    // 세션에서 가져온 값을 콘솔에 출력
     System.out.println("userID: " + userId);
    System.out.println("userGen: " + userGen);
%>



				<div class="container">


					<form name="resForm" action="vacResProcess.jsp" method="post">
						<table class="mx-auto">
							<tr>
								<td colspan="2" class="td_title"><br>접종 예약 신청<br>
									<br></td>
							</tr>

							<tr>
								<td><label for="user_id">아이디 :</label></td>
								<td><input type="text" class="form-control" name="user_id"
									id="user_id" value="<%=session.getAttribute("user_id")%>"
									readonly></td>
							</tr>

							<tr>
								<td><label for="user_name">회원 이름 :</label></td>
								<td><input type="text" class="form-control"
									name="user_name" id="user_name"
									value="<%=session.getAttribute("user_name")%>" readonly></td>
							</tr>



							<tr>
								<td><label for="reserve_gen">예약자 성별 :</label></td>
								<td><input type="radio" name="reserve_gen" id="male"
									value="male" <%= ("male".equals(userGen)) ? "checked" : "" %>
									onchange="hideGenderError()">남 <input type="radio"
									name="reserve_gen" id="female" value="female"
									<%= ("female".equals(userGen)) ? "checked" : "" %>
									onchange="hideGenderError()">여 <span id="genderError"
									style="color: red;">예약자 성별을 선택해 주세요.</span></td>
							</tr>


							<tr>
								<td><label for="reserve_age">예약자 나이 :</label></td>
								<td><input type="number" class="form-control"
									name="reserve_age" id="reserve_age_input" value="00"
									placeholder="숫자만 입력 예시) 30" oninput="validateAge()"> <span
									id="ageError" style="color: red;"></span></td>
							</tr>

							<tr>
								<td><label for="reserve_phone">회원 연락처 :</label></td>
								<td><input type="text" class="form-control"
									name="reserve_phone" id="reserve_phone"
									value="<%=session.getAttribute("user_phone")%>"
									placeholder="연락처를 입력해주세요"></td>
							</tr>

							<tr>
								<td><label for="reserve_email">회원 이메일 :</label></td>
								<td><input type="text" class="form-control"
									name="reserve_email" id="reserve_email"
									value="<%=session.getAttribute("user_email")%>"
									placeholder="이메일을 입력해주세요"></td>
							</tr>

							<tr>
								<td><label for="reserve_disease">접종대상 질병 :</label></td>
								<td><select class="form-control" name="reserve_disease"
									id="reserve_disease" onchange="checkCustomInput()"
									placeholder="질병을 선택해주세요">
										<option value="" selected disabled>질병을 선택해주세요▼</option>
										<option value="결핵">결핵</option>
										<option value="B형간염">B형간염</option>
										<option value="디프테리아균">디프테리아균</option>
										<option value="폴리오">폴리오</option>
										<option value="b형헤모필루스인플루엔자균">b형헤모필루스인플루엔자균</option>
										<option value="폐렴구균">폐렴구균</option>
										<option value="홍역">홍역</option>
										<option value="수두">수두</option>
										<option value="일본뇌염">일본뇌염</option>
										<option value="인플루엔자">인플루엔자</option>
										<option value="장티푸스">장티푸스</option>
										<option value="신증후군출혈열">신증후군출혈열</option>
										<option value="A형간염">A형간염</option>
										<option value="로타바이러스 감염증">로타바이러스 감염증</option>
										<option value="사람유두종바이러스">사람유두종바이러스</option>
										<option value="수막구균">수막구균</option>
										<option value="대상포진">대상포진</option>
										<option value="파상풍균">파상풍균</option>
										<option value="백일해">백일해</option>
										<option value="유행성이하선염">유행성이하선염</option>
										<option value="풍진">풍진</option>

								</select> <span id="diseaseError" style="color: red;">대상 질병을 선택해
										주세요.</span></td>
							</tr>



							<tr>
								<td><label for="reserve_item">희망주사 품명 :</label></td>
								<td><input type="text" class="form-control"
									name="reserve_item" id="reserve_item"
									placeholder="원하시는 제품이 없을 경우 공란 "></td>

							</tr>

							<tr>
								<td><label for="reserve_date">접종희망일 :</label></td>
								<td><input type="date" class="form-control"
									name="reserve_date" id="reserve_date" required
									oninput="validateDate()"> <span id="dateError"
									style="color: red;"></span></td>
							</tr>

							<tr>
								<td><label for="reserve_local">접종희망병원 :</label></td>
								<td><input type="text" class="form-control"
									name="reserve_local" id="reserve_local"
									placeholder="원하는 병원없을 경우 공란"></td>
							</tr>

							<tr>
								<td class="text-center" colspan="3"><br>
									<button type="submit" class="btn btn-primary">접종예약</button>&nbsp;&nbsp;<br>
									<input type="reset" class="btn btn-secondary" value="다시작성"><br>
								<br>
								<br>
								<br></td>

							</tr>
						</table>
					</form>




					<%
					} else {
					// 로그인 x
					%>

					<div class="container">
						<img src="../assets/NeedLogin.png" alt="로그인이 필요한 페이지입니다."> <br>

						<button type="button" class="btn btn-warning"
							onclick="redirectToLoginPage()">로그인 하러가기</button>
						<br>
						<br>
						<br>
					</div>

					<%
					}
					%>

				</div>
			</main>
		</div>

	</div>
	<!-- Include footer.jsp -->
	<%@ include file="/include/footer.jsp"%>

	<!--  여기까지 -->


	<!-- 예약자 성별 선택 부분 아래에 스크립트 추가 -->
	<script>
function hideGenderError() {
    var maleRadio = document.getElementById("male");
    var femaleRadio = document.getElementById("female");
    var genderError = document.getElementById("genderError");

    if (maleRadio.checked || femaleRadio.checked) {
        // 남성 또는 여성이 선택된 경우 에러 메시지를 숨깁니다.
        genderError.style.display = "none";
    }
}

// 라디오 버튼의 변경을 감지하고 에러 메시지를 숨깁니다.
document.getElementById("male").addEventListener("change", hideGenderError);
document.getElementById("female").addEventListener("change", hideGenderError);

// 성별 선택이 없을 때 에러 메시지를 표시합니다.
function checkGenderSelection() {
    var maleRadio = document.getElementById("male");
    var femaleRadio = document.getElementById("female");
    var genderError = document.getElementById("genderError");

    if (!maleRadio.checked && !femaleRadio.checked) {
        // 남성 또는 여성이 선택되지 않은 경우 에러 메시지를 표시합니다.
        genderError.style.display = "block";
    }
}

// 폼 제출 시 성별 선택 여부를 확인합니다.
function submitForm() {
    hideGenderError(); // 혹시나 선택된 상태라면 에러 메시지를 숨깁니다.
    checkGenderSelection(); // 폼 제출 시 성별 선택 여부를 확인하고 에러 메시지를 표시합니다.

    var genderError = document.getElementById("genderError").style.display;

    if (genderError === "none") {
        // 성별 선택이 올바르게 되어 있다면 폼을 제출합니다.
        document.resForm.submit();
    }
}


function hideDiseaseError() {
    var diseaseSelect = document.getElementById("reserve_disease");
    var diseaseError = document.getElementById("diseaseError");

    if (diseaseSelect.value !== "") {
        diseaseError.style.display = "none";
    }
}

function checkDiseaseSelection() {
    var diseaseSelect = document.getElementById("reserve_disease");
    var diseaseError = document.getElementById("diseaseError");

    if (diseaseSelect.value === "") {
        diseaseError.style.display = "block";
    } else {
        diseaseError.style.display = "none";
    }
}

// 선택이 없을 때도 에러 메시지를 표시하도록 설정
document.getElementById("reserve_disease").addEventListener("change", hideDiseaseError);

// 폼 제출 시 질병 선택 여부를 확인합니다.
function submitForm() {
    hideDiseaseError(); // 혹시나 선택된 상태라면 에러 메시지를 숨깁니다.
    checkDiseaseSelection(); // 폼 제출 시 질병 선택 여부를 확인하고 에러 메시지를 표시합니다.

    var diseaseError = document.getElementById("diseaseError").style.display;

    if (diseaseError === "none") {
        document.resForm.submit();
    }
}




<!-- 예약일 오늘이전 날짜 선택시 경고문-->

    function validateDate() {
        var today = new Date();
        today.setHours(0, 0, 0, 0); // 시간을 00:00:00으로 설정

        var reserveDateInput = document.getElementById("reserve_date");
        var reserveDateStr = reserveDateInput.value;

        if (reserveDateStr !== "") {
            var selectedDate = new Date(reserveDateStr);

            if (selectedDate <= today) {
                document.getElementById("dateError").innerText = "최소 내일 이후 날짜를 선택하세요.";
                alert("예약일은 최소 내일 이후로 입력바랍니다.");
                reserveDateInput.value = ""; // 입력값 초기화
            } else {
                document.getElementById("dateError").innerText = "";
            }
        }
    }

    function submitForm() {
        validateDate();

        var dateError = document.getElementById("dateError").innerText;

        if (dateError === "") {
            document.resForm.submit();
        }
    }
</script>

	<script>
function redirectToLoginPage() {
    // 현재 페이지의 URL 가져오기
    var currentUrl = window.location.href;

    // returnUrl 전송
    window.location.href = 'login.jsp?returnUrl=' + encodeURIComponent(currentUrl);
}
</script>



	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>