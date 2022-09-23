package com.spring.myweb.DAO.NoticeDAO;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.myweb.VO.noticeVO.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO{

	@Inject
	private SqlSession session;
	
	@Override
	public List<NoticeVO> selectNotice(String id) {
		List<NoticeVO> noticeList = session.selectList("userDB.selectNotice",id);
		return noticeList;
	}

	@Override
	public int addNotice(HashMap<String, Object> info) {
		int result = 0;
		result = session.insert("userDB.addNotice",info);
		return result;
	}

	@Override
	public void deleteNotice() {
		session.delete("userDB.deleteNotice");
	}

	@Override
	public int updateNotice(int notice_seq) {
		int result = 0;
		result = session.update("userDB.readNotice",notice_seq);
		return result;
	}

}
