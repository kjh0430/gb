package com.crm.gb.client.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.crm.gb.client.model.vo.ClientFile;

@Component("clientFileDown")
public class ClientFileDownController extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// controller 에서 뷰리졸버로 리턴된 model 정보 자동 전달됨
		System.out.println("filedown run...");

		File file = (File) model.get("clientFile");
		File oriFile = (File)model.get("oriName");
		
		System.out.println("file.getPath() : " + file.getPath());
		System.out.println("file.getName() : " + file.getName());
		System.out.println("file.getName() : " + oriFile.getName());
		
//		String fileName = file.getName();
		String fileName = oriFile.getName();
		
		response.setContentType("text/plain; charset=UTF-8");
		// 한글 파일명 인코딩 처리함
		response.addHeader("Content-Disposition",
				"attachment; filename=\"" + 
		  new String(fileName.getBytes("UTF-8"), "ISO-8859-1") 
		  + "\"");
		response.setContentLength((int) file.length());

		OutputStream out = response.getOutputStream();
		FileInputStream fin = null;

		try {
			fin = new FileInputStream(file);
			FileCopyUtils.copy(fin, out);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fin != null) {
				try {
					fin.close();
				} catch (Exception e) {
				}
			}
		} // try end;

		out.flush();
		out.close();

	}

}
