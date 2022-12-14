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
import com.spring.myweb.VO.MyMannerVO.MyMannerVO;
import com.spring.myweb.VO.OneOnOneVO.OneOnOneVO;
import com.spring.myweb.VO.PageVO.PageVO;
import com.spring.myweb.VO.PhotoVO.PhotoVO;
import com.spring.myweb.VO.PostVO.PostVO;
import com.spring.myweb.VO.ReportVO.ReportVO;
import com.spring.myweb.VO.UserVO.UserVO;
import com.spring.myweb.VO.WithdrawalVO.WithdrawalVO;

@Repository
public class PostDAOImpl implements PostDAO {

	@Inject
	private SqlSession session;

	private AmazonS3 amazonS3;
	private Regions clientRegion = Regions.AP_NORTHEAST_2;

	@Value("#{s3['cloud.aws.s3.bucket']}")
	private String bucket;

	private PostDAOImpl(@Value("#{s3['cloud.aws.credentials.access-key']}") String accessKey,
			@Value("#{s3['cloud.aws.credentials.secret-key']}") String sercretKey) {
		createS3Client(accessKey, sercretKey);
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
	public int count(PageVO vo) throws Exception {
		return session.selectOne("userDB.count", vo);
	}

	@Override
	public List<PostVO> listPage(PageVO vo) throws Exception {
		return session.selectList("userDB.listPage", vo);
	}

	@Override
	public void updatePost(PostVO vo) {
		session.update("userDB.updatePost", vo);

	}
	// ????????? ?????? ??????

	@Override
	public Map<String, String> uploadImg(List<MultipartFile> img, String place) {

		Map<String, String> fileNameList = new HashMap<>();
		
		if( img != null) {
			img.forEach(file -> {
				String orgName = file.getOriginalFilename();
				String fileName = createFileName(orgName);
				ObjectMetadata objectMetadata = new ObjectMetadata();
				objectMetadata.setContentLength(file.getSize());
				objectMetadata.setContentType(file.getContentType());
	
				try (InputStream inputStream = file.getInputStream()) {
					amazonS3.putObject(new PutObjectRequest(bucket, place + fileName, inputStream, objectMetadata)
							.withCannedAcl(CannedAccessControlList.PublicRead));
				} catch (IOException e) {
					throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR, "?????? ???????????? ??????????????????.");
				}
	
				fileNameList.put(orgName, fileName);
			});
		}
		System.out.println("????????? ????????? ??????");

		return fileNameList;
	}

	private String createFileName(String fileName) {
		return UUID.randomUUID().toString().concat(getFileExtension(fileName));
	}

	private String getFileExtension(String fileName) {
		try {
			return fileName.substring(fileName.lastIndexOf("."));
		} catch (StringIndexOutOfBoundsException e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "????????? ????????? ??????(" + fileName + ") ?????????.");
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

	// ????????? ?????? DAOImpl
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
		return session.selectOne("userDB.countCate", category_seq);
	}

	@Override
	public int myCount(PageVO vo) throws Exception {
		return session.selectOne("userDB.myCount", vo);
	}
	public int updatePayPost(PostVO vo) {
		return session.update("userDB.updatePayPost",vo);
	}

	@Override
	public int updatePayStatus(PostVO vo) {
		return session.update("userDB.updatePayStatus",vo);
	}

	@Override
	public int insertPPKPay(HashMap<String, Object> vo) {
		return session.insert("userDB.insertPPKPay",vo);
	}

	@Override
	public List<PostVO> myPageList(PageVO vo) throws Exception {
		
		return session.selectList("userDB.myPageList", vo);
	}

	@Override
	public int allLike(LikeVO vo) {
		return session.selectOne("userDB.allLike", vo);
	}

	@Override
	public int jjimCart(LikeVO vo) {
		return session.selectOne("userDB.jjimCart", vo);
	}

	@Override
	public List<PostVO> jjimList(PageVO vo) throws Exception {
		List<PostVO> jjimList = session.selectList("userDB.jjimList", vo);
		return jjimList;
	}

	@Override
	public void jjimDelete(LikeVO vo) {
		session.delete("userDB.jjimDelete", vo);
	}

	@Override
	public int postReport(ReportVO vo) {
		return session.insert("userDB.postReport", vo);
	}

	@Override
	public List<ReportVO> reportStatus(ReportVO vo) {
		return session.selectList("userDB.reportStatus",vo);
	}


	@Override
	public int repNo(ReportVO vo) throws Exception {
		return session.update("userDB.repNo", vo);
	}
	
	@Override
	public List<MyMannerVO> reviewList(int user_seq) throws Exception {
		return session.selectList("userDB.reviewList" , user_seq);
	}

	@Override
	public int reviewCount(int user_seq) {
		return session.selectOne("userDB.reviewCount", user_seq);
	}

	@Override
	public ReportVO reportReason(HashMap<String, Object> info) {
		return session.selectOne("userDB.reportReason",info);
	}

	@Override
	public int updateSellProduct(int post_seq) {
		return session.update("userDB.updateSellProduct", post_seq);
	}
	
	public int oneOnInsert(OneOnOneVO vo) throws Exception {
		return session.insert("userDB.oneOnInsert", vo);
	}

	@Override
	public String findReviewer(int post_seq) throws Exception {
		return session.selectOne("userDB.findReviewer", post_seq);
	}

	@Override
	public String Reviewer(int user_seq) throws Exception {
		return session.selectOne("userDB.Reviewer", user_seq);
	}

	@Override
	public void upPost(int post_seq) {
		session.update("userDB.upPost",post_seq);
	}

	@Override
	public List<Integer> related(int category_seq) throws Exception {
		return session.selectList("userDB.related", category_seq);
	}

	@Override
	public int withdrawalPost(int user_seq) {
		int result = 0;
		if(session.selectOne("userDB.withdrawalPost", user_seq) == null) {
			result = 1;
		}
		return result;
	}

	@Override
	public void postWithdrawal(int user_seq) throws Exception {
		session.delete("userDB.postWithdrawal", user_seq);
	}

	@Override
	public void likeWithdrawal(int user_seq) throws Exception {
		session.delete("userDB.likeWithdrawal", user_seq);
	}

	@Override
	public void boardWithdrawal(int user_seq) throws Exception {
		session.delete("userDB.boardWithdrawal", user_seq);
		
	}


}
