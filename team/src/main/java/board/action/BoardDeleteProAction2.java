package board.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import board.svc.BoardDeleteProService2;
import board.model.ActionForward2;

public class BoardDeleteProAction2 implements Action2 {

	public ActionForward2 execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{	 

		ActionForward2 forward = null;
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		String nowPage = request.getParameter("page");
		BoardDeleteProService2 boardDeleteProService = new BoardDeleteProService2();
		boolean isArticleWriter =boardDeleteProService.isArticleWriter(board_num, request.getParameter("BOARD_PASS"));

		if(!isArticleWriter){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제할 권한이 없습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}

		else{
			
			boolean isDeleteSuccess = boardDeleteProService.removeArticle(board_num);

			if(!isDeleteSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('삭제실패');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
			else{
				forward = new ActionForward2();
				forward.setRedirect(true);
				forward.setPath("boardList.boa?page=" + nowPage);
			}
			
		}


		return forward;
	}

}