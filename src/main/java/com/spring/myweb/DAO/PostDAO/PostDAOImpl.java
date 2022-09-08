package com.spring.myweb.DAO.PostDAO;

import java.util.HashMap;
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

}
