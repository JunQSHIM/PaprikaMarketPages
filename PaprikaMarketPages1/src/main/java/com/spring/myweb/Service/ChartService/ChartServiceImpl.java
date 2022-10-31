package com.spring.myweb.Service.ChartService;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.myweb.DAO.AdminDAO.ChartDAO.ChartDAO;
import com.spring.myweb.VO.ChartVO.ChartVO;
import com.spring.myweb.VO.UserVO.UserVO;

@Service
public class ChartServiceImpl implements ChartService {

	@Inject
	private ChartDAO cDAO;
	
	@Override
	public List<Date> countWeek(ChartVO vo,int time) throws Exception {
		return cDAO.countWeek(vo, time);
	}

	@Override
	public List<Date> countMonth(ChartVO vo, int time) throws Exception {
		return cDAO.countMonth(vo, time);
	}

	@Override
	public List<ChartVO> category() throws Exception {
		return cDAO.category();
	}

	@Override
	public List<ChartVO> quit() throws Exception {
		return cDAO.quit();

	}

	@Override
	public List<Date> countWeekpay(ChartVO vo,int time) throws Exception {
		return cDAO.countWeekpay(vo,time);
	}
	
	@Override
	public List<Date> countMonthpay(ChartVO vo, int time) throws Exception {
		return cDAO.countMonthpay(vo, time);
	}

	@Override
	public List<Date> countWeekcom(ChartVO vo, int time) throws Exception {
		return cDAO.countWeekcom(vo,time);
	}

	@Override
	public List<Date> countMonthcom(ChartVO vo, int time) throws Exception {
		return cDAO.countMonthcom(vo, time);
	}

	@Override
	public void saveHistory(UserVO vo) {
		cDAO.loginHistory(vo);
	}

	@Override
	public List<ChartVO> countTodayLogin() {
		return cDAO.countTodayLogin();
	}

	@Override
	public List<Date> countWeekLogin(ChartVO vo, int time) {
		return cDAO.countWeekLogin(vo, time);	}

	@Override
	public List<Date> countMonthLogin(ChartVO vo, int time) {
		return cDAO.countMonthLogin(vo, time);
	}

	@Override
	public int getTodayPost() {
		return cDAO.getTodayPost();
	}

	@Override
	public int getTodayBoard() {
		return cDAO.getTodayBoard();
	}

	@Override
	public int getTodayLogin() {
		return cDAO.getTodayLogin();
	}

	@Override
	public int getTodaySingo() {
		return cDAO.getTodaySingo();
	}

}
