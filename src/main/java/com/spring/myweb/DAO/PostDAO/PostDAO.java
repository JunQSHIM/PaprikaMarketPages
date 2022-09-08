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
	public List<PostVO> categoryDetail(int category_seq); // 카테고리별 상품 보기
	public CategoryVO categoryName(int category_seq); //카테고리 이름
	public int count() throws Exception; // 게시물 총 개수
	public List<PostVO> listPage(int displayPost, int postNum) throws Exception; // 게시물 목록 + 페이징

}
