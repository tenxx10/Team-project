<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
    
    <style>
    .navbar {
        padding-top: 0;
        padding-bottom: 0;
    }
	</style>
  </head>

  <body>
    <!-- Responsive navbar-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">���� ģ��</a>
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
            
                        <%-- ���ǿ� user_id�� ������ ��ũ�� ������ --%>
    				<li class="nav-item">
    				<% if (session.getAttribute("user_id") == null) { %>
                    <a class="nav-link" href="login.jsp">Login</a>
    				<% } %></li>
    				
                    <li class="nav-item">
				    <% if (session.getAttribute("user_id") == null) { %>
				        <a class="nav-link" href="join.jsp">Join</a>
				    <% } %></li>
				    
				    <!-- �α��� ������ �� -->
							<jsp:include page="logout_modal.jsp" />
                    <% if (session.getAttribute("user_name") != null) { %>
                        <li class="nav-item"><p class="nav-link" data-bs-toggle="modal" data-bs-target="#logoutModal"> [�α׾ƿ�]</p></li>
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
            <h2 class="h4 mb-4"><br /><br />ī�װ�</h2>
            <div class="list-group">
              <a
                href="mypage.jsp"
                class="list-group-item list-group-item-action"
              >
                <i class="bi bi-person"></i> ����������
              </a>
              <a
                href="vacccine.jsp"
                class="list-group-item list-group-item-action"
              >
                <i class="bi bi-file-earmark-text"></i> ������������
              </a>
              <a
                href="calendar.jsp"
                class="list-group-item list-group-item-action"
              >
                <i class="bi bi-calendar"></i> Ķ����
              </a>
              <a
                href="board.jsp"
                class="list-group-item list-group-item-action"
              >
                <i class="bi bi-chat-left"></i> �����Խ���
              </a>
              <a
                href="info.jsp"
                class="list-group-item list-group-item-action"
              >
                <i class="bi bi-info-circle"></i> �������̼�
              </a>
            </div>
          </div>
        </nav>

        <!-- Main content -->
        <main class="col-lg-10 col-md-7 ms-md-auto px-4">
        <div class="container">
        <center>
                    <br><h1>����������</h1><br>
                    
                    
                    <%
                        // ���� ��
                        HttpSession userSession = request.getSession(false);

                        if (userSession != null && userSession.getAttribute("user_id") != null) {
                            // �α��� o
                            
                            String userId = (String) userSession.getAttribute("user_id");
                            String userName = (String) userSession.getAttribute("user_name");
                            String userEmail = (String) userSession.getAttribute("user_email");
                            String userPhone = (String) userSession.getAttribute("user_phone");
                            String userDate = (String) userSession.getAttribute("user_date");
                    %>
                    	
                            <br>
                            <p>���̵�: <%= userId %></p>
                            <p>�̸�: <%= userName %></p>
                            <p>�̸���: <%= userEmail %></p>
                            <p>����ó: <%= userPhone %></p>
                            <p>������: <%= userDate %></p>
                            
                            <br><br><br>
                            
                            <!-- ��й�ȣ ���� ��� -->
							<div class="modal fade" id="changePasswordModal" tabindex="-1" role="dialog"
                            aria-labelledby="changePasswordModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="changePasswordModalLabel">��й�ȣ ����</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    
                                    <div class="modal-body">
							                <!-- ��й�ȣ ���� �� -->
									<form action="changePassword.jsp" method="post">
									    <div class="mb-3">
									        <label for="currentPassword" class="form-label">���� ��й�ȣ</label>
									        <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
									    </div>
									    <div class="mb-3">
									        <label for="newPassword" class="form-label">���ο� ��й�ȣ</label>
									        <input type="password" class="form-control" id="newPassword" name="newPassword" required>
									    </div>
									    <div class="mb-3">
									        <label for="confirmPassword" class="form-label">��й�ȣ Ȯ��</label>
									        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
									    </div>
									    <button type="submit" class="btn btn-primary">��й�ȣ ����</button>
									</form>							                
							        </div>
							        
							            <div class="modal-footer">
							                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">�ݱ�</button>
							            </div>
							        </div>
							    </div>
							</div>

							
							<tr>
							<!-- �α׾ƿ� ��� �ҷ��ͼ� ��� -->
							<jsp:include page="logout_modal.jsp" />
							    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#changePasswordModal">��й�ȣ ����</button>
							    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#logoutModal">�α׾ƿ�</button>
							</tr>
                            
							
                            
                            
                            
                    <%
                        } else {
                            // �α��� x
                    %>	
                    		<br><br><br>
                            <p>�α����� �ʿ��� �������Դϴ�. <a href="login.jsp">�α���</a>���ּ���.</p>
                    <%
                        }
                    %>
                </div>
                </center>
                
      </div>
    </div>
    </main>

    
    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
  </body>
</html>
