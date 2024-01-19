package notice.svc_book;

import java.sql.Connection;
import notice.action_book.BoardDAO;
import vaccine.model_book.BoardBean;
import static notice.action_book.JdbcUtil.*;

public class BoardDetailService {

	public BoardBean getArticle(int board_num) throws Exception{
		// TODO Auto-generated method stub
		
		BoardBean article = null;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
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
