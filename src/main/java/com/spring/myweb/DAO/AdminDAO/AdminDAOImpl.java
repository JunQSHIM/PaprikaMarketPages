package com.spring.myweb.DAO.AdminDAO;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.myweb.VO.AdminVO.BoardSingoVO;
import com.spring.myweb.VO.AdminVO.BoardVO;
import com.spring.myweb.VO.AdminVO.PostSingoVO;
import com.spring.myweb.VO.AdminVO.ReviewSingoVO;
import com.spring.myweb.VO.AdminVO.UserSmsVO;
import com.spring.myweb.VO.QnaVO.QnaAnswersVO;
import com.spring.myweb.VO.QnaVO.QnaQuestionsVO;
import com.spring.myweb.VO.QnaVO.QnaVO;
import com.spring.myweb.VO.UserVO.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	private SqlSession session;

	@Override
	public List<UserVO> selectAll() {
		List<UserVO> userList = session.selectList("adminDB.selectUserAll");
		return userList;
	}

	@Override
	public List<UserSmsVO> selectSmsAll() {
		List<UserSmsVO> userSmsList = session.selectList("adminDB.selectUserSms");
		return userSmsList;
	}

	@Override
	public List<ReviewSingoVO> selectSingoReview() {
		List<ReviewSingoVO> reviewSingoList = session.selectList("adminDB.selectReviewSingo");
		return reviewSingoList;
	}
	
	@Override
	public List<BoardSingoVO> selectSingoBoard() {
		List<BoardSingoVO> boardSingoList = session.selectList("adminDB.selectBoardSingo");
		return boardSingoList;
	}

	@Override
	public List<PostSingoVO> selectSingoPost() {
		List<PostSingoVO> postSingoList = session.selectList("adminDB.selectPostSingo");
		return postSingoList;
	}

	@Override
	public void deleteSingoPage(int singo_page) {
		session.delete("adminDB.deleteSingoPage", singo_page);
	}

	@Override
	public List<BoardVO> selectBoardAll() {
		List<BoardVO> boardList = session.selectList("adminDB.selectBoardAll");
		return boardList;
	}

	@Override
	public BoardVO boardDetail(int board_seq) {
		BoardVO bde = session.selectOne("adminDB.boardDetail", board_seq); 
		return bde;
	}

	@Override
	public void boardDelete(int board_seq) {
		session.delete("adminDB.boardDelete", board_seq); 
		
	}

	@Override
	public List<UserVO> selectAdmin() {
		List<UserVO> list = session.selectList("adminDB.adminList");
		return list;
	}

	@Override
	public int giveAdmin(String id) {
		int result = session.update("adminDB.giveAdmin",id);
		return result;
	}
	
	@Override
	public int deleteAdmin(String id) {
		int result = session.update("adminDB.deleteAdmin",id);
		return result;
	}

	@Override
	public List<QnaVO> selectQnaCate() {
		List<QnaVO> list = session.selectList("adminDB.selectQnaCategory");
		return list;
	}

	@Override
	public List<QnaQuestionsVO> selectQuestions() {
		List<QnaQuestionsVO> list = session.selectList("adminDB.selectQuestions");
		return list;
	}

	@Override
	public List<QnaAnswersVO> selectAnswers() {
		List<QnaAnswersVO> list = session.selectList("adminDB.selectAnswers");
		return list;
	}

	@Override
	public int insertQnaCate(String qna_title) {
		int result = 0;
		result = session.insert("adminDB.addQnaCate",qna_title);
		return result;
	}

	@Override
	public int insertQ(HashMap<String, String> qnas) {
		int result = 0;
		result = session.insert("adminDB.addQ",qnas);
		return result;
	}

	@Override
	public int insertA(HashMap<String, String> qnas) {
		int result = 0;
		result = session.insert("adminDB.addA",qnas);
		return result;
	}

	@Override
	public int updateQnaCate(HashMap<String, Object> qnas) {
		int result = 0;
		result = session.update("adminDB.updateQnaCate",qnas);
		return result;
	}

	@Override
	public int updateQ(HashMap<String, Object> qnas) {
		int result = 0;
		result = session.update("adminDB.updateQ",qnas);
		return result;
	}

	@Override
	public int updateA(HashMap<String, Object> qnas) {
		int result = 0;
		result = session.update("adminDB.updateA",qnas);
		return result;
	}

	@Override
	public QnaVO selectCateStr(String qna_title) {
		QnaVO vo = session.selectOne("adminDB.selectCateStr",qna_title);
		return vo;
	}

	@Override
	public QnaQuestionsVO selectQStr(String question) {
		QnaQuestionsVO vo = session.selectOne("adminDB.selectQStr",question);
		return vo;
	}

	@Override
	public QnaAnswersVO selectAStr(String answer) {
		QnaAnswersVO vo = session.selectOne("adminDB.selectAStr",answer);
		return vo;
	}
	
	@Override
	public QnaVO selectCate(int qna_seq) {
		QnaVO vo = session.selectOne("adminDB.selectCate",qna_seq);
		return vo;
	}

	@Override
	public QnaQuestionsVO selectQ(int q_seq) {
		QnaQuestionsVO vo = session.selectOne("adminDB.selectQ",q_seq);
		return vo;
	}

	@Override
	public QnaAnswersVO selectA(int a_seq) {
		QnaAnswersVO vo = session.selectOne("adminDB.selectA",a_seq);
		return vo;
	}
	

	@Override
	public List<QnaQuestionsVO> bringQ(String qna_title) {
		List<QnaQuestionsVO> qlist = session.selectList("adminDB.bringQ",qna_title);
		return qlist;
	}

	@Override
	public List<QnaAnswersVO> bringA(String question) {
		List<QnaAnswersVO> alist = session.selectList("adminDB.bringA",question);
		return alist;
	}

	@Override
	public int updateQofA(HashMap<String, Object> qnas) {
		int result = 0;
		result = session.update("adminDB.updateQofA",qnas);
		return result;
	}

	@Override
	public int updateQnaCateofQ(HashMap<String, Object> qnas) {
		int result = 0;
		result = session.update("adminDB.updateQnaCateofQ",qnas);
		return result;
	}

	@Override
	public void deleteQna(HashMap<String, Object> qnas) {
		session.delete("adminDB.deleteQna",qnas);
	}

	@Override
	public void deleteQ(HashMap<String, Object> qnas) {
		session.delete("adminDB.deleteQ",qnas);
	}

	@Override
	public void deleteA(HashMap<String, Object> qnas) {
		session.delete("adminDB.deleteA",qnas);
	}

	@Override
	public int checkQ(String question) {
		int result = 0;
		result = session.selectOne("adminDB.checkQ",question);
		return result;
	}


	

}
