package com.spring.myweb.DAO.PostDAO;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.spring.myweb.VO.CategoryVO.CategoryVO;
import com.spring.myweb.VO.PhotoVO.PhotoVO;
import com.spring.myweb.VO.PostVO.PostVO;

public interface PostDAO {
	public List<PostVO> postList(); // 글 목록
	public int insertPost(PostVO vo); // 글쓰기
	public PostVO postDetail(int post_seq); // 글 상세
	public List<String> photoDetail(int post_seq);//사진불러오기
	public String photoOne(int post_seq);//사진 하나불러오기
	
	public List<CategoryVO> categoryList(); // 카테고리 보이기
	public void viewCount(int post_seq); // 조회수 증가
	public void postDelete(int post_seq); // 글 삭제
	public List<PostVO> categoryDetail(int category_seq); // 카테고리별 상품 보기
	public CategoryVO categoryName(int category_seq); //카테고리 이름
	public int count() throws Exception; // 게시물 총 개수
	public List<PostVO> listPage(int displayPost, int postNum) throws Exception; // 게시물 목록 + 페이징
	public void updatePost(PostVO vo);// 판매하기 수정하기
	
	public Map<String, String> uploadImg(List<MultipartFile> img);//이미지 다수 등록
	public void insertPhoto(PhotoVO vo);//DB에 저장
	public int post_seq(int user_seq);//최신 상품 등록 페이지
	public void deleteImage(int post_seq);//사진 삭제
}
