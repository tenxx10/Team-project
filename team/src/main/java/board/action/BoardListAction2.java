package board.action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import board.svc.BoardListService2;
import board.model.ActionForward2;
import board.model.BoardBean2;
import board.model.PageInfo2;

public class BoardListAction2 implements Action2 {

    private static final int ITEMS_PER_PAGE = 10;

    public ActionForward2 execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        ArrayList<BoardBean2> articleList = new ArrayList<>();
        int page = 1;

        if (request.getParameter("page") != null) {
            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException e) {
                // 유효하지 않은 페이지 번호에 대한 예외 처리
                e.printStackTrace(); // 혹은 로깅
                // 기본값으로 설정하거나 예외 처리에 따른 처리를 추가할 수 있음
                page = 1;
            }
        }

        BoardListService2 boardListService = new BoardListService2();
        int listCount = boardListService.getListCount();
        articleList = boardListService.getArticleList(page, ITEMS_PER_PAGE);

        int maxPage = (int) Math.ceil((double) listCount / ITEMS_PER_PAGE);
        int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
        int endPage = startPage + 10 - 1;

        if (endPage > maxPage) {
            endPage = maxPage;
        }

        PageInfo2 pageInfo = new PageInfo2();
        pageInfo.setEndPage(endPage);
        pageInfo.setListCount(listCount);
        pageInfo.setMaxPage(maxPage);
        pageInfo.setPage(page);
        pageInfo.setStartPage(startPage);

        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("articleList", articleList);

        ActionForward2 forward = new ActionForward2();
        forward.setPath("view/boardlist.jsp");
        return forward;
    }
}