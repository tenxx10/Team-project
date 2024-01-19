<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@ page import="java.net.URL, java.net.URLEncoder, java.io.BufferedReader, java.io.InputStreamReader, java.io.StringReader, javax.xml.parsers.DocumentBuilderFactory, javax.xml.parsers.DocumentBuilder, org.w3c.dom.Document, org.w3c.dom.NodeList, org.xml.sax.InputSource"%>
<%@ page import="org.w3c.dom.Node, org.w3c.dom.Element"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>예방접종정보</title>
    
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
            
                <!-- 여기부터 작성하면 됩니다.-->  
                <%!
                    // 질병정보 클래스
                    public class DiseaseInfo {
                        private String code;
                        private String name;
                        private String description;

                        public DiseaseInfo(String code, String name, String description) {
                            this.code = code;
                            this.name = name;
                            this.description = description;
                        }

                        public String getCode() {
                            return code;
                        }

                        public String getName() {
                            return name;
                        }

                        public String getDescription() {
                            return description;
                        }
                    }
                %>

                <%
                    // 질병 정보를 저장하는 리스트
                    List<DiseaseInfo> diseaseList = new ArrayList<>();

                    DocumentBuilder builder = null; 
                    String apiUrl = "https://apis.data.go.kr/1790387/vcninfo/getCondVcnCd"; //API 주소
                    String serviceKey = "Iio1DypG3KW5M95/c2oKNLCQ1a78qDZeIpi7WByJfTvKHAwXdudqfXK7WaU+zAFsARYI9iP+zB+Lucd8jov61Q=="; //API 인증키

                    try {
                        // API 연결을 위한 URL 생성
                        String fullUrl = apiUrl + "?serviceKey=" + URLEncoder.encode(serviceKey, "UTF-8");
                        URL url = new URL(fullUrl);

                        // API 호출 및 응답 읽기
                        BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
                        StringBuilder sb = new StringBuilder();
                        String line;
                        while ((line = br.readLine()) != null) {
                            sb.append(line);
                        }
                        br.close();

                        // XML 파싱
                        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                        builder = factory.newDocumentBuilder();
                        Document document = builder.parse(new InputSource(new StringReader(sb.toString())));
                        NodeList nodeList = document.getElementsByTagName("item");

                        // 질병 정보를 리스트에 저장
                        for (int i = 0; i < nodeList.getLength(); i++) {
                            String code = nodeList.item(i).getChildNodes().item(0).getTextContent();
                            String name = nodeList.item(i).getChildNodes().item(1).getTextContent();
                            diseaseList.add(new DiseaseInfo(code, name, ""));
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
<br>
                <table>
                    <thead>
                        <tr>
                            <th>예방접종대상질병</th>
                        </tr>
                        
                    </thead>
                    <br>
                    <tbody>
                    	
                        <% for (DiseaseInfo disease : diseaseList) { %>
                            <tr>
                                <td><a href="?vcnCd=<%= disease.getCode() %>"><%= disease.getName() %></a></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>

                <%
                    // 상세 정보 출력 부분
                    String vcnCd = request.getParameter("vcnCd");
                    if (vcnCd != null && !vcnCd.isEmpty()) {
                        try {
                            String detailUrl = "https://apis.data.go.kr/1790387/vcninfo/getVcnInfo";
                            String fullDetailUrl = detailUrl + "?serviceKey=" + URLEncoder.encode(serviceKey, "UTF-8") + "&vcnCd=" + vcnCd;
                            URL detailUrlObject = new URL(fullDetailUrl);

                            // API 호출 및 응답 읽기
                            BufferedReader detailBr = new BufferedReader(new InputStreamReader(detailUrlObject.openStream(), "UTF-8"));
                            StringBuilder detailSb = new StringBuilder();
                            String detailLine;
                            while ((detailLine = detailBr.readLine()) != null) {
                                detailSb.append(detailLine);
                            }
                            detailBr.close();

                            // XML 파싱
                            Document detailDocument = builder.parse(new InputSource(new StringReader(detailSb.toString())));
                            NodeList detailNodeList = detailDocument.getElementsByTagName("item");
                %>

							<br>
                            
                                <thead>
                                    <tr>
                            			<br>
                                     	<hr style="border-width:5px 0 0 0; border-color:#000;"> <!-- 경계선 -->

                                        <td><strong><%= detailNodeList.item(0).getChildNodes().item(0).getTextContent()%></strong></td> <!--  .replace("▶", "<br><br>▶").replace("?", "?<br>") 가독성 -->
                                        <br>
                                        <br>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><%= detailNodeList.item(0).getChildNodes().item(1).getTextContent()
                                        
                                        
                                        //상세내용 정리 태그 시작 (가독성향상)
                                        
                                        //세부 (페렴구균)
                                         

                                        //전체
                                        .replace("▶", "<br><br><hr></hr><br>▶") // 전체
                                        .replace("?", "?<br><br>")		//전체
                                        .replace("•", "<br>&emsp;•&ensp;") 	//전체
                                        .replace("※", "<br>&emsp;※&ensp; ") //전체
                                        .replace("●", "<br>&emsp;●&ensp;")
                                        .replace(".", ".<br>")
                           				
                                        //세부 (b형헤모필루스)
										.replace("1)", "<br>&emsp;&emsp;1)")
                                        .replace("2)", "<br>&emsp;&emsp;2)")
                                        .replace("3)", "<br>&emsp;&emsp;3)")
                                        .replace("ㆍ", "<br>&emsp;&emsp;&ensp;ㆍ")
                                        .replace("3회 접종①", "3회 접종")
                                        .replace("권장①", "권장")
                                        .replace("이전 접종력과 상관없이, 이식 6-12개월 이후부터 최소 4주 간격으로 3회 접종", "")
                                        .replace("4주 간격으로 3회 접종", "4주 간격으로 3회 접종권장")
                                        
                                        
                                        //"-"부분 정렬 1. (.replace 적용 제외되어야 하는 부분)
                                        .replace("(질병관리청고시 제2023-17호)", "(질병관리청고시 제2023$17호)")
                                        .replace("DTaP-IPV-HepB-Hib", "DTaP$IPV$HepB$Hib") 
                                        .replace("DTaP-IPV", "DTaP$IPV") 
                                        .replace("DTaP-IPV/Hib", "DTaP$IPV/Hib")
                                        .replace("DTaP-IPV/Hib", "DTaP$IPV/Hib")
                                        .replace("Varicella-zoster virus", "Varicella$zoster")
                                        .replace("Ramsay-Hunt", "Ramsay$Hunt")
                                        .replace("(표.1)", "[표.1]")
                                      	//"-"부분 정렬 2.
                                       	.replace("-", "<br>&emsp;&ensp;-") //반드시 정렬1 다음에 위치
                                        .replace("$", "-")	//반드시 마지막에 위치
                                        
                                        
                                        //내용 요약정리(일부내용 삭제)
                                  		.replace("① 아관긴급: 개구운동이 제한되어 입을 충분히 벌리지 못하는 상태② 후궁반장: 온몸에 걸친 근육의 긴장 발작으로 팔다리를 뻣뻣하게 뻗고 등을 활처럼 젖히는 상태", "")
                                  		.replace("아관긴급①, 후궁반장②", "아관긴급, 후궁반장")
                                        //상세내용 정리 태그 끝(가독성향상)
                                        
                                        %>
                                        <br>
                                        <br>
                                        <br>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                <%
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                %>
<br>

            </main>
        </div>
    </div>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>
</html>
