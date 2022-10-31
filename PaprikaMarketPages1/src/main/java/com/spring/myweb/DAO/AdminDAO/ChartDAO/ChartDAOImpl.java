package com.spring.myweb.DAO.AdminDAO.ChartDAO;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.myweb.VO.ChartVO.ChartVO;
import com.spring.myweb.VO.UserVO.UserVO;


@Repository
public class ChartDAOImpl implements ChartDAO{

	@Inject
	private SqlSession session;
	
	@Override
	public List<Date> countWeek(ChartVO vo, int time) throws Exception {
		
		if(time==0) {
			return session.selectList("adminDB.today",vo);
		}else if(time==1){
			return session.selectList("adminDB.lastweek", vo);
		}else if(time==2) {
			vo.setToday(vo.getToday()+7);
			vo.setWeek(vo.getWeek()+7);
			return session.selectList("adminDB.lastweek", vo);
		}else {
			vo.setToday(vo.getToday()+14);
			vo.setWeek(vo.getWeek()+14);
			return session.selectList("adminDB.lastweek", vo);
		}
			
	}

	@Override
	public List<Date> countMonth(ChartVO vo, int time) throws Exception {
			return session.selectList("adminDB.month",vo);
	}

	@Override
	public List<ChartVO> category() throws Exception {
		return session.selectList("adminDB.category");
	}

	@Override
	public List<ChartVO> quit() throws Exception {
		return session.selectList("adminDB.quit");
	}

	@Override
	public List<Date> countWeekpay(ChartVO vo,int time) throws Exception {
		if(time==0) {
			return session.selectList("adminDB.todaypay",vo);
		}else if(time==1){
			return session.selectList("adminDB.lastweekpay", vo);
		}else if(time==2) {
			vo.setToday(vo.getToday()+7);
			vo.setWeek(vo.getWeek()+7);
			return session.selectList("adminDB.lastweekpay", vo);
		}else {
			vo.setToday(vo.getToday()+14);
			vo.setWeek(vo.getWeek()+14);
			return session.selectList("adminDB.lastweekpay", vo);
		}
	}
	
	@Override
	public List<Date> countMonthpay(ChartVO vo, int time) throws Exception {
			return session.selectList("adminDB.monthpay",vo);
	}

	@Override
	public List<Date> countWeekcom(ChartVO vo, int time) throws Exception {
		if(time==0) {
			return session.selectList("adminDB.todaycom",vo);
		}else if(time==1){
			return session.selectList("adminDB.lastweekcom", vo);
		}else if(time==2) {
			vo.setToday(vo.getToday()+7);
			vo.setWeek(vo.getWeek()+7);
			return session.selectList("adminDB.lastweekcom", vo);
		}else {
			vo.setToday(vo.getToday()+14);
			vo.setWeek(vo.getWeek()+14);
			return session.selectList("adminDB.lastweekcom", vo);
		}
	}

	@Override
	public List<Date> countMonthcom(ChartVO vo, int time) throws Exception {
		return session.selectList("adminDB.monthcom",vo);
	}

	@Override
	public void loginHistory(UserVO vo) {
		session.insert("adminDB.loginHistory",vo);
	}

	@Override
	public List<ChartVO> countTodayLogin() {
		return session.selectList("adminDB.todayLogin");
	}

	@Override
	public List<Date> countWeekLogin(ChartVO vo, int time) {
		if(time==0) {
			return session.selectList("adminDB.weekLogin",vo);
		}else if(time==1){
			return session.selectList("adminDB.lastweekLogin", vo);
		}else if(time==2) {
			vo.setToday(vo.getToday()+7);
			vo.setWeek(vo.getWeek()+7);
			return session.selectList("adminDB.lastweekLogin", vo);
		}else {
			vo.setToday(vo.getToday()+14);
			vo.setWeek(vo.getWeek()+14);
			return session.selectList("adminDB.lastweekLogin", vo);
		}
	}

	@Override
	public List<Date> countMonthLogin(ChartVO vo, int time) {
		return session.selectList("adminDB.monthLogin",vo);
	}

	@Override
	public int getTodayPost() {
		return session.selectOne("adminDB.getTodayPost");
	}

	@Override
	public int getTodayBoard() {
		return session.selectOne("adminDB.getTodayBoard");
	}

	@Override
	public int getTodayLogin() {
		return session.selectOne("adminDB.getTodayLogin");
	}

	@Override
	public int getTodaySingo() {
		return session.selectOne("adminDB.getTodaySingo");
	}
	
}
