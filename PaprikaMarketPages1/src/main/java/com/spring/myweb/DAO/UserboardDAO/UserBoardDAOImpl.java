package com.spring.myweb.DAO.UserboardDAO;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.spring.myweb.VO.CategoryVO.CategoryVO;
import com.spring.myweb.VO.PageVO.UserBoardPageVO;
import com.spring.myweb.VO.PhotoVO.PhotoVO;
import com.spring.myweb.VO.UserBoardVO.UserBoardVO;

@Repository
public class UserBoardDAOImpl implements UserBoardDAO {
	
	private AmazonS3 amazonS3;
	private Regions clientRegion = Regions.AP_NORTHEAST_2;
	
	@Value("#{s3['cloud.aws.s3.bucket']}")
	private String bucket;

	private UserBoardDAOImpl(@Value("#{s3['cloud.aws.credentials.access-key']}")String accessKey, @Value("#{s3['cloud.aws.credentials.secret-key']}")String sercretKey) {
		createS3Client(accessKey,sercretKey);
	}

	private void createS3Client(String accessKey, String sercretKey) {
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, sercretKey);
		this.amazonS3 = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(credentials))
				.withRegion(clientRegion).build();

	}
	
	@Inject
	private SqlSession session;

	@Override
	public List<UserBoardVO> boardList() {
		List<UserBoardVO> sellList=session.selectList("userDB.boardList");
		return sellList;
	}

	@Override
	public int insertBoard(UserBoardVO vo) {
		int success = 0;
		session.insert("userDB.insertboard", vo);
		return success;
	}

	@Override
	public UserBoardVO boardDetail(int board_seq) {
		UserBoardVO detail = session.selectOne("userDB.boardDetail", board_seq);
		return detail;
	}

	@Override
	public void deleteBoard(int board_seq) {
		List<String> name = session.selectList("userDB.selectDeleteBoard", board_seq);
		for (String fileName : name) {
			amazonS3.deleteObject(new DeleteObjectRequest(this.bucket, fileName));
		}
		session.delete("userDB.boardDelete", board_seq); 
	}

	@Override
	public void viewCount(int prod_seq) {
		session.update("userDB.viewCount",prod_seq);
	}

	@Override
	public List<CategoryVO> categoryList() {
		List<CategoryVO> cList = session.selectList("userDB.categoryList");
		return cList;
	}

	@Override
	public int board_seq(int user_seq) {
		return session.selectOne("userDB.selectBoardNew", user_seq);
	}

	@Override
	public int count(int user_seq) throws Exception {
		return session.selectOne("userDB.countBoard", user_seq);
	}
	
	@Override
	public List<UserBoardVO> listPage(UserBoardPageVO vo) throws Exception {
		return session.selectList("userDB.listBoardPage", vo);
	}
	
	@Override
	public List<String> photoDetail(int board_seq) {
		List<String> names = session.selectList("userDB.selectboardPhoto", board_seq);
		List<String> photoNames = new ArrayList<String>();

		for (String name : names) {
			photoNames.add(name);
		}
		return photoNames;
	}

	@Override
	public String photoOne(int board_seq) {
		String name = session.selectOne("userDB.selectOnePhotoBoard", board_seq);
		return name;
	}

	@Override
	public void insertPhoto(PhotoVO photo) {
		session.selectList("userDB.insertboardPhoto", photo);
	}

	@Override
	public String findNickname(int user_seq) {
		return session.selectOne("userDB.findNickName", user_seq);
	}

	@Override
	public void deleteImage(int board_seq) {
		List<String> name = session.selectList("userDB.selectDeleteBoard", board_seq);
		for (String fileName : name) {
			amazonS3.deleteObject(new DeleteObjectRequest(this.bucket, fileName));
		}
		session.delete("userDB.deletePhotoBoard", board_seq);
	}

	@Override
	public void updateBoard(UserBoardVO vo) {
		session.update("userDB.updateBoard", vo);
		
	}
}
