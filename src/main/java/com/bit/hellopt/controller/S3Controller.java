package com.bit.hellopt.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.hellopt.commons.utils.S3Utils;

@Controller
public class S3Controller {
	
	@Autowired
	S3Utils s3Utils;
	
	@GetMapping("/s3/{path}/{key:.+}")
	public void getS3Image(HttpServletResponse response, 
			@PathVariable String path, @PathVariable String key) {
		try {
			File file = s3Utils.fileDownload(path +"/", key);
			FileInputStream fis;
			fis = new FileInputStream(file);
			response.setContentType(MediaType.IMAGE_JPEG_VALUE);
			IOUtils.copy(fis, response.getOutputStream());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
