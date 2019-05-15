package com.example.spring;

public class Paging {

	public static final int countList = 10; //한페이지에 표시될 갯수
	public static final int countPage = 10; //하단의 표시되는 페이징 번호 갯수
	
	private int currentPage; // 현재 페이지
	private int totalCount;  // 총 게시물의 갯수
	private int totalPage;   // 총 페이지 수 
	private int startPage;   // 시작 페이지
	private int endPage;     // 마지막 페이지
	
	public Paging(int currentPage, int totalCount) {
		this.currentPage = currentPage;
		
		setTotalPage(totalCount);
		if(totalCount % countList > 0) totalPage++; 
		//총 페이지 갯수 구하기
		
		if(totalPage<currentPage) currentPage = totalPage;//게시물의 갯수에 맞게 페이지 번호갯수 출력(게시물이 32개라면 페이지는 4페이지까지만...)
		setPageRange();//화면에서의 페이지 번호 구하기(시작, 끝)
		if(endPage > totalPage) endPage = totalPage;
	}
	
	public void setPageRange() {
		this.startPage = ((currentPage - 1)/10) * 10 + 1;
		this.endPage = startPage + countPage - 1;
	}
	
	//getter,setter
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public void setTotalPage(int totalCount) {
		this.totalPage =  totalCount / countList;
	}
	
	public int getTotalPage() {
		return totalPage;
	}
	
	public void setStartPage() {
		this.startPage = startPage;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public void setEndPage() {
		this.endPage = endPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	
}
