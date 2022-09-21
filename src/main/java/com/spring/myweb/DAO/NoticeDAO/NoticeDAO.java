package com.spring.myweb.DAO.NoticeDAO;

import java.util.List;

import com.spring.myweb.VO.noticeVO.NoticeVO;

public interface NoticeDAO {
	public List<NoticeVO> selectNotice(); //notice 목록 불러오기
	public int addNotice(NoticeVO vo); //notice 추가해주기
	public void deleteNotice(int read_notice); //notice 삭제하기
	public int updateNotice(int notice_seq); //notice 읽음 처리하기
}
