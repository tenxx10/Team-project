package board.svc;

import java.sql.Connection;
import board.action.BoardDAO2;
import board.model.BoardBean2;
import static board.action.JdbcUtil2.*;


public class BoardWriteProService2 {

	public boolean registArticle(BoardBean2 boardBean) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isWriteSuccess = false;
		Connection con = getConnection();
		BoardDAO2 boardDAO = BoardDAO2.getInstance();
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
