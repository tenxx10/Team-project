<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon1.png" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" type="text/css" href="../css/style.css">
<title>백신 정보 페이지</title>


<style type="text/css">
h2 {
	color: #555;
	font-family:'Black Han Sans', sans-serif;
}

h3.h3-first {
	color: #444;
	margin-bottom: 30px;
	margin-top: 50px;
}

p {
	-webkit-text-size-adjust: 100%;
	box-sizing: border-box;
	margin: 40;
	padding: 0 40px;
	word-break: keep-all;
	font-size: inherit;
	color: #666;
	margin-bottom: 40px;
}

dt {
	background-color: #f6fafd;
	border-top: 1px solid #069be1;
	border-bottom: 1px solid #ddd;
	padding: 5px 15px;
	font-size: 15px;
	color: #666;
}

span.sub-qna {
	color: #666;
	box-sizing: border-box;
	display: inline-block;
	height: 23px;
	border: 1px solid #c2d7eb;
	background-color: #ecf6ff;
	border-radius: 12px;
	font-size: 13px;
	line-height: 21px;
	padding: 0 10px;
	margin-bottom: 5px;
}

div.box-gray {
	box-sizing: border-box;
	background-color: #f8f8f8;
	border: 1px solid #ddd;
	font-size: 14px;
	line-height: 22px;
	color: #666;
	padding: 15px 20px;
	margin-top: 20px;
}

li {
	line-height: 23px;
	list-style: none;
	box-sizing: border-box;
	position: relative;
	font-size: inherit;
	color: #666;
	margin-bottom: 0;
	padding-left: 7px;
}

div.top-tblinfo {
	box-sizing: border-box;
	font-size: 14px;
	line-height: 22px;
	font-weight: 500;
	color: #666;
	text-align: center;
	padding: 15px 0;
}

th.col {
	-webkit-text-size-adjust: 100%;
	list-style: none;
	border-collapse: collapse;
	border-spacing: 0;
	word-break: break-all;
	box-sizing: border-box;
	border-bottom: 1px solid #ddd;
	text-align: center;
	font-size: 14px;
	line-height: 22px;
	font-weight: 400;
	color: #666;
	letter-spacing: -0.075em;
	padding: 14px 10px;
}

th.row {
	-webkit-text-size-adjust: 100%;
	list-style: none;
	border-collapse: collapse;
	border-spacing: 0;
	word-break: break-all;
	box-sizing: border-box;
	vertical-align: top;
	border-bottom: 1px solid #ddd;
	font-size: 14px;
	line-height: 22px;
	font-weight: 400;
	color: #666;
	letter-spacing: -0.08em;
	padding: 14px 20px 13px 20px;
	background-color: #f7f7f7;
	text-align: left;
	border-left: none;
	background-color: #a0a0a0
}

td {
	border-collapse: collapse;
	word-break: break-all;
	box-sizing: border-box;
	vertical-align: top;
	border-bottom: 1px solid #ddd;
	border-left: 1px solid #ddd;
	font-size: 14px;
	line-height: 22px;
	font-weight: 400;
	color: #666;
	padding: 14px 20px 13px 20px;
}

a {
	font-size: 14px;
	font-weight: bold;
	color: black;
}

.table-container {
	border: 1px solid #ddd; /* 네모박스 테두리 스타일 */
	padding: 15px; /* 네모박스 안의 여백 조절 */
	margin: 20px auto; /* 가운데 정렬 */
	max-width: 800px; /* 최대 너비 지정 */
}

