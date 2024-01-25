package notice.action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import notice.svc.BoardListService;
import notice.model.ActionForward;
import notice.model.BoardBean;
import notice.model.PageInfo;

public class BoardListAction implements Action {

    private static final int ITEMS_PER_PAGE = 10;

    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        ArrayList<BoardBean> articleList = new ArrayList<>();
        int page = 1;

        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                page = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                // 유효하지 않은 페이지 번호에 대한 예외 처리
                e.printStackTrace(); // 혹은 로깅
                // 기본값으로 설정하거나 예외 처리에 따른 처리를 추가할 수 있음
                page = 1;
            }
        }

        BoardListService boardListService = new BoardListService();
        int listCount = boardListService.getListCount();
        articleList = boardListService.getArticleList(page, ITEMS_PER_PAGE);

        int maxPage = (int) Math.ceil((double) listCount / ITEMS_PER_PAGE);
        int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
        int endPage = startPage + 10 - 1;

        if (endPage > maxPage) {
            endPage = maxPage;
        }

        PageInfo pageInfo = new PageInfo();
        pageInfo.setEndPage(endPage);
        pageInfo.setListCount(listCount);
        pageInfo.setMaxPage(maxPage);
        pageInfo.setPage(page);
        pageInfo.setStartPage(startPage);

        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("articleList", articleList);

        ActionForward forward = new ActionForward();
        forward.setPath("view/noticelist.jsp");
        return forward;
    }
}