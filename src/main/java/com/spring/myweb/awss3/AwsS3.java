package com.spring.myweb.awss3;

import java.io.File;
import java.io.InputStream;

import org.springframework.stereotype.Service;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CopyObjectRequest;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Service
public class AwsS3 {
	
	private AmazonS3 s3Client;
	
	final private String accessKey = "AKIAVHPIWTHZMPXQY7WW";
	final private String secretKey = "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";
	private Regions clientRegion = Regions.AP_NORTHEAST_2;
	private String bucket = "paprikaproject";

	private AwsS3() {
		createS3Client();
	}

	static private AwsS3 instance = null;

	public static AwsS3 getinstance() {
		if (instance == null) {
			return new AwsS3();
		} else {
			return instance;
		}
	}

	private void createS3Client() {
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
		this.s3Client = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(credentials))
				.withRegion(clientRegion).build();

	}

	public void upload(File file, String key) {
		uploadToS3(new PutObjectRequest(this.bucket, key, file));
	}
	// MultipartFile을 사용할 경우
	public void upload(InputStream is, String key, String contentType, long contentLength) {
		ObjectMetadata objectMetadata = new ObjectMetadata();
		objectMetadata.setContentType(contentType);
		objectMetadata.setContentLength(contentLength);

		uploadToS3(new PutObjectRequest(this.bucket, key, is, objectMetadata));
	}

	private void uploadToS3(PutObjectRequest putObjectRequest) {
		try {
			this.s3Client.putObject(putObjectRequest);
			System.out.println(String.format("[%s] upload complete", putObjectRequest.getKey()));
		} catch (AmazonServiceException e) {
			e.printStackTrace();
		} catch (SdkClientException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 복사 메서드
	public void copy(String orgkey, String copyKey) {
		try {
			// copy 객체 생성
			CopyObjectRequest copyObjectRequest = new CopyObjectRequest(this.bucket, orgkey, this.bucket, copyKey);

			// copy
			this.s3Client.copyObject(copyObjectRequest);

			System.out.printf(String.format("Finish copying [%s] to [%s]"), orgkey, copyKey);
		} catch (AmazonServiceException e) {
			e.printStackTrace();
		} catch (SdkClientException e) {
			e.printStackTrace();
		}
	}

	// 삭제 메서드
	public void delete(String key) {
		try {
			// Delete 객체 생성
			DeleteObjectRequest deleteObjectRequest = new DeleteObjectRequest(this.bucket, key);

			// Delete
			this.s3Client.deleteObject(deleteObjectRequest);

			System.out.printf(String.format("[%s] delete key"), key);
		} catch (AmazonServiceException e) {
			e.printStackTrace();
		} catch (SdkClientException e) {
			e.printStackTrace();
		}
	}
}
