package board.svc;

import java.sql.Connection;
import board.action.BoardDAO2;
import board.model.BoardBean2;
import static board.action.JdbcUtil2.*;

public class BoardDetailService2 {

	public BoardBean2 getArticle(int board_num) throws Exception{
		// TODO Auto-generated method stub
		
		BoardBean2 article = null;
		Connection con = getConnection();
		BoardDAO2 boardDAO = BoardDAO2.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.updateReadCount(board_num);
		
		if(updateCount > 0){
			commit(con);
		}
		else{
			rollback(con);
		}
		
		article = boardDAO.selectArticle(board_num);
		close(con);
		return article;
		
	}

}
