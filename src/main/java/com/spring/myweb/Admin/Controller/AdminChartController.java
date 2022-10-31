package com.spring.myweb.Admin.Controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.myweb.Service.AdminService.AdminService;
import com.spring.myweb.Service.ChartService.ChartService;
import com.spring.myweb.VO.ChartVO.ChartVO;

@Controller
public class AdminChartController {

	@Autowired
	AdminService adminService;

	@Autowired
	ChartService chartService;

	@RequestMapping(value = "/chart.mdo", method = RequestMethod.GET)
	public String chartAdmin() {
		return "Admin_page/chart/chart";
	}

	// 통계
	@RequestMapping("/chart{type}.mdo")
	@ResponseBody
	public List<Integer> countWeek(Model model, ChartVO vo, @PathVariable("type") String type, int time)
			throws Exception {
		int mon = 0;
		int tue = 0;
		int wed = 0;
		int thu = 0;
		int fri = 0;
		int sat = 0;
		int sun = 0;

		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String nowStr = fm.format(now);
		Date n = fm.parse(nowStr);
		Calendar cal = Calendar.getInstance();
		cal.setTime(n);

		vo.setToday(cal.get(Calendar.DAY_OF_WEEK));

		List<Date> week = new ArrayList<Date>();

		if (type.equals("post_pay")) {
			week = chartService.countWeekpay(vo, time);
		} else if (type.equals("post_complete")) {
			week = chartService.countWeekcom(vo, time);
		} else if (type.equals("loginHistory")) {
			week = chartService.countWeekLogin(vo, time);
		} else {
			vo.setType(type);
			week = chartService.countWeek(vo, time);
		}

		for (Date d : week) {
			String date = fm.format(d);

			Date rd = fm.parse(date);
			Calendar ca = Calendar.getInstance();
			ca.setTime(rd);

			int dayNum = ca.get(Calendar.DAY_OF_WEEK);
			switch (dayNum) {
			case 1:
				sun++;
				break;
			case 2:
				mon++;
				break;
			case 3:
				tue++;
				break;
			case 4:
				wed++;
				break;
			case 5:
				thu++;
				break;
			case 6:
				fri++;
				break;
			case 7:
				sat++;
				break;

			}

		} // for

		List<Integer> weekPost = new ArrayList<Integer>();
		weekPost.add(sun);
		weekPost.add(mon);
		weekPost.add(tue);
		weekPost.add(wed);
		weekPost.add(thu);
		weekPost.add(fri);
		weekPost.add(sat);

		model.addAttribute("weekPost", weekPost);
		return weekPost;
	}

	@RequestMapping("/charty{type}.mdo")
	@ResponseBody
	public List<Integer> countMonth(Model model, ChartVO vo, @PathVariable("type") String type, int time)
			throws Exception {
		int jan = 0;
		int feb = 0;
		int mar = 0;
		int apr = 0;
		int may = 0;
		int jun = 0;
		int jul = 0;
		int aug = 0;
		int sep = 0;
		int oct = 0;
		int nov = 0;
		int dec = 0;

		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");

		LocalDate now = LocalDate.now();
		int month = now.getMonthValue();

		Date nowd = new Date();
		String nowStr = fm.format(nowd);
		Date n = fm.parse(nowStr);
		Calendar cal = Calendar.getInstance();
		cal.setTime(n);

		vo.setToday(cal.get(Calendar.DAY_OF_WEEK));
		vo.setMonth(month);

		List<Date> months = new ArrayList<Date>();

		if (type.equals("post_pay")) {
			months = chartService.countMonthpay(vo, time);
		} else if (type.equals("post_complete")) {
			months = chartService.countMonthcom(vo, time);
		} else if (type.equals("loginHistory")) {
			months = chartService.countMonthLogin(vo, time);
		} else {
			vo.setType(type);
			months = chartService.countMonth(vo, time);
		}

		for (Date d : months) {
			LocalDate localDate = new java.sql.Date(d.getTime()).toLocalDate();
			int dayNum = localDate.getMonthValue();

			switch (dayNum) {
			case 1:
				jan++;
				break;
			case 2:
				feb++;
				break;
			case 3:
				mar++;
				break;
			case 4:
				apr++;
				break;
			case 5:
				may++;
				break;
			case 6:
				jun++;
				break;
			case 7:
				jul++;
				break;
			case 8:
				aug++;
				break;
			case 9:
				sep++;
				break;
			case 10:
				oct++;
				break;
			case 11:
				nov++;
				break;
			case 12:
				dec++;
				break;
			}

		} // for

		List<Integer> year = new ArrayList<Integer>();
		year.add(jan);
		year.add(feb);
		year.add(mar);
		year.add(apr);
		year.add(may);
		year.add(jun);
		year.add(jul);
		year.add(aug);
		year.add(sep);
		year.add(oct);
		year.add(nov);
		year.add(dec);

		model.addAttribute("year", year);
		return year;
	}

	@RequestMapping("/chartcategory.mdo")
	@ResponseBody
	public List<ChartVO> category(Model model, ChartVO vo) throws Exception {

		List<ChartVO> cate = chartService.category();

		return cate;
	}

	@RequestMapping("/chartquit.mdo")
	@ResponseBody
	public List<ChartVO> quit(Model model, ChartVO vo) throws Exception {

		List<ChartVO> quit = chartService.quit();

		return quit;
	}

	@RequestMapping("/charLogin.mdo")
	@ResponseBody
	public List<ChartVO> login(Model model, ChartVO vo) throws Exception {

		List<ChartVO> login = chartService.countTodayLogin();
		List<ChartVO> list = new ArrayList<ChartVO>();
		for (int i = 0; i < 24; i++) {
			ChartVO cvo = new ChartVO();
			int flag = 0;
			for (ChartVO c : login) {
				if (c.getTime() == i) {
					flag = 1;
					cvo = c;
				}
			}
			if (flag == 0) {
				cvo.setTime(i);
				cvo.setCnt(0);
				list.add(cvo);
			} else {
				list.add(cvo);
			}
		}

		return list;
	}

}