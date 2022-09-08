package com.spring.myweb.User.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.myweb.VO.CategoryVO.CategoryVO;
import com.spring.myweb.VO.PostService.PostService;
import com.spring.myweb.VO.PostVO.PostVO;
import com.spring.myweb.VO.UserVO.UserVO;
import com.spring.myweb.awss3.service.AwsS3Service;
import com.spring.myweb.awss3.vo.PostPhotoVO;

@Controller
@SessionAttributes("post")
public class PostController {

	@Autowired
	private PostService postService;

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String postList(Model model, PostVO vo) {
		System.out.println("Post Service");
		List<PostVO> list = postService.postList();
		model.addAttribute("post", list);
		return "login/main/mother";
	}

	@RequestMapping(value = "/create.do", method = RequestMethod.GET)
	public String getCreate(HttpSession session, Model model, CategoryVO vo, UserVO uvo) {
		System.out.println("판매하기 접속함");
		if (uvo != null) {
			List<CategoryVO> list = postService.categoryList();
			model.addAttribute("category", list);
		}
		return "login/sell";
	}

	@RequestMapping(value = "/createProc.do")
	public String post(Model model, PostVO vo, PostPhotoVO pvo) {
		System.out.println("글 등록");
		
		// 이미지 등록
		try {
			String key = pvo.getOrigin_file_name().getOriginalFilename();
			InputStream is = pvo.getOrigin_file_name().getInputStream();
			String contentType = pvo.getOrigin_file_name().getContentType();
			
			String fileName = UUID.randomUUID() + "-" + key; // 파일이름 랜덤 생성
			long contentLength = pvo.getOrigin_file_name().getSize();
			AwsS3Service awsS3 = AwsS3Service.getinstance();
		
			awsS3.upload(is, fileName, contentType, contentLength);
				
		
			System.out.println("이미지 업로드 완료");

		} catch (IOException e) {
			e.printStackTrace();
		}
		int success = postService.insertPost(vo);
		if (success == 1) {
			model.addAttribute("post", vo);
		}
		return "redirect:main.do";
	}

	@RequestMapping(value = "/postDelete.do", method = RequestMethod.GET)
	public String postDelete(int post_seq) throws Exception {
		System.out.println("글 삭제");
		postService.postDelete(post_seq);
		return "redirect:main.do";
	}
 
	@RequestMapping(value = "/postDetail.do", method = RequestMethod.GET)
	public String getDetail(Model model, int post_seq) {
		System.out.println("상세보기");
		postService.viewCount(post_seq); // 조회수
		PostVO vo = postService.postDetail(post_seq);
		model.addAttribute("post", vo);
		return "login/product&purchase/product_detail";
	}
	
	// 카테고리 별 목록 나오게 하기.
	@RequestMapping(value = "/category.do", method = RequestMethod.GET)
	public String categoryDetail(Model model, int category_seq) {
		System.out.println("카테고리 리스트");
		List<PostVO> vo =postService.categoryDetail(category_seq);
		model.addAttribute("post", vo);
		return "login/main/mother";
	}

	@RequestMapping(value = "/listPage.do", method = RequestMethod.GET)
	public String getlistPage(Model model, @RequestParam("num") int num) throws Exception {
		System.out.println("페이징");
		// 게시물 총 개수
		int count = postService.count();
		// 한페이지에 출력할 게시물 수
		int postNum = 5;
		// 하단 페이지 번호([게시물 총 갯수 ÷ 한 페이지에 출력할 개수] 의 올림)
		int pageNum = (int)Math.ceil((double)count/postNum);
		// 출력할 게시물
		int displayPost = (num -1) * postNum;
		//한번에 표시할 페이징 번호의 갯수
		int pageNum_cnt = 3;
		//표시되는 페이지 번호 중 마지막 번호
		int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);
		// 표시되는 페이지 번호 중 첫번째 번호
		int startPageNum = endPageNum - (pageNum_cnt - 1);
		// 마지막 번호 재계산
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
		if(endPageNum > endPageNum_tmp) {
		 endPageNum = endPageNum_tmp;
		}
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;
		// 시작 및 끝 번호
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		// 이전 및 다음 
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		// 현재 페이지
		model.addAttribute("select", num);
		List<PostVO> list = postService.listPage(displayPost, postNum);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("list", list);
		return "login/main/listPage";
	}
}
