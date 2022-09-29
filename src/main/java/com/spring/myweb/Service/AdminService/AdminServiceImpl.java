package com.spring.myweb.Service.AdminService;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.myweb.DAO.AdminDAO.AdminDAO;
import com.spring.myweb.VO.AdminVO.BannerVO;
import com.spring.myweb.VO.AdminVO.BoardSingoVO;
import com.spring.myweb.VO.AdminVO.BoardVO;
import com.spring.myweb.VO.AdminVO.PostSingoVO;
import com.spring.myweb.VO.AdminVO.ReviewSingoVO;
import com.spring.myweb.VO.AdminVO.UserSmsVO;
import com.spring.myweb.VO.AdminVO.PayVO.PayVO;
import com.spring.myweb.VO.MyMannerVO.MyMannerVO;
import com.spring.myweb.VO.OneOnOneVO.OneOnOneVO;
import com.spring.myweb.VO.PostVO.PostVO;
import com.spring.myweb.VO.QnaVO.QnaAnswersVO;
import com.spring.myweb.VO.QnaVO.QnaQuestionsVO;
import com.spring.myweb.VO.QnaVO.QnaVO;
import com.spring.myweb.VO.UserVO.UserVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO adminDAO;

	@Override
	public List<UserVO> selectAll() {
		return adminDAO.selectAll();
	}

	@Override
	public List<UserSmsVO> selectSmsAll() {
		return adminDAO.selectSmsAll();
	}

	@Override
	public List<PostSingoVO> selectPostSingo() {
		return adminDAO.selectSingoPost();
	}

	@Override
	public void deleteSingoPage(int singo_page) {
		adminDAO.deleteSingoPage(singo_page);
	}

	@Override
	public List<BoardVO> selectBoardAll() {
		return adminDAO.selectBoardAll();
	}

	@Override
	public BoardVO boardDetail(int board_seq) {
		return adminDAO.boardDetail(board_seq);
	}

	@Override
	public void boardDelete(int board_seq) {
		adminDAO.boardDelete(board_seq);
	}

	@Override
	public List<UserVO> adminList() {
		return adminDAO.selectAdmin();
	}

	@Override
	public int giveAdmin(String id) {
		int result = adminDAO.giveAdmin(id);
		return result;
	}

	@Override
	public int deleteAdmin(String id) {
		int result = adminDAO.deleteAdmin(id);
		return result;
	}

	@Override
	public List<BannerVO> bannerList() {
		return adminDAO.bannerList();
	}

	@Override
	public List<QnaVO> selectQnaCate() {
		return adminDAO.selectQnaCate();
	}

	@Override
	public List<QnaQuestionsVO> selectQuestions() {
		return adminDAO.selectQuestions();
	}

	@Override
	public List<QnaAnswersVO> selectAnswers() {
		return adminDAO.selectAnswers();
	}

	@Override
	public int insertQnaCate(String qna_title) {
		return adminDAO.insertQnaCate(qna_title);
	}

	@Override
	public int insertQ(HashMap<String, String> qnas) {
		return adminDAO.insertQ(qnas);
	}

	@Override
	public int insertA(HashMap<String, String> qnas) {
		return adminDAO.insertA(qnas);
	}

	@Override
	public int updateQnaCate(HashMap<String, Object> qnas) {
		return adminDAO.updateQnaCate(qnas);
	}

	@Override
	public int updateQ(HashMap<String, Object> qnas) {
		return adminDAO.updateQ(qnas);
	}

	@Override
	public int updateA(HashMap<String, Object> qnas) {
		return adminDAO.updateA(qnas);
	}

	@Override
	public QnaVO selectCateStr(String qna_title) {
		return adminDAO.selectCateStr(qna_title);
	}

	@Override
	public QnaQuestionsVO selectQStr(String question) {
		return adminDAO.selectQStr(question);
	}

	@Override
	public QnaAnswersVO selectAStr(String answer) {
		return adminDAO.selectAStr(answer);
	}

	@Override
	public QnaVO selectCate(int qna_seq) {
		return adminDAO.selectCate(qna_seq);
	}

	@Override
	public QnaQuestionsVO selectQ(int q_seq) {
		return adminDAO.selectQ(q_seq);
	}

	@Override
	public QnaAnswersVO selectA(int a_seq) {
		return adminDAO.selectA(a_seq);
	}

	@Override
	public List<QnaQuestionsVO> bringQ(String qna_title) {
		return adminDAO.bringQ(qna_title);
	}

	@Override
	public List<QnaAnswersVO> bringA(String question) {
		return adminDAO.bringA(question);
	}

	@Override
	public int updateQofA(HashMap<String, Object> qnas) {
		return adminDAO.updateQofA(qnas);
	}

	@Override
	public int updateQnaCateofQ(HashMap<String, Object> qnas) {
		return adminDAO.updateQnaCateofQ(qnas);
	}

	@Override
	public void deleteQna(HashMap<String, Object> qnas) {
		adminDAO.deleteQna(qnas);
	}

	@Override
	public void deleteQ(HashMap<String, Object> qnas) {
		adminDAO.deleteQ(qnas);
	}

	@Override
	public void deleteA(HashMap<String, Object> qnas) {
		adminDAO.deleteA(qnas);
	}

	@Override
	public int checkQ(String question) {
		return adminDAO.checkQ(question);
	}

	public void addBanner(BannerVO vo) {
		adminDAO.abbBanner(vo);
	}

	@Override
	public void bannerDelete(int banner_seq) {
		adminDAO.bannerDelete(banner_seq);
	}

	@Override
	public int updatePay(HashMap<String, Object> vo) {
		return adminDAO.updatePay(vo);
	}

	@Override
	public void deletePay() {
		adminDAO.deletePay();
	}
	
	public List<OneOnOneVO> oneOnList() {
		return adminDAO.oneOnList();
	}

	@Override
	public OneOnOneVO findUser(int user_seq) {
		return adminDAO.findUser(user_seq);
	}

	@Override
	public int oneStatus(int status) {
		return adminDAO.oneStatus(status);
	}

	@Override
	public List<PostVO> adminPost() throws Exception {
		return adminDAO.adminPost();
	}

	@Override
	public PostVO adminPostDetail(int post_seq) throws Exception {
		return adminDAO.adminPostDetail(post_seq);

	}

	@Override
	public List<MyMannerVO> adminReview() throws Exception {
		return adminDAO.adminReview();
	}

	@Override
	public int blockUser(int user_seq) {
		return adminDAO.blockUser(user_seq);
	}

	@Override
	public int unblockUser(int user_seq) {
		return adminDAO.unblockUser(user_seq);
	}
	
	@Override
	public void oneDelete(int one_seq) {
		adminDAO.oneDelete(one_seq);
	}
}
