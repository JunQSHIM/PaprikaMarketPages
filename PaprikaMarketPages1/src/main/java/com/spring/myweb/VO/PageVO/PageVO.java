package com.spring.myweb.VO.PageVO;

public class PageVO {
	// 현재 페이지 번호
	private int num;

	// 게시물 총 갯수
	private int count;

	// 한페이지에 출력할 게시물 갯수
	private int postNum = 10;

	// 하단 페이지 번호([게시물 총 갯수 ÷ 한 페이지에 출력할 개수] 의 올림)
	private int pageNum;

	// 출력할 게시물
	private int displayPost;

	// 한번에 표시할 페이징 번호의 갯수
	private int pageNumCnt = 10;

	// 표시되는 페이지 번호 중 마지막 번호
	private int endPageNum;

	// 표시되는 페이지 번호 중 첫번째 번호
	private int startPageNum;

	// 검색하기
	private String keyword;

	private int user_seq;

	private int post_seq;

	private String sort;

	// 이전 및 다음
	private boolean prev;
	private boolean next;

	public int getNum() {
		return num;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
		dataCalc();
	}

	public int getPostNum() {
		return postNum;
	}

	public int getPageNum() {
		return pageNum;
	}

	public int getDisplayPost() {
		return displayPost;
	}

	public int getPageNumCnt() {
		return pageNumCnt;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getPost_seq() {
		return post_seq;
	}

	public void setPost_seq(int post_seq) {
		this.post_seq = post_seq;
	}

	public int getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	private void dataCalc() {

		// 마지막 번호
		endPageNum = (int) (Math.ceil((double) num / (double) pageNumCnt) * pageNumCnt);

		// 시작 번호
		startPageNum = endPageNum - (pageNumCnt - 1);

		// 마지막 번호 재계산
		int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNumCnt));

		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}

		prev = startPageNum == 1 ? false : true;
		next = endPageNum * pageNumCnt >= count ? false : true;

		displayPost = (num - 1) * postNum;

	}

	@Override
	public String toString() {
		return "PageVO [num=" + num + ", count=" + count + ", postNum=" + postNum + ", pageNum=" + pageNum
				+ ", displayPost=" + displayPost + ", pageNumCnt=" + pageNumCnt + ", endPageNum=" + endPageNum
				+ ", startPageNum=" + startPageNum + ", keyword=" + keyword + ", prev=" + prev + ", next=" + next + "]";
	}

}
