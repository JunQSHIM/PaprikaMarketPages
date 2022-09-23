package com.spring.myweb.DAO.NoticeDAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.spring.myweb.VO.NoticeVO.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO{

	@Inject
	private SqlSession session;
	
	@Override
	public List<NoticeVO> selectNotice() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addNotice(NoticeVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteNotice(int read_notice) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int updateNotice(int notice_seq) {
		// TODO Auto-generated method stub
		return 0;
	}

}
