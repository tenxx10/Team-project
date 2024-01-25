package notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import notice.svc.BoardDetailService;
import notice.model.ActionForward;
import notice.model.BoardBean;

 public class BoardDetailAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
	   	
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		
		// BoardDetailService로부터 게시물 정보를 가져오기
		BoardDetailService boardDetailService = new BoardDetailService();
		BoardBean article = boardDetailService.getArticle(board_num);
		
		ActionForward forward = new ActionForward();
		
		// 게시물 및 페이지 정보를 request에 설정
		request.setAttribute("page", page);
	   	request.setAttribute("article", article);
   		forward.setPath("view/noticeview.jsp");
   		
   		return forward;

	 }
	 
}