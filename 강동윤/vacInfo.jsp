<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>백신 정보 페이지</title>
</head>

<style type="text/css">



h2{ 
    color: #555;
 }



h3.h3-first{
    color: #444;
    margin-bottom: 30px;
    margin-top: 50px;
    }
    
    
  
p{
    
    -webkit-text-size-adjust: 100%;
    box-sizing: border-box;
    margin: 40;
    padding: 0 40px;
    word-break: keep-all;
    font-size: inherit;
    color: #666;
    margin-bottom: 40px;
 }


dt{ 
	background-color: #f6fafd;
	border-top: 1px solid #069be1;
	border-bottom: 1px solid #ddd;
	padding: 5px 15px;
	font-size: 15px;
	color: #666;
    }

 
span.sub-qna{
	
  
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


div.box-gray{
    
    
    box-sizing: border-box;
    background-color: #f8f8f8;
    border: 1px solid #ddd;
    font-size: 14px;
    line-height: 22px;
    color: #666;
    
    padding: 15px 20px;
    margin-top: 20px;
    }
    

li{
	line-height: 23px;
    list-style: none;
    box-sizing: border-box;
    position: relative;
    font-size: inherit;
    color: #666;
    margin-bottom: 0;
    padding-left: 7px;
    
    }


div.top-tblinfo{
    box-sizing: border-box;
    font-size: 14px;
    line-height: 22px;
    font-weight: 500;
    color: #666;
    
    text-align: center;
    padding: 15px 0;
    }
    
    

th.col{
    
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


th.row{
    
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
    background-color : #a0a0a0

}


td{
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
        
    </style>   
    
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
           

				
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd01"><d class=d>결핵</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd02"><d class=d>B형간염</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd03"><d class=d>디프테리아균</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd04"><d class=d>폴리오</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd05"><d class=d>b형헤모필루스인플루엔자균</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd06"><d class=d>폐렴구균</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd07"><d class=d>홍역</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd08"><d class=d>수두</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd09"><d class=d>일본뇌염</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd10"><d class=d>인플루엔자</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd11"><d class=d>장티푸스</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd12"><d class=d>신증후군출혈열</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd13"><d class=d>A형간염</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd14"><d class=d>로타바이러스감염증</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd15"><d class=d>사람유두종바이러스</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd16"><d class=d>수막구균</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd17"><d class=d>대상포진</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd18"><d class=d>파상풍균</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd19"><d class=d>백일해</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd20"><d class=d>유행성이하선염</d></a>
				<a href="<%= request.getRequestURI() %>?vaccineCode=vcnCd21"><d class=d>풍진</d></a>



        
<%
    String vaccineCode = request.getParameter("vaccineCode");

    if (vaccineCode != null && !vaccineCode.isEmpty()) {
        switch (vaccineCode) {
            case "vcnCd01":
                %><%@ include file="/include/dList/vcnCd01.jsp" %><%
                break;
            case "vcnCd02":
                %><%@ include file="/include/dList/vcnCd02.jsp" %><%
                break;
            case "vcnCd03":
                %><%@ include file="/include/dList/vcnCd03.jsp" %><%
                break;
            case "vcnCd04":
                %><%@ include file="/include/dList/vcnCd04.jsp" %><%
                break;
            case "vcnCd05":
                %><%@ include file="/include/dList/vcnCd05.jsp" %><%
                break;       
            case "vcnCd06":
                %><%@ include file="/include/dList/vcnCd06.jsp" %><%
                break;
            case "vcnCd07":
                %><%@ include file="/include/dList/vcnCd07.jsp" %><%
                break;
            case "vcnCd08":
                %><%@ include file="/include/dList/vcnCd08.jsp" %><%
                break;
            case "vcnCd09":
                %><%@ include file="/include/dList/vcnCd09.jsp" %><%
                break;
            case "vcnCd10":
                %><%@ include file="/include/dList/vcnCd10.jsp" %><%
                break;
            case "vcnCd11":
                %><%@ include file="/include/dList/vcnCd11.jsp" %><%
                break;
            case "vcnCd12":
                %><%@ include file="/include/dList/vcnCd12.jsp" %><%
                break;
            case "vcnCd13":
                %><%@ include file="/include/dList/vcnCd13.jsp" %><%
                break;
            case "vcnCd14":
                %><%@ include file="/include/dList/vcnCd14.jsp" %><%
                break;
            case "vcnCd15":
                %><%@ include file="/include/dList/vcnCd15.jsp" %><%
                break;
            case "vcnCd16":
                %><%@ include file="/include/dList/vcnCd16.jsp" %><%
                break;
            case "vcnCd17":
                %><%@ include file="/include/dList/vcnCd17.jsp" %><%
                break;
            case "vcnCd18":
                %><%@ include file="/include/dList/vcnCd18.jsp" %><%
                break;
            case "vcnCd19":
                %><%@ include file="/include/dList/vcnCd19.jsp" %><%
                break;
            case "vcnCd20":
                %><%@ include file="/include/dList/vcnCd20.jsp" %><%
                break;
                
            case "vcnCd21":
                %><%@ include file="/include/dList/vcnCd21.jsp" %><%
                break;
            
             
    
    default:
        out.println("선택한 질병에 대한 정보가 없습니다.");
        break;
	}
	} else {
	out.println("궁금하신 질병을 선택해주세요.");
	}
    
    
    
%>
</main>
</div>
</div>
</body>
</html>



	<!-- Include footer.jsp -->
	<%@ include file="/include/footer.jsp"%>

    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>
</html>
