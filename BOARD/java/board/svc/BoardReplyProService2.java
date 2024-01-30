package board.svc;

import static board.action.JdbcUtil2.*;
import java.sql.Connection;
import board.action.BoardDAO2;
import board.model.BoardBean2;

public class BoardReplyProService2 {

	public boolean replyArticle(BoardBean2 article) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isReplySuccess = false;
		int insertCount = 0;
		Connection con = getConnection();
		BoardDAO2 boardDAO = BoardDAO2.getInstance();
		boardDAO.setConnection(con);
		insertCount = boardDAO.insertReplyArticle(article);
		
		if(insertCount > 0){
			commit(con);
			isReplySuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isReplySuccess;
		
	}

}
