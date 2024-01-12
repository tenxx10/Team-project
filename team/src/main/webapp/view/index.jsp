<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Vaccine Friend</title>
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
        
        
          <!-- Page header with logo and tagline-->
          <header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
              <div class="text-center my-5">
                <h1 class="fw-bolder">Welcome to Vaccine world!</h1>
                <p class="index-0">당신곁의 든든한 건강알리미, 접종 친구</p>
              </div>
            </div>
          </header>
          <!-- Page content-->
          <div class="container">
            <div class="row">
              <!-- Blog entries-->
              <div class="col-lg-8">
                <!-- Featured blog post-->
                <div class="card mb-4">
                  <a href="#!"
                    ><img
                      class="card-img-top"
                      src="/assets/img/vacc2.png"
                      alt="..."
                  /></a>
                  <div class="card-body">
                    <div class="small text-muted">January 1, 2024</div>
                    <h2 class="card-title">예방접종 증명서 발급</h2>
                    <p class="card-text">
                      <div>예방접종증명서를 의료기관 및 보건기관 방문없이 간편하게 온라인을 통해 발급받으실 수 있습니다.</div>
                      <div><br>* 본 서비스를 이용하시려면 온라인 상 본인확인을 위한<br>공동인증기관이나 대행기관에서 발급한 인증서가 필요합니다.<br></div>
                    </p>
                    <a class="btn btn-primary" href="https://nip.kdca.go.kr/irhp/mngm/goVcntMngm.do?menuLv=3&menuCd=341">바로 가기 →</a>
                  </div>
                </div>
                <!-- Nested row for non-featured blog posts-->
                <div class="row">
                  <div class="col-lg-6">
                    <!-- Blog post-->
                    <div class="card mb-4">
                      <a href="#!"
                        ><img
                          class="card-img-top"
                          src="/assets/img/vacc1.jpg"
                          alt="..."
                      /></a>
                      <div class="card-body">
                        <div class="small text-muted">January 1, 2024</div>
                        <h2 class="card-title h4">오늘의 예방접종 소식</h2>
                        <p class="card-text">
                          <br>감기가 유행인 한겨울, 나에게 알맞는 예방접종 <br> 소식 알아보기<br>
                        </p>
                        <a class="btn btn-primary" href="https://nip.kdca.go.kr/irhp/mngm/goVcntMngm.do?menuLv=3&menuCd=341">바로 가기 →</a>
                      </div>
                    </div>
                    <!-- Blog post-->
                    <div class="card mb-4">
                      <a href="#!"
                        ><img
                          class="card-img-top"
                          src="/assets/img/vacc3.jpg"
                          alt="..."
                      /></a>
                      <div class="card-body">
                        <div class="small text-muted">January 11, 2024</div>
                        <h2 class="card-title h4">오늘의 건강정보</h2>
                        <p class="card-text">
                          <br> 낮에 하면 좋은 운동 : 코어 위주의 근력 <br> 저녁에 하기 좋은 운동 : 가벼운 산책
                        </p>
                        <a class="btn btn-primary" href="#">바로 가기→</a>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <!-- Blog post-->
                    <div class="card mb-4">
                      <a href="#!"
                        ><img
                          class="card-img-top"
                          src="/assets/img/vacc4.jpg"
                          alt="..."
                      /></a>
                      <div class="card-body">
                        <div class="small text-muted">January 1, 2024</div>
                        <h2 class="card-title h4">성인 예방접종 일정표</h2>
                        <p class="card-text">
                          <br>각 연령대의 성인에게 권장되는 예방접종으로 <br> 개인별 건강상태(질환), 직업∙상황 등에 따라 <br>권장되는 백신이 달라질 수 있습니다.
                        </p>
                        <a class="btn btn-primary" href="https://nip.kdca.go.kr/irhp/images/egovframework/rte/infm/Schedule_for_Adult_2019_1.gif">바로 가기→</a>
                      </div>
                    </div>
                    <!-- Blog post-->
                    <div class="card mb-4">
                      <a href="#!"><img class="card-img-top" src="assets/img/vacc1.jpg" alt="..."/></a>
                      <div class="card-body">
                        <div class="small text-muted">January 1, 2024</div>
                        <h2 class="card-title h4">광진구, 어르신 폐렴구균 무료 <br>예방접종 지원… 130곳서 가능</h2>
                        <p class="card-text">
                          서울시 광진구, 65세 노인 무료접종 ...
                        </p>
                        <a class="btn btn-primary" href="https://www.news1.kr/articles/5281700">Read more →</a>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- Pagination-->
                <nav aria-label="Pagination">
                  <hr class="my-0" />
                  <ul class="pagination justify-content-center my-4">
                    <li class="page-item disabled">
                      <a
                        class="page-link"
                        href="#"
                        tabindex="-1"
                        aria-disabled="true"
                        >이전</a
                      >
                    </li>
                    <li class="page-item active" aria-current="page">
                      <a class="page-link" href="#!">1</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#!">2</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#!">3</a>
                    </li>
                    <li class="page-item disabled">
                      <a class="page-link" href="#!">...</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#!">15</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#!">다음</a>
                    </li>
                  </ul>
                </nav>
              </div>
              <!-- Side widgets-->
              <div class="col-lg-4">
                <!-- Search widget-->
                <div class="card mb-4">
                  <div class="card-header">Search</div>
                  <div class="card-body">
                    <div class="input-group">
                      <input
                        class="form-control"
                        type="text"
                        placeholder="Enter search term..."
                        aria-label="Enter search term..."
                        aria-describedby="button-search"
                      />
                      <button
                        class="btn btn-primary"
                        id="button-search"
                        type="button"
                      >
                        Go!
                      </button>
                    </div>
                  </div>
                </div>
                <!-- Categories widget-->
                <div class="card mb-4">
                  <div class="card-header">Categories</div>
                  <div class="card-body">
                    <div class="row">
                      <div class="col-sm-6">
                        <ul class="list-unstyled mb-0">
                          <li><a href="vacccine.html">예방접종 정보</a></li>
                          <li><a href="#!">주변 보건소 위치</a></li>
                          <li><a href="#!">오늘의 날씨</a></li>
                        </ul>
                      </div>
                      <div class="col-sm-6">
                        <ul class="list-unstyled mb-0">
                          <li><a href="calendar.html">접종예약 캘린더</a></li>
                          <li><a href="mypage.html">마이페이지</a></li>
                          <li><a href="#!">오늘의 퀴즈</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- Side widget-->
                <div class="card mb-4">
                  <div class="card-header">오늘의 건강정보</div>
                  <div class="card-body">
                    현재 <strong>전국감기</strong>는 경고단계입니다.
                  </div>
                </div>
              </div>
            </div>
            
          </div>
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