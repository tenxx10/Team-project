package notice.action_book;

import javax.servlet.http.*;
import vaccine.model_book.ActionForward;

public interface Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
