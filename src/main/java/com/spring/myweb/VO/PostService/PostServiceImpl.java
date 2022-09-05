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

}
