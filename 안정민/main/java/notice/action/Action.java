package notice.action;

import javax.servlet.http.*;
import notice.model.ActionForward;

public interface Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
