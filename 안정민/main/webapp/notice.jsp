<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="notice.model.PageInfo" %>
<%@ page import="notice.model.BoardBean" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
@SuppressWarnings("unchecked")
ArrayList<BoardBean> articleList = (ArrayList<BoardBean>) request.getAttribute("articleList");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

// 추가: pageInfo가 null인 경우 초기화
if (pageInfo == null) {
	pageInfo = new PageInfo();
	pageInfo.setListCount(0);
	pageInfo.setPage(1);
	pageInfo.setMaxPage(1);
	pageInfo.setStartPage(1);
	pageInfo.setEndPage(1);
}

int listCount = pageInfo.getListCount();
int nowPage = pageInfo.getPage();
int maxPage = pageInfo.getMaxPage();
int startPage = pageInfo.getStartPage();
int endPage = pageInfo.getEndPage();
%>




<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>공지사항</title>
    
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="../css/style.css">
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
        
        <!-- 정민님 작성 -->
        <!-- 공지사항 리스트 -->
        <section id="listForm">
        <h2>글 목록</h2>
        	<a href="./notice/noticewrite.jsp">공지사항글쓰기</a>
        <table>
            <%
                if(articleList != null && listCount > 0){
            %>
            <tr id="tr_top">
                <td>번호</td>
                <td>제목</td>
                <td>작성자</td>
                <td>날짜</td>
                <td>조회수</td>
            </tr>
            <%
                for(int i=0; i < articleList.size(); i++){
            %>
            <tr>
                <td><%= articleList.get(i).getBOARD_NUM() %></td>
                <td>
                    <% if(articleList.get(i).getBOARD_RE_LEV()!=0){ %>
                        <% for(int a=0; a <= articleList.get(i).getBOARD_RE_LEV()*2; a++){ %>
                            &nbsp;
                        <% } %> ▶
                    <% } else { %> ▶ <% } %>
                    <a href="boardDetail.bo?board_num=<%= articleList.get(i).getBOARD_NUM() %>&page=<%= nowPage %>">
                        <%= articleList.get(i).getBOARD_SUBJECT() %>
                    </a>
                </td>
                <td><%= articleList.get(i).getBOARD_NAME() %></td>
                <td><%= articleList.get(i).getBOARD_DATE() %></td>
                <td><%= articleList.get(i).getBOARD_READCOUNT() %></td>
            </tr>
            <%
                }
            %>
        </table>
    </section>

		<section id="pageList">
			<%if(nowPage<=1){ %>
				[이전]&nbsp;
			<%}else{ %>
				<a href="boardList.bo?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
			<%} %>
			
			<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
					[<%=a %>]
				<%}else{ %>
				
					<a href="boardList.bo?page=<%=a %>">[<%=a %>]
					</a>&nbsp;
				<%} %>
			<%} %>
			<%if(nowPage>=maxPage){ %>
				[다음]
			<%}else{ %>
				<a href="boardList.bo?page=<%=nowPage+1 %>">[다음]</a>
			<%} %>
			
		</section>
		 <%
        } else {
    %>
    <section id="emptyArea">등록된 글이 없습니다.</section>
    <%
        }
    %>

        </main>
      </div>
    </div>
    
    
<!-- Include footer.jsp -->
    <%@ include file="/include/footer.jsp" %>

    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
  </body>
</html>
