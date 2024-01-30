<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="board.model.PageInfo2" %>
<%@ page import="board.model.BoardBean2" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	@SuppressWarnings("unchecked")  // arraylist 타입 위험으로 떠서 어노테이션 추가했습니다.
	ArrayList<BoardBean2> articleList = (ArrayList<BoardBean2>)request.getAttribute("articleList");
	PageInfo2 pageInfo = (PageInfo2)request.getAttribute("pageInfo");
	
	// 추가: pageInfo가 null인 경우 초기화
	if (pageInfo == null){
		pageInfo = new PageInfo2();
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
    <title>자유게시판</title>
    
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="../assets/favicon1.png" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    
     <style type="text/css">
        #listForm {
            margin-top: 100px;
            margin-right: 100px;
            margin-left: 100px;
            
        }

        #tr_top {
            background-color: #f2f2f2;
            font-size: 15px;
            padding: 14px;
            font-weight: 500;
        }

        #pageList {
            text-align: center;
            margin-bottom: 100px;
        }

        table {
            width: 100%;
            border: 1px solid #ddd;
            text-align: center;
        }

        td, th {
            padding: 10px;
            border: 1px solid #ddd; /* 테이블 안쪽 구분선 적용 */
        }

        /* 번호 칸 스타일 조정 */
        td:nth-child(1) {
            width: 80px; /* 번호 칸의 너비를 80픽셀로 조정 */
        }

        /* 제목 칸 스타일 조정 */
        td:nth-child(2) {
            text-align: left; /* 텍스트를 왼쪽 정렬로 설정 */
        }
    </style>
    
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
        <!-- 공지사항 리스트 -->
        <section id="listForm">
        <h2>글 목록</h2>
        <aside id="writeLink" style="float: right; margin-top: 20px;">
        	<a href="boardWriteForm.boa" style="color: black;">게시판글쓰기</a>
        </aside>
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
                        <% } %>└
                    <% } else { %>  <% } %>
                    <a href="boardDetail.boa?board_num=<%= articleList.get(i).getBOARD_NUM() %>&page=<%= nowPage %>" style="color: black;">
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
				<a href="boardList.boa?page=<%=nowPage-1 %>">[이전]</a>&nbsp;
			<%} %>
			
			<%for(int a=startPage;a<=endPage;a++){
				if(a==nowPage){%>
					[<%=a %>]
				<%}else{ %>
				
					<a href="boardList.boa?page=<%=a %>">[<%=a %>]
					</a>&nbsp;
				<%} %>
			<%} %>
			<%if(nowPage>=maxPage){ %>
				[다음]
			<%}else{ %>
				<a href="boardList.boa?page=<%=nowPage+1 %>">[다음]</a>
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