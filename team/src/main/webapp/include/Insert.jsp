<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<form action="resView.jsp" method="post">
    <label for="user_id">User ID:</label>
    <input type="text" name="user_id" id="user_id" required>
    <input type="submit" value="Submit">
    <% out.println("<a href='resForm.jsp'> 예약페이지로 이동</a>"); %> <%-- 한글깨짐 --%>
</form>
