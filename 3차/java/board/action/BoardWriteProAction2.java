package board.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.NoSuchElementException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import board.svc.BoardWriteProService2;
import board.model.ActionForward2;
import board.model.BoardBean2;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardWriteProAction2 implements Action2 {

	public ActionForward2 execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		ActionForward2 forward=null;
		BoardBean2 boardBean = null;
		String saveFolder="/boardUpload2";
		String realFolder="";
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);   	
		
		// 저장 폴더가 존재하지 않으면 폴더 생성
		File folder = new File(realFolder);
		if (!folder.exists()) {
		    folder.mkdirs();
		}
		
		MultipartRequest multi=new MultipartRequest(
				request,
				realFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		// boadBean 초기화 후에 이미지 업로드 확인 로그 추가
		boardBean = new BoardBean2();
		boardBean.setBOARD_NAME(multi.getParameter("BOARD_NAME"));
		boardBean.setBOARD_PASS(multi.getParameter("BOARD_PASS"));
		boardBean.setBOARD_SUBJECT(multi.getParameter("BOARD_SUBJECT"));
		boardBean.setBOARD_CONTENT(multi.getParameter("BOARD_CONTENT"));
		
		// 이미지 업로드가 정상적으로 되었는지 확인하는 로그
		try {
		    boardBean.setBOARD_FILE(
		        multi.getOriginalFileName((String) multi.getFileNames().nextElement())
		    );
		    System.out.println("File saved: " + boardBean.getBOARD_FILE());
		} catch (NoSuchElementException e) {
		    System.out.println("No file uploaded.");
		}
        System.out.println("Image uploaded to: " + realFolder);
		
		
		try {
            if (boardBean != null) {
                // BoardWriteProService를 이용하여 글 등록 로직을 처리
                BoardWriteProService2 boardWriteProService = new BoardWriteProService2();
                boolean isWriteSuccess = boardWriteProService.registArticle(boardBean);

                // 등록 결과에 따라서 페이지 전환 처리
                if (!isWriteSuccess) {
                    response.setContentType("text/html;charset=UTF-8");
                    PrintWriter out = response.getWriter();
                    out.println("<script>");
                    out.println("alert('등록실패')");
                    out.println("history.back();");
                    out.println("</script>");
                } else {
                    forward = new ActionForward2();
                    forward.setRedirect(true);
                    forward.setPath("boardList.boa");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return forward;
    }
}