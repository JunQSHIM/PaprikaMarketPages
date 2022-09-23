package com.spring.myweb.Service.NoticeService;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.myweb.DAO.NoticeDAO.NoticeDAO;
import com.spring.myweb.VO.noticeVO.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Inject
	NoticeDAO noticeDAO;
	
	@Override
	public List<NoticeVO> selectNotice(String id) {
		return noticeDAO.selectNotice(id);
	}

	@Override
	public int addNotice(HashMap<String, Object> info) {
		return noticeDAO.addNotice(info);
	}

	@Override
	public void deleteNotice() {
		noticeDAO.deleteNotice();
	}

	@Override
	public int updateNotice(int notice_seq) {
		return noticeDAO.updateNotice(notice_seq);
	}

}
