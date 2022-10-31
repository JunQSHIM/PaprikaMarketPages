package com.spring.myweb.Service.NoticeService;

import java.util.HashMap;
import java.util.List;

import com.spring.myweb.VO.noticeVO.NoticeVO;

public interface NoticeService {
	public List<NoticeVO> selectNotice(String id); //notice 목록 불러오기
	public int addNotice(HashMap<String, Object> info); //notice 추가해주기
	public void deleteNotice(); //notice 삭제하기
	public int updateNotice(int notice_seq); //notice 읽음 처리하기
	public void deleteUserNotice(String nickname);
}
