package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.action.Action2;
import board.action.BoardDeleteProAction2;
import board.action.BoardDetailAction2;
import board.action.BoardListAction2;
import board.action.BoardModifyFormAction2;
import board.action.BoardModifyProAction2;
import board.action.BoardReplyFormAction2;
import board.action.BoardReplyProAction2;
import board.action.BoardWriteProAction2;
import board.model.ActionForward2;

/**
 * Servlet implementation class BoardControll
 */
@WebServlet("*.boa")
public class BoardFrontController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward2 forward=null;
		Action2 action=null;

		if(command.equals("/boardWriteForm.boa")){
			forward=new ActionForward2();
			forward.setPath("view/boardwrite.jsp");
		}else if(command.equals("/boardWritePro.boa")){
			action  = new BoardWriteProAction2();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardList.boa")){
			action = new BoardListAction2();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardDetail.boa")){
			action = new BoardDetailAction2();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardReplyForm.boa")){
			action = new BoardReplyFormAction2();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardReplyPro.boa")){
			action = new BoardReplyProAction2();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardModifyForm.boa")){
			action = new BoardModifyFormAction2();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/boardModifyPro.boa")){
			action = new BoardModifyProAction2();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/boardDeleteForm.boa")){
			String nowPage = request.getParameter("page");
			request.setAttribute("page", nowPage);
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			request.setAttribute("board_num",board_num);
			forward=new ActionForward2();
			forward.setPath("view/boarddelete.jsp");
		}
		else if(command.equals("/boardDeletePro.boa")){
			action = new BoardDeleteProAction2();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}   
	
}