package solo.common.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/ckeditor")
public class EditorController {
	
Logger log = Logger.getLogger(this.getClass());
	
	@ResponseBody
	@RequestMapping("fileupload.do")
	public void imageUpload(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam MultipartFile upload)
	throws Exception{
		//http header ����
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//http body
		//���ε��� ���� �̸�
		String fileName=upload.getOriginalFilename();
		//����Ʈ �迭�� ��ȯ
		byte[] bytes=upload.getBytes();
		//�̹����� ���ε��� ���丮(���� ��η� ����)
		String uploadPath = request.getSession().getServletContext().getRealPath("/")+"/img/goods_upload/";
		//���������� �ڿ��� ���� �����Ǿ���Ѵ�
		//������ �����
		OutputStream out=new FileOutputStream(new File(uploadPath + fileName)); //java.io		
		
		//���ǿ� �����̸� �ø���
		request.getSession().setAttribute("GOODS_IMG_THUM", fileName);
		System.out.println("�����̸� : " + fileName);
		
		out.write(bytes);
		String callback=request.getParameter("CKEditorFuncNum");
		PrintWriter printWriter=response.getWriter();
		String fileUrl
			=request.getContextPath()+"/img/goods_upload/"+fileName;
		System.out.println("fileUrl:"+fileUrl);
		printWriter.println(
				"<script>window.parent.CKEDITOR.tools.callFunction("
				+ callback+",'"+fileUrl+"','�̹����� ���ε�Ǿ����ϴ�.')"
				+ "</script>");
		//��Ʈ�� �ݱ�
		printWriter.flush();	
	}
}