<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>게시판</title>
    
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="/css/style.css">
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
        
        <!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>게시글 작성 완료</title>
</head>

<style>
    .layout {
        width : 500px;
        margin : 0 auto;
        margin-top: 40px;
    }

    .board_title {
        width : 500px;
        margin-bottom: 10px;
    }

    .board_user_id {
        width : 500px;
        margin-bottom: 10px;
    }

    .board_content {
        width : 500px;
        margin-bottom: 10px;
    }
</style>

<body>
<div class = "layout">
    <div class>
        <h2>게시글 작성 완료</h2>
    </div>

    <div class = "board_title">
        <label for="title">게시글 제목</label>
        <input type="text" id="title" name="title" class="form-control" th:value="${board.title}" readonly>
    </div>

    <div class = "board_user_id">
        <label for="user_id">사용자 ID</label>
        <input type="text" id="user_id" name="user_id" class="form-control" th:value="${board.user_id}" readonly>
    </div>

    <div class = "board_content">
        <label for="content">게시글</label>
        <input type="text" id="content" name="content" class="form-control" th:value="${board.content}" readonly>
    </div>

    <div class>
        <div>
            <button onclick="location.href='/boards'" th:onclick="|location.href='@{/boards}'|"
                    type="button">게시글 목록</button>
        </div>
    </div>

</div>
</body>
</html>

 </main>
      </div>
    </div>