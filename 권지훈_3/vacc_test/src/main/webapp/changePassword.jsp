<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="vacc_test.changePW"%> 

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
                    <% if (session.getAttribute("user_name") != null) { %>
                        <li class="nav-item"><p class="nav-link"> <%= session.getAttribute("user_name") %>(�α���)</p></li>
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
  
<main class="col-lg-10 col-md-7 ms-md-auto px-4">
        <div class="container">
        <center>
        <br><br><br><br>
<%
    HttpSession userSession = request.getSession(false);

    if (userSession != null && userSession.getAttribute("user_id") != null) {
        String userId = (String) userSession.getAttribute("user_id");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // �Է°� ����
        if (currentPassword == null || newPassword == null || confirmPassword == null ||
            newPassword.isEmpty() || !newPassword.equals(confirmPassword)) {
            out.println("<p style='color: red;'>�Է� ������ Ȯ�����ּ���.</p>");
            out.println("<a href='mypage.jsp' class='btn btn-primary'>���� �������� ���ư���</a>");
        } else {
            changePW changePW = new changePW();

            try {
                boolean isPasswordChanged = changePW.changePassword(userId, currentPassword, newPassword, confirmPassword);

                if (isPasswordChanged) {
                    out.println("<p style='color: green;'>��й�ȣ�� ���������� ����Ǿ����ϴ�.</p>");
                    
                    out.println("<a href='mypage.jsp' class='btn btn-primary'>���� �������� ���ư���</a>");
                } else {
                    out.println("<p style='color: red;'>���� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.</p>");
                    out.println("<a href='mypage.jsp' class='btn btn-primary'>���� �������� ���ư���</a>");
                }
            } catch (Exception e) {
                // ���� �޽���
                out.println("<p style='color: red;'>������ �߻��߽��ϴ�. �����ڿ��� �����ϼ���.</p>");
                out.println("<a href='mypage.jsp' class='btn btn-primary'>���� �������� ���ư���</a>");
                e.printStackTrace();
            } finally {
                //db ���� �ݱ�
                changePW.closeConnection();
            }
        }
    } else {
%>
    <p>�α����� �ʿ��� �������Դϴ�. <a href="login.jsp">�α���</a>���ּ���.</p>
<%
    }
%>
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

