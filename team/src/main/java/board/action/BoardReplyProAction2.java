package board.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import board.svc.BoardReplyProService2;
import board.model.ActionForward2;
import board.model.BoardBean2;

public class BoardReplyProAction2 implements Action2 {
	
	 public ActionForward2 execute(HttpServletRequest request,HttpServletResponse response) 
	 throws Exception{
		 
		 	ActionForward2 forward = null;
		    String nowPage = request.getParameter("page");
		 	BoardBean2 article = new BoardBean2();  		
		 	article.setBOARD_NUM(Integer.parseInt(request.getParameter("BOARD_NUM")));
		 	article.setBOARD_NAME(request.getParameter("BOARD_NAME"));
		 	article.setBOARD_PASS(request.getParameter("BOARD_PASS"));
		 	article.setBOARD_SUBJECT(request.getParameter("BOARD_SUBJECT"));
		 	article.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));
		 	article.setBOARD_RE_REF(Integer.parseInt(request.getParameter("BOARD_RE_REF")));
		 	article.setBOARD_RE_LEV(Integer.parseInt(request.getParameter("BOARD_RE_LEV")));
		 	article.setBOARD_RE_SEQ(Integer.parseInt(request.getParameter("BOARD_RE_SEQ")));	   		
		 	BoardReplyProService2 boardReplyProService = new BoardReplyProService2();
		 	boolean isReplySuccess = boardReplyProService.replyArticle(article);
		 	
	   		if(isReplySuccess){
	   			forward = new ActionForward2();
	   			forward.setRedirect(true);
	   			forward.setPath("boardList.boa?page=" + nowPage);
	   		}
	   		else{
	   			response.setContentType("text/html;charset=UTF-8");
	   			PrintWriter out = response.getWriter();
	   			out.println("<script>");
	   			out.println("alert('답장실패')");
	   			out.println("history.back()");
	   			out.println("</script>");
	   		}
	   		
	   		return forward;
	   		
	}  	
	 
}