package fileupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class FileUtil {
	// 파일 업로드(multipart / form-data 요청) 처리
	public static MultipartRequest uploadFile(HttpServletRequest req, String saveDirectory, int maxPostSize) {
		try {
			// 업로드 진행
			return new MultipartRequest(req, saveDirectory, maxPostSize, "UTF-8");
		} catch (Exception e) {
			// 업로드 실패
			e.printStackTrace();
			return null;
		}
	}

	public static void download(HttpServletRequest req, HttpServletResponse resp, String directory, String sFileName,
			String oFilename) {
		String sDirectory = req.getServletContext().getRealPath(directory);
		try {
			// 파일을 찾아 입력 스트림 생성
			File file = new File(sDirectory, sFileName);
			InputStream iStream = new FileInputStream(file);

			// 한글 파일명 깨짐 방지
			String client = req.getHeader("User-Agent");
			if (client.indexOf("WOW64") == -1) {
				oFilename = new String(oFilename.getBytes("UTF-8"), "ISO-8859-1");
			} else {
				oFilename = new String(oFilename.getBytes("KSC5601"), "ISO-8859-1");
			}
			resp.reset();
			resp.setContentType("application/octet/stream");
			resp.setHeader("Content-Disposition", "attachment; filename=\"" + oFilename + "\"");
			resp.setHeader("Content-Length", "" + file.length());

			// out.clear();

			OutputStream oStream = resp.getOutputStream();
			byte b[] = new byte[(int) file.length()];
			int readBuffer = 0;
			while ((readBuffer = iStream.read(b)) > 0) {
				oStream.write(b, 0, readBuffer);
			}
			iStream.close();
			oStream.close();
		} catch (FileNotFoundException e) {
			System.out.println("파일을 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("예외가 발생하였습니다.");
			e.printStackTrace();
		}
	}

	public static void deleteFile(HttpServletRequest req, String directory, String fileName) {
		String sDirectory = req.getServletContext().getRealPath(directory);
		File file = new File(sDirectory + File.separator + fileName);
		if (file.exists()) {
			file.delete();
		}
	}
}
