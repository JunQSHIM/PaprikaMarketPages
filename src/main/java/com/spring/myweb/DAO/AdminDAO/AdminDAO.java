package com.spring.myweb.DAO.AdminDAO;

import java.util.HashMap;
import java.util.List;

import com.spring.myweb.VO.AdminVO.BannerVO;
import com.spring.myweb.VO.AdminVO.BoardSingoVO;
import com.spring.myweb.VO.AdminVO.BoardVO;
import com.spring.myweb.VO.AdminVO.PostSingoVO;
import com.spring.myweb.VO.AdminVO.ReviewSingoVO;
import com.spring.myweb.VO.AdminVO.UserSmsVO;
import com.spring.myweb.VO.MyMannerVO.MyMannerVO;
import com.spring.myweb.VO.OneOnOneVO.OneOnOneVO;
import com.spring.myweb.VO.PostVO.PostVO;
import com.spring.myweb.VO.QnaVO.QnaAnswersVO;
import com.spring.myweb.VO.QnaVO.QnaQuestionsVO;
import com.spring.myweb.VO.QnaVO.QnaVO;
import com.spring.myweb.VO.UserVO.UserVO;


public interface AdminDAO {
	public List<UserVO> selectAll();
	public List<UserSmsVO> selectSmsAll();//회원 sms 목록 불러오기
	public List<ReviewSingoVO> selectSingoReview();//리뷰의 신고 리스트 불러오기
	public List<BoardSingoVO> selectSingoBoard();//리뷰의 신고 리스트 불러오기
	public List<PostSingoVO> selectSingoPost();//리뷰의 신고 리스트 불러오기
	
	public void deleteSingoPage(int singo_page);//신고된 페이지 삭제
	public List<BoardVO> selectBoardAll();// 게시판 불러오기
	public BoardVO boardDetail(int board_seq); // 게시판 상세보기
	public void boardDelete(int board_seq);
	
	public List<UserVO> selectAdmin(); //관리자 명단 불러오기
	public int giveAdmin(String id); //관리자 권한 주기
	public int deleteAdmin(String id); //관리자 권한 삭제
	public List<QnaVO> selectQnaCate(); //Qna 카테고리 이름 불러오기
	public List<QnaQuestionsVO> selectQuestions(); //Qna의 카테고리별 Questions가져오기
	public List<QnaAnswersVO> selectAnswers(); //Qna의 카테고리별 Questions별 Answers 가져오기
	public int insertQnaCate(String qna_title); //Qna 카테고리추가
	public int insertQ(HashMap<String, String> qnas); //Qna Question 추가
	public int insertA(HashMap<String, String> qnas); //Qna Answer 추가
	public int updateQnaCate(HashMap<String, Object> qnas); //Qna 카테고리 업데이트
	public int updateQ(HashMap<String, Object> qnas); //Qna Q 업데이트
	public int updateA(HashMap<String, Object> qnas); //Qna A 업데이트
	public QnaVO selectCateStr(String qna_title); //Qna Cate seq불러오기
	public QnaQuestionsVO selectQStr(String question); //Question_seq 불러오기
	public QnaAnswersVO selectAStr(String answer); //Answer_seq 불러오기
	public QnaVO selectCate(int qna_seq); //Qna Cate seq불러오기
	public QnaQuestionsVO selectQ(int q_seq); //Question_seq 불러오기
	public QnaAnswersVO selectA(int a_seq); //Answer_seq 불러오기
	public List<QnaQuestionsVO> bringQ(String qna_title); //카테고리의 Q 가져오기
	public List<QnaAnswersVO> bringA(String question); //카테고리의 A 가져오기
	public int updateQofA(HashMap<String, Object> qnas); // 변경될 질문명으로 질문의 답변들 수정하기
	public int updateQnaCateofQ(HashMap<String, Object> qnas); //변경될 카테고리명으로 질문의 카테고리명들 수정
	public void deleteQna(HashMap<String, Object> qnas); //qna 삭제
	public void deleteQ(HashMap<String, Object> qnas); //q 삭제
	public void deleteA(HashMap<String, Object> qnas); //a 삭제
	public int checkQ(String question);//질문답변 추가시 기존 질문이 있는지 체크
	
	public List<BannerVO> bannerList();//배너 리스트
	public void abbBanner(BannerVO vo);//배너 저장
	public void bannerDelete(int banner_seq);
	public int updatePay(HashMap<String, Object> vo);
	public void deletePay(); //완료된 페이 삭제
	
	public List<OneOnOneVO> oneOnList(); // 1:1 문의 내역 불러오기
	public OneOnOneVO findUser(int user_seq); // 문의한 사용자 정보 불러오기
	public int oneStatus(int status);
	
	// 상품 + 상품 후기 관리
	public List<PostVO> adminPost() throws Exception;
	public PostVO adminPostDetail(int post_seq) throws Exception;
	public List<MyMannerVO> adminReview() throws Exception;
	
	//회원 차단 / 해제
	public int blockUser(int user_seq);
	public int unblockUser(int user_seq);
}

