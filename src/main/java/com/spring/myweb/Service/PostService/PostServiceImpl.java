package com.spring.myweb.Service.PostService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.myweb.DAO.PostDAO.PostDAO;
import com.spring.myweb.VO.CategoryVO.CategoryVO;
import com.spring.myweb.VO.LikeVO.LikeVO;
import com.spring.myweb.VO.MyMannerVO.MyMannerVO;
import com.spring.myweb.VO.PageVO.PageVO;
import com.spring.myweb.VO.PhotoVO.PhotoVO;
import com.spring.myweb.VO.PostVO.PostVO;
import com.spring.myweb.VO.ReportVO.ReportVO;
import com.spring.myweb.VO.UserVO.UserVO;

@Service
public class PostServiceImpl implements PostService {

	@Inject
	private PostDAO postDao;

	@Override
	public int insertPost(PostVO vo) {
		return postDao.insertPost(vo);
	}

	@Override
	public List<PostVO> postList() {
		return postDao.postList();
	}

	@Override
	public List<CategoryVO> categoryList() {
		return postDao.categoryList();
	}

	@Override
	public void postDelete(int post_seq) {
		postDao.postDelete(post_seq);

	}

	@Override
	public PostVO postDetail(int post_seq) {
		return postDao.postDetail(post_seq);
	}

	@Override
	public List<String> photoDetail(int post_seq) {
		return postDao.photoDetail(post_seq);
	}

	@Override
	public String photoOne(int post_seq) {
		return postDao.photoOne(post_seq);
	}

	@Override
	public void viewCount(int post_seq) {
		postDao.viewCount(post_seq);
	}

	@Override
	public List<PostVO> categoryDetail(int category_seq) {

		return postDao.categoryDetail(category_seq);
	}

	@Override
	public CategoryVO categoryName(int category_seq) {
		return postDao.categoryName(category_seq);
	}

	@Override
	public int count(PageVO vo) throws Exception {
		return postDao.count(vo);
	}

	@Override
	public List<PostVO> listPage(PageVO vo) throws Exception {
		return postDao.listPage(vo);
	}

	@Override
	public void updatePost(PostVO vo) {
		postDao.updatePost(vo);

	}

	@Override
	public Map<String, String> uploadImg(List<MultipartFile> img, String place) {
		return postDao.uploadImg(img, place);
	}

	@Override
	public int post_seq(int user_seq) {
		return postDao.post_seq(user_seq);
	}

	@Override
	public void insertPhoto(PhotoVO vo) {
		postDao.insertPhoto(vo);
	}

	@Override
	public void deleteImage(int post_seq) {
		postDao.deleteImage(post_seq);
	}

	// 좋아요
	@Override
	public int likeCount(LikeVO vo) {
		return postDao.likeCount(vo);
	}

	@Override
	public int likeGetInfo(LikeVO vo) {
		return postDao.likeGetInfo(vo);
	}

	@Override
	public void likeinsert(LikeVO vo) {
		postDao.likeinsert(vo);

	}

	@Override
	public void likeupdate(LikeVO vo) {
		System.out.println(vo);
		postDao.likeupdate(vo);
	}

	@Override
	public List<PostVO> catePage(int displayPost, int postNum, int category_seq) throws Exception {
		return postDao.catePage(displayPost, postNum, category_seq);
	}

	@Override
	public int countCate(int category_seq) throws Exception {
		return postDao.countCate(category_seq);
	}

	@Override
	public int myCount(PageVO vo) throws Exception {
		return postDao.myCount(vo);
	}

	@Override
	public List<PostVO> myPageList(PageVO vo) throws Exception {
		return postDao.myPageList(vo);
	}
	@Override
	public int updatePayPost(PostVO vo) {
		return postDao.updatePayPost(vo);
	}

	@Override
	public int updatePayStatus(PostVO vo) {
		return postDao.updatePayStatus(vo);
	}

	@Override
	public int insertPPKPay(HashMap<String, Object> vo) {
		return postDao.insertPPKPay(vo);
	}

	@Override
	public int allLike(LikeVO vo) {
		return postDao.allLike(vo);
	}

	@Override
	public int jjimCart(LikeVO vo) {
		return postDao.jjimCart(vo);
	}

	@Override
	public List<PostVO> jjimList(PageVO vo) throws Exception {
		return postDao.jjimList(vo);
	}

	@Override
	public void jjimDelete(LikeVO vo) {
		postDao.jjimDelete(vo);
		
	}

	@Override
	public int postReport(ReportVO vo) {
		return postDao.postReport(vo);
	}

	@Override
	public List<ReportVO> reportStatus(ReportVO vo) {
		return postDao.reportStatus(vo);
	}

	@Override
	public void withdrawalPost(int user_seq) {
		postDao.withdrawalPost(user_seq);
	}
	
	@Override
	public int repNo(ReportVO vo) throws Exception {
		return postDao.repNo(vo);
	}
	
	@Override
	public List<MyMannerVO> reviewList(int user_seq) throws Exception {
		return postDao.reviewList(user_seq);
	}

	@Override
	public int reviewCount(int user_seq) {
		return postDao.reviewCount(user_seq);
	}

}
