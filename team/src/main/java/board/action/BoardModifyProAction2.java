package board.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import board.svc.BoardModifyProService2;
import board.model.ActionForward2;
import board.model.BoardBean2;

public class BoardModifyProAction2 implements Action2 {

	public ActionForward2 execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{

		ActionForward2 forward = null;
		boolean isModifySuccess = false;
		int board_num=Integer.parseInt(request.getParameter("BOARD_NUM"));
		BoardBean2 article=new BoardBean2();
		BoardModifyProService2 boardModifyProService = new BoardModifyProService2();
		boolean isRightUser=boardModifyProService.isArticleWriter(board_num, request.getParameter("BOARD_PASS"));

		if(!isRightUser){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('수정할 권한이 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			article.setBOARD_NUM(board_num);
			article.setBOARD_SUBJECT(request.getParameter("BOARD_SUBJECT"));
			article.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT")); 
			isModifySuccess = boardModifyProService.modifyArticle(article);

			if(!isModifySuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('수정실패');");
				out.println("history.back()");
				out.println("</script>");
			}
			else{
				forward = new ActionForward2();
				forward.setRedirect(true);
				forward.setPath("boardDetail.boa?board_num="+article.getBOARD_NUM()); 
			}

		}

		return forward;
	}

}