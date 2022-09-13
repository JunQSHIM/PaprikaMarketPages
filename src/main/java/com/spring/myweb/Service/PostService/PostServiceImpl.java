package com.spring.myweb.Service.PostService;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.myweb.DAO.PostDAO.PostDAO;
import com.spring.myweb.VO.CategoryVO.CategoryVO;
import com.spring.myweb.VO.PhotoVO.PhotoVO;
import com.spring.myweb.VO.PostVO.PostVO;

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
	public int count() throws Exception {
		return postDao.count();
	}

	@Override
	public List<PostVO> listPage(int displayPost, int postNum) throws Exception {
		return postDao.listPage(displayPost, postNum);
	}
	
	@Override
	public void updatePost(PostVO vo) {
		postDao.updatePost(vo);
		
	}
	
	@Override
	public Map<String, String> uploadImg(List<MultipartFile> img) {
		return postDao.uploadImg(img);
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
	
}
