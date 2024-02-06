package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import board.svc.BoardDetailService2;
import board.model.ActionForward2;
import board.model.BoardBean2;

public class BoardModifyFormAction2 implements Action2 {
	
	 public ActionForward2 execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		 	ActionForward2 forward = new ActionForward2();
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			BoardDetailService2 boardDetailService
			= new BoardDetailService2();	
		   	BoardBean2 article =boardDetailService.getArticle(board_num);
		   	request.setAttribute("article", article);
	   		forward.setPath("view/boardmodify.jsp");
	   		return forward;
	   		
	 }
	 
}