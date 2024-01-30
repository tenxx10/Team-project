package board.svc;

import static board.action.JdbcUtil2.close;
import static board.action.JdbcUtil2.commit;
import static board.action.JdbcUtil2.getConnection;
import static board.action.JdbcUtil2.rollback;
import java.sql.Connection;
import board.action.BoardDAO2;

public class BoardDeleteProService2 {

	public boolean isArticleWriter(int board_num, String pass) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isArticleWriter = false;
		Connection con = getConnection();
		BoardDAO2 boardDAO = BoardDAO2.getInstance();
		boardDAO.setConnection(con);
		isArticleWriter = boardDAO.isArticleBoardWriter(board_num, pass);
		close(con);
		return isArticleWriter;
		
	}

	public boolean removeArticle(int board_num) throws Exception{
		// TODO Auto-generated method stub
		
		boolean isRemoveSuccess = false;
		Connection con = getConnection();
		BoardDAO2 boardDAO = BoardDAO2.getInstance();
		boardDAO.setConnection(con);
		int deleteCount = boardDAO.deleteArticle(board_num);
		
		if(deleteCount > 0){
			commit(con);
			isRemoveSuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isRemoveSuccess;
	}

}
