package com.spring.myweb.Service.ChartService;

import java.util.Date;
import java.util.List;

import com.spring.myweb.VO.ChartVO.ChartVO;
import com.spring.myweb.VO.UserVO.UserVO;


public interface ChartService {
	//일주일 단위 상품 게시판 가입자 탈퇴자
	public List<Date> countWeek(ChartVO vo, int time) throws Exception;
	//한달 단위
	public List<Date> countMonth(ChartVO vo, int time) throws Exception;
	//카테고리별
	public List<ChartVO> category() throws Exception;
	//탈퇴사유
	public List<ChartVO> quit() throws Exception;
	//일주일 단위 안전결제
	public List<Date> countWeekpay(ChartVO vo ,int time)throws Exception;
	//한달단위 안전결제
	public List<Date> countMonthpay(ChartVO vo, int time) throws Exception;
	//일주일 단위 거래 완료
	public List<Date> countWeekcom(ChartVO vo, int time) throws Exception;
	//한달 단위 거래 완료
	public List<Date> countMonthcom(ChartVO vo, int time) throws Exception;
	// 로그인 기록
	public void saveHistory(UserVO vo);
	//오늘 로그인 기록
	public List<ChartVO> countTodayLogin();
	//일주일
	public List<Date> countWeekLogin(ChartVO vo, int time);
	//한달
	public List<Date> countMonthLogin(ChartVO vo, int time);
	//오늘 등록된 상품
	public int getTodayPost();
	//오늘 등록된 게시판
	public int getTodayBoard();
	//오늘 로그인한 수
	public int getTodayLogin();
	//오늘 들어온 신고
	public int getTodaySingo();
}
