package com.spring.myweb.DAO.PostDAO;

import java.util.List;

import com.spring.myweb.VO.CategoryVO.CategoryVO;
import com.spring.myweb.VO.PostVO.PostVO;

public interface PostDAO {
	public List<PostVO> postList(); // 글 목록
	public int insertPost(PostVO vo); // 글쓰기
	public PostVO postDetail(int post_seq); // 글 상세
	public List<CategoryVO> categoryList(); // 카테고리 보이기
	public void viewCount(int post_seq); // 조회수 증가
	public void postDelete(int post_seq); // 글 삭제
}
