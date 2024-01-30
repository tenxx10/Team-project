package board.svc;

import static board.action.JdbcUtil2.*;
import java.sql.Connection;
import java.util.ArrayList;
import board.action.BoardDAO2;
import board.model.BoardBean2;

public class BoardListService2 {

	public int getListCount() throws Exception{
		// TODO Auto-generated method stub
		
		int listCount = 0;
		Connection con = getConnection();
		BoardDAO2 boardDAO = BoardDAO2.getInstance();
		boardDAO.setConnection(con);
		listCount = boardDAO.selectListCount();
		close(con);
		return listCount;
		
	}

	public ArrayList<BoardBean2> getArticleList(int page, int limit) throws Exception{
		
		ArrayList<BoardBean2> articleList = null;
		Connection con = getConnection();
		BoardDAO2 boardDAO = BoardDAO2.getInstance();
		boardDAO.setConnection(con);
		articleList = boardDAO.selectArticleList(page,limit);	
		close(con);
		return articleList;
		
	}

}
