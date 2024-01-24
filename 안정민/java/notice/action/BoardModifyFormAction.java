package notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import notice.svc.BoardDetailService;
import notice.model.ActionForward;
import notice.model.BoardBean;

public class BoardModifyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	ActionForward forward = new ActionForward();
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			BoardDetailService boardDetailService
			= new BoardDetailService();	
		   	BoardBean article =boardDetailService.getArticle(board_num);
		   	request.setAttribute("article", article);
	   		forward.setPath("view/noticemodify.jsp");
	   		return forward;
	   		
	 }
	 
}