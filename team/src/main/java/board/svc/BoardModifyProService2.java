package board.svc;

import static board.action.JdbcUtil2.*;
import java.sql.Connection;
import board.model.BoardBean2;
import board.action.BoardDAO2;

public class BoardModifyProService2 {

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

	public boolean modifyArticle(BoardBean2 article) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isModifySuccess = false;
		Connection con = getConnection();
		BoardDAO2 boardDAO = BoardDAO2.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.updateArticle(article);
		
		if(updateCount > 0){
			commit(con);
			isModifySuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
		
	}

}
