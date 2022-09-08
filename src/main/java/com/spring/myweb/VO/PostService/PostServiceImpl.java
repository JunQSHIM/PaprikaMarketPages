package com.spring.myweb.VO.PostService;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.myweb.DAO.PostDAO.PostDAO;
import com.spring.myweb.VO.CategoryVO.CategoryVO;
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

}
