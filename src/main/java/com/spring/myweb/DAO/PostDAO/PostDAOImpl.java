package com.spring.myweb.DAO.PostDAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.myweb.VO.CategoryVO.CategoryVO;
import com.spring.myweb.VO.PostVO.PostVO;

@Repository
public class PostDAOImpl implements PostDAO {
	
	@Inject
	private SqlSession session;

	@Override
	public int insertPost(PostVO vo) {
		int success = 0;
		session.insert("userDB.post",vo);
		return success;
	}

	@Override
	public List<PostVO> postList() {
		List<PostVO> postList =session.selectList("userDB.postList");
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
	public PostVO postDetail(int post_seq) {
		PostVO detail = session.selectOne("userDB.postDetail",post_seq);
		return detail;
	}

	@Override
	public void viewCount(int post_seq) {
		session.update("userDB.viewCount",post_seq);
	}

}
