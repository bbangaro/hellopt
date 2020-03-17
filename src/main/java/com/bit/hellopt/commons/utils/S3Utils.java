package com.bit.hellopt.commons.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;

@Service
public class S3Utils {
	
	// buketName
	private String bucketName = "hellopt-s3-storage";
	
	private AmazonS3 s3;
	
	public S3Utils() {
		this.s3 = AmazonS3ClientBuilder.standard()
				.withRegion(Regions.AP_NORTHEAST_2)
				.withCredentials(new ProfileCredentialsProvider())
				.build();
	}
	
	public void multipartUpload(String path, String key, MultipartFile multipartFile) {
		File file = new File(multipartFile.getOriginalFilename());
		try {
			multipartFile.transferTo(file);
			s3.putObject(this.bucketName, path + key, file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch(AmazonServiceException e) {
			System.out.println(e);
		}
		System.out.println("Amazon S3 MultipartFile upload Done!");
	}
	
	public void fileUpload(String path, String key, File file) {
		try {
			s3.putObject(this.bucketName, path + key, file);
		} catch(AmazonServiceException e) {
			System.out.println(e);
		}
		System.out.println("Amazon S3 File upload Done!");
	}
	
	public File fileDownload(String path, String key) {
		try {
			File file = new File(key);
			S3Object s3obj = s3.getObject(bucketName, path + key);
			S3ObjectInputStream s3is = s3obj.getObjectContent();
			FileOutputStream fos = new FileOutputStream(file);
			byte[] read_buf = new byte[1024];
			int read_len = 0;
			while((read_len = s3is.read(read_buf)) > 0) {
				fos.write(read_buf, 0, read_len);
			}
			s3is.close();
			fos.close();
			return file;
		} catch(AmazonServiceException e) {
			System.out.println(e.getErrorMessage());
		} catch(FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch(IOException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
}