.vaccine {

	margin-right: 150px;
	margin-bottom:100px;
	margin-top:50px;


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
		


				<div class="table-container">
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">백신정보확인</th>
								<th scope="col">[ 질병을 선택하세요 ]</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row"></th>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd01">결핵</a></td>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd02">B형간염</a></td>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd03">디프테리아균</a></td>
							</tr>
							<tr>
								<th scope="row"></th>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd04">폴리오</a></td>
								<td><a
									href="<%= request.getRequestURI() %>?vaccineCode=vcnCd21">풍진</a></td>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd06">폐렴구균</a></td>
							</tr>
							<tr>
								<th scope="row"></th>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd07">홍역</a></td>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd08">수두</a></td>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd09">일본뇌염</a></td>
							</tr>
							<tr>
								<th scope="row"></th>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd10">인플루엔자</a></td>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd11">장티푸스</a></td>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd12">신증후군출혈열</a></td>
							</tr>
							<tr>
								<th scope="row"></th>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd13">A형간염</a></td>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd14">로타바이러스감염증</a></td>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd15">사람유두종바이러스</a></td>
							</tr>
							<tr>
								<th scope="row"></th>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd16">수막구균</a></td>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd17">대상포진</a></td>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd18">파상풍균</a></td>
							</tr>
							<tr>
								<th scope="row"></th>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd19">백일해</a></td>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd20">유행성이하선염</a></td>
								<td><a
									href="<%=request.getRequestURI()%>?vaccineCode=vcnCd05">b형헤모필루스인플루엔자균</a></td>
							</tr>

						</tbody>
					</table>
				</div>
				
				
				<div class = "container vaccine">



				<%
				String vaccineCode = request.getParameter("vaccineCode");

				if (vaccineCode != null && !vaccineCode.isEmpty()) {
					switch (vaccineCode) {
					case "vcnCd01":
				%><%@ include file="/include/dList/vcnCd01.jsp"%>
				<%
                break;
            case "vcnCd02":
                %><%@ include file="/include/dList/vcnCd02.jsp"%>
				<%
                break;
            case "vcnCd03":
                %><%@ include file="/include/dList/vcnCd03.jsp"%>
				<%
                break;
            case "vcnCd04":
                %><%@ include file="/include/dList/vcnCd04.jsp"%>
				<%
                break;
            case "vcnCd05":
                %><%@ include file="/include/dList/vcnCd05.jsp"%>
				<%
                break;       
            case "vcnCd06":
                %><%@ include file="/include/dList/vcnCd06.jsp"%>
				<%
                break;
            case "vcnCd07":
                %><%@ include file="/include/dList/vcnCd07.jsp"%>
				<%
                break;
            case "vcnCd08":
                %><%@ include file="/include/dList/vcnCd08.jsp"%>
				<%
                break;
            case "vcnCd09":
                %><%@ include file="/include/dList/vcnCd09.jsp"%>
				<%
                break;
            case "vcnCd10":
                %><%@ include file="/include/dList/vcnCd10.jsp"%>
				<%
                break;
            case "vcnCd11":
                %><%@ include file="/include/dList/vcnCd11.jsp"%>
				<%
                break;
            case "vcnCd12":
                %><%@ include file="/include/dList/vcnCd12.jsp"%>
				<%
                break;
            case "vcnCd13":
                %><%@ include file="/include/dList/vcnCd13.jsp"%>
				<%
                break;
            case "vcnCd14":
                %><%@ include file="/include/dList/vcnCd14.jsp"%>
				<%
                break;
            case "vcnCd15":
                %><%@ include file="/include/dList/vcnCd15.jsp"%>
				<%
                break;
            case "vcnCd16":
                %><%@ include file="/include/dList/vcnCd16.jsp"%>
				<%
                break;
            case "vcnCd17":
                %><%@ include file="/include/dList/vcnCd17.jsp"%>
				<%
                break;
            case "vcnCd18":
                %><%@ include file="/include/dList/vcnCd18.jsp"%>
				<%
                break;
            case "vcnCd19":
                %><%@ include file="/include/dList/vcnCd19.jsp"%>
				<%
                break;
            case "vcnCd20":
                %><%@ include file="/include/dList/vcnCd20.jsp"%>
				<%
                break;
                
            case "vcnCd21":
                %><%@ include file="/include/dList/vcnCd21.jsp"%>
				<%
                break;
            
             
    
    default:
        out.println("선택한 질병에 대한 정보가 없습니다.");
        break;
	}
	} else {
	out.println();
	}
    
    
    
%>
</div>
			</main>
		</div>
	</div>




	<!-- Include footer.jsp -->
	<%@ include file="/include/footer.jsp"%>


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
