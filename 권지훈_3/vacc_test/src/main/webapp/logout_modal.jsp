<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!-- 로그아웃 모달 -->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
    aria-labelledby="logoutModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="logoutModalLabel">로그아웃 확인</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>

            <div class="modal-body">
                <p>로그아웃하시겠습니까?</p>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <a href="logout.jsp" class="btn btn-primary">로그아웃</a>
            </div>
        </div>
    </div>
</div>