package com.spring.myweb.DAO.PostDAO;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.spring.myweb.VO.CategoryVO.CategoryVO;
import com.spring.myweb.VO.LikeVO.LikeVO;
import com.spring.myweb.VO.PhotoVO.PhotoVO;
import com.spring.myweb.VO.PostVO.PostVO;

@Repository
public class PostDAOImpl implements PostDAO {

	@Inject
	private SqlSession session;

	private AmazonS3 amazonS3;
	private Regions clientRegion = Regions.AP_NORTHEAST_2;
	
	@Value("#{s3['cloud.aws.s3.bucket']}")
	private String bucket;

	private PostDAOImpl(@Value("#{s3['cloud.aws.credentials.access-key']}")String accessKey, @Value("#{s3['cloud.aws.credentials.secret-key']}")String sercretKey) {
		createS3Client(accessKey,sercretKey);
	}

	private void createS3Client(String accessKey, String sercretKey) {
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, sercretKey);
		this.amazonS3 = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(credentials))
				.withRegion(clientRegion).build();

	}

	@Override
	public int insertPost(PostVO vo) {
		int success = 0;
		session.insert("userDB.post", vo);
		return success;
	}

	@Override
	public List<PostVO> postList() {
		List<PostVO> postList = session.selectList("userDB.postList");
		return postList;
	}

	@Override
	public List<CategoryVO> categoryList() {
		List<CategoryVO> cList = session.selectList("userDB.categoryList");
		return cList;
	}

	@Override
	public void postDelete(int post_seq) {
		session.delete("userDB.postDelete", post_seq);
	}

	@Override
	public void deleteImage(int post_seq) {
		List<String> name = session.selectList("userDB.selectDelete", post_seq);
		for (String fileName : name) {
			amazonS3.deleteObject(new DeleteObjectRequest(this.bucket, fileName));
		}
		session.delete("userDB.deletePhoto", post_seq);
	}

	@Override
	public PostVO postDetail(int post_seq) {
		PostVO detail = session.selectOne("userDB.postDetail", post_seq);
		return detail;
	}

	@Override
	public List<String> photoDetail(int post_seq) {
		List<String> names = session.selectList("userDB.selectPhoto", post_seq);
		List<String> photoNames = new ArrayList<String>();

		for (String name : names) {
			photoNames.add(name);
		}
		return photoNames;
	}

	@Override
	public String photoOne(int post_seq) {
		String name = session.selectOne("userDB.selectOnePhoto", post_seq);
		return name;
	}

	@Override
	public void viewCount(int post_seq) {
		session.update("userDB.viewCount", post_seq);
	}

	@Override
	public List<PostVO> categoryDetail(int category_seq) {
		List<PostVO> vDetail = session.selectList("userDB.categoryDetail", category_seq);
		return vDetail;
	}

	@Override
	public CategoryVO categoryName(int category_seq) {
		CategoryVO detail = session.selectOne("userDB.categoryName", category_seq);
		return detail;
	}

	@Override
	public int count() throws Exception {
		return session.selectOne("userDB.count");
	}

	@Override
	public List<PostVO> listPage(int displayPost, int postNum) throws Exception {
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		return session.selectList("userDB.listPage", data);
	}

	@Override
	public void updatePost(PostVO vo) {
		session.update("userDB.updatePost", vo);

	}
	// 이미지 다수 등록

	@Override
	public Map<String, String> uploadImg(List<MultipartFile> img, String place) {

		Map<String, String> fileNameList = new HashMap<>();

		img.forEach(file -> {
			String orgName = file.getOriginalFilename();
			String fileName = createFileName(orgName);
			ObjectMetadata objectMetadata = new ObjectMetadata();
			objectMetadata.setContentLength(file.getSize());
			objectMetadata.setContentType(file.getContentType());

			try (InputStream inputStream = file.getInputStream()) {
				amazonS3.putObject(new PutObjectRequest(bucket, place+fileName, inputStream, objectMetadata)
						.withCannedAcl(CannedAccessControlList.PublicRead));
			} catch (IOException e) {
				throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "파일 업로드에 실패했습니다.");
			}

			fileNameList.put(orgName, fileName);
		});

		System.out.println("이미지 업로드 완료");

		return fileNameList;
	}

	private String createFileName(String fileName) {
		return UUID.randomUUID().toString().concat(getFileExtension(fileName));
	}

	private String getFileExtension(String fileName) {
		try {
			return fileName.substring(fileName.lastIndexOf("."));
		} catch (StringIndexOutOfBoundsException e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "잘못된 형식의 파일(" + fileName + ") 입니다.");
		}
	}

	@Override
	public int post_seq(int user_seq) {
		return session.selectOne("userDB.selectPostUser", user_seq);
	}

	@Override
	public void insertPhoto(PhotoVO vo) {
		session.selectList("userDB.insertPhoto", vo);
	}

	// 좋아요 관련 DAOImpl
	@Override
	public int likeCount(LikeVO vo) {
		return session.selectOne("userDB.likeCount", vo);
	}

	@Override
	public int likeGetInfo(LikeVO vo) {
		return session.selectOne("userDB.likeGetInfo", vo);
	}

	@Override
	public void likeinsert(LikeVO vo) {
		session.insert("userDB.likeInsert", vo);

	}

	@Override
	public void likeupdate(LikeVO vo) {
		session.update("userDB.likeUpdate", vo);
	}

	@Override
	public List<PostVO> catePage(int displayPost, int postNum, int category_seq) throws Exception {
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("category_seq", category_seq);
		return session.selectList("userDB.catePage", data);
	}

	@Override
	public int countCate(int category_seq) throws Exception {
		return session.selectOne("userDB.countCate",category_seq);
	}



}
