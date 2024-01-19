package notice.svc_book;

import java.sql.Connection;
import notice.action_book.BoardDAO;
import vaccine.model_book.BoardBean;
import static notice.action_book.JdbcUtil.*;
public class BoardWriteProService {

	public boolean registArticle(BoardBean boardBean) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int insertCount = boardDAO.insertArticle(boardBean);
		
		if(insertCount > 0){
			commit(con);
			isWriteSuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isWriteSuccess;
		
	}

}
