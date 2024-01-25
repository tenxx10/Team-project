package notice.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.ActionForward;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

public class FileDownloadAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String downFile = request.getParameter("BOARD_FILE");

        // 실제 파일이 저장된 경로 설정
        String savePath = "파일의 실제 경로를 여기에 입력하세요";  // 예: "C:/uploads"

        String filePath = savePath + "/" + downFile;
        String realFile = downFile.substring(downFile.indexOf("_") + 1);

        response.setContentType("application/octet-stream");
        response.setContentLength((int) new File(filePath).length());
        response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(realFile, "UTF-8"));

        try (FileInputStream fis = new FileInputStream(filePath);
             OutputStream os = response.getOutputStream()) {

            byte[] buffer = new byte[4096];
            int bytesRead;

            while ((bytesRead = fis.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;  // 다운로드 후 페이지 이동이 필요하지 않으므로 null 반환
    }
}
