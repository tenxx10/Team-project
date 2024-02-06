package board.action;

import javax.servlet.http.*;
import board.model.ActionForward2;

public interface Action2{
	public ActionForward2 execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
