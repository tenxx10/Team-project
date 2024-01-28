<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>예방접종예약 수정</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="../assets/favicon1.png" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="../css/style.css">
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
                <!-- 여기부터 작성하면 됩니다. -->
                <%
                    // 세션 겟
                    HttpSession userSession = request.getSession(false);
                    if (userSession != null && userSession.getAttribute("user_id") != null) {
                        // 로그인 o
                        String userId = (String) userSession.getAttribute("user_id");

                        Connection conn = null;
                        PreparedStatement preparedStatement = null;
                        ResultSet resultSet = null;

                        try {
                            // 데이터베이스 연결 정보
                            Context initContext = new InitialContext();
                            Context envContext = (Context) initContext.lookup("java:comp/env");
                            DataSource ds = (DataSource) envContext.lookup("jdbc/mariadb");

                            // 데이터베이스 연결
                            conn = ds.getConnection();

                            // 예약번호로 조회
                            int reserveNo = Integer.parseInt(request.getParameter("reserve_no"));
                            
                            // 데이터 조회 쿼리
                            String selectQuery = "SELECT * FROM reserve WHERE user_id = ? AND reserve_no = ?";
                            preparedStatement = conn.prepareStatement(selectQuery);
                            preparedStatement.setString(1, userId);
                            preparedStatement.setInt(2, reserveNo);
                            resultSet = preparedStatement.executeQuery();

                            // 예약 내역 수정 폼
                            if (resultSet.next()) {
                                // Retrieve data from the result set
                                String reserveGen = resultSet.getString("reserve_gen");
                                int reserveAge = resultSet.getInt("reserve_age");
                                String reservePhone = resultSet.getString("reserve_phone");
                                String reserveEmail = resultSet.getString("reserve_email");
                                String reserveDisease = resultSet.getString("reserve_disease");
                                String reserveItem = resultSet.getString("reserve_item");
                                Date reserveDate = resultSet.getDate("reserve_date");
                                String reserveLocal = resultSet.getString("reserve_local");
%>
<!--  예약 수정 폼 -->




                            				 <div class="container">
        
            <form name="resForm" action="vacResUpdateProcess.jsp" method="post">
                <table class="mx-auto">
                
                 <!-- reserve_no 추가 -->
        <input type="hidden" name="reserve_no" value="<%= reserveNo %>">
                
                    <tr>
                        <td colspan="2" class="td_title"><br>접종 예약 수정</td>
                    </tr>
                    <tr>
                        
                        <td colspan="3" class="td_title"><br>(대상질병은 취소 후 다시 예약바랍니다.)<br><br></td>
                    </tr>
                     <tr>
					    <td><label for="user_id">아이디 :</label></td>
					    <td><input type="text" class="form-control" name="user_id" id="user_id" value="<%= session.getAttribute("user_id") %>"readonly></td>
					</tr>
					<tr>
					    <td><label for="user_name">회원 이름 :</label></td>
					    <td><input type="text" class="form-control" name="user_name" id="user_name" value="<%= session.getAttribute("user_name") %>"readonly></td>
					</tr>

                    
                    
                    <tr>
					    <td><label>예약자 성별:</label></td>
					    <td>
					        <div class="form-check form-check-inline">
					            <input class="form-check-input" type="radio" name="reserve_gen" id="male" value="male" <%= reserveGen.equals("male") ? "checked" : "" %> required>
					            <label class="form-check-label" for="male">남</label>
					        </div>
					        <div class="form-check form-check-inline">
					            <input class="form-check-input" type="radio" name="reserve_gen" id="female" value="female" <%= reserveGen.equals("female") ? "checked" : "" %> required>
					            <label class="form-check-label" for="female">여</label>
					        </div>
					    </td>
					</tr>
                    
                    
                    
                    
                    
                    
                                      
					                  
                    
     <tr>
							    <td><label for="reserve_age">예약자 나이 :</label></td>
							    <td>
							        <input type="number" class="form-control" name="reserve_age" id="reserve_age_input" value="<%= reserveAge %>" placeholder="숫자만 입력 예시) 30" oninput="validateAge()" required>
							        <span id="ageError" style="color: red;"></span>
							    </td>
							</tr>			               
                    
                    
                    
                    <tr>
                        <td><label for="reserve_phone">회원 연락처 :</label></td>
                        <td><input type="text" class="form-control" name="reserve_phone" id="reserve_phone"  value="<%= reservePhone %>" placeholder="연락처를 입력해주세요"></td>
                    </tr>
                    <tr>
                        <td><label for="reserve_email">회원 이메일 :</label></td>
                        <td><input type="text" class="form-control" name="reserve_email" id="reserve_email"  value="<%= reserveEmail %>" placeholder="이메일을 입력해주세요"></td>
                    </tr>
                    <tr>
                        <td><label for="reserve_disease">접종대상 질병 :</label></td>
                        <td><input type="text" class="form-control" name="reserve_disease" id="reserve_disease" value="<%= reserveDisease %>"readonly></td>
                    </tr>
				

                    <tr>
                        <td><label for="reserve_item">희망주사 품명 :</label></td>
                        <td><input type="text" class="form-control" name="reserve_item" id="reserve_item" value="<%= reserveItem %>" placeholder="원하시는 제품이 없을 경우 '없음' "></td>
                        
                    </tr>
					
					
					<tr>
					    <td><label for="reserve_date">접종희망일 :</label></td>
					    <td>
					        <input type="date" class="form-control"
					               name="reserve_date" id="reserve_date"
					               value="<%= reserveDate %>"  
					               required oninput="validateDate()"></td>
					        <span id="dateError" style="color: red;"></span>
					    </td>
					</tr>					
					
					
					
					
					
					
					
                    <tr>
                        <td><label for="reserve_local">접종희망병원 :</label></td>
                        <td><input type="text" class="form-control" name="reserve_local" id="reserve_local" value="<%= reserveLocal %>" placeholder="없다면 '없음' 입력"></td>
                    </tr>
                    
                </table>
                	<input type='submit' value='수정 완료' class='btn btn-success'>
			</form>
           
        </div>
        
<% 
                                                              
                            } else {
                                out.println("예약 정보를 찾을 수 없습니다.");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            // 리소스 정리
                            try {
                                if (resultSet != null)
                                    resultSet.close();
                                if (preparedStatement != null)
                                    preparedStatement.close();
                                if (conn != null)
                                    conn.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    } else {
                %>
                <br><br><br>
                <p>로그인이 필요한 페이지입니다. <a href="login.jsp">로그인</a>해주세요.</p>
                <%
                    }
                %>
            </main>
        </div>
    </div>
    <!-- Include footer.jsp -->
    <%@ include file="/include/footer.jsp"%>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    
<script>
    function validateAge() {
        var ageInput = document.getElementById("reserve_age_input").value;

        if (!(/^\d+$/.test(ageInput))) {
            document.getElementById("ageError").innerText = "나이는 숫자로만 입력하세요.";
        } else {
            document.getElementById("ageError").innerText = "";
        }
    }

    function checkCustomInput() {
        var diseaseSelect = document.getElementById("reserve_disease");
        var customInput = document.getElementById("custom_disease");

        if (diseaseSelect.value === "direct_input") {
            // "direct_input"을 선택하면 직접 입력 폼을 보여줌
            customInput.style.display = "block";
        } else {
            customInput.style.display = "none";
        }
    }

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
        validateAge(); // 폼 전송 전에 한 번 더 검사
        checkCustomInput();
        validateDate();

        var ageError = document.getElementById("ageError").innerText;
        var dateError = document.getElementById("dateError").innerText;

        if (ageError === "" && dateError === "") {
            document.resForm.submit();
        }
    }
</script>
    
    
</body>
</html>
