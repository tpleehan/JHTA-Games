package com.semi4.vo;

public class Pagination3 {

	private int listPerPage;        // 한 페이지당 표시할 데이터, 기본값 10
	private int pagesPerPage;       // 한 페이지당 표시할 페이지번호, 기본값 5
	private int pageNo;             // 현재 페이지
	private int totalCnt;           // 총 데이터의 개수
	//	private boolean prev;		// 이전 페이지 여부
	//	private boolean next;		// 다음 페이지 여부

	/**
	 * Pagination객체를 생성한다.
	 * @param pageNo 요청한 페이지 번호, 기본값 10으로 설정
	 * @param totalCnt 전체 데이터 개수, 기본값 5로 설정
	 */
	public Pagination3(int pageNo, int totalCnt) {
		this.listPerPage = 10;
		this.pagesPerPage = 5;
		this.pageNo = pageNo;
		this.totalCnt = totalCnt;
	}

	/**
	 * Pagination객체를 생성한다.
	 * @param pageNo 요청한 페이지 번호, 기본값 10으로 설정
	 * @param totalCnt 전체 데이터 개수, 기본값 5로 설정
	 * @param listPerPage 한 화면에 표시할 행의 개수
	 */
	public Pagination3(int pageNo, int totalCnt, int listPerPage) {
		this.listPerPage = listPerPage;
		this.pagesPerPage = 5;
		this.pageNo = pageNo;
		this.totalCnt = totalCnt;
	}

	/**
	 * Pagination객체를 생성한다.
	 * @param pageNo 요청한 페이지 번호
	 * @param totalCnt 전체 데이터 개수
	 * @param listPerPage 한 화면에 표시할 행의 개수
	 * @param pagesPerPage 한 화면에 표시할 페이지 번호 개수
	 */
	public Pagination3(int pageNo, int totalCnt, int listPerPage, int pagesPerPage) {
		this.listPerPage = listPerPage;
		this.pagesPerPage = pagesPerPage;
		this.pageNo = pageNo;
		this.totalCnt = totalCnt;
	}

	/**
	 * 전체 페이지 개수를 반환한다.
	 * @return 총 페이지 개수
	 */
	public int getTotalPagesCount() {
		return (int)Math.ceil((double)totalCnt / listPerPage);
	}

	/**
	 * 전체 구간 개수를 반환한다.
	 * @return 총 구간 개수
	 */
	public int getTotalBlocksCount() {
		return (int)Math.ceil((double)getTotalPagesCount() / pagesPerPage);
	}

	/**
	 * 요청한 페이지 번호가 속한 현재 구간을 반환한다.
	 * @return 현재 구간 번호
	 */
	public int getCurrentBlockNo() {
		return (int)Math.ceil((double)pageNo / pagesPerPage);
	}

	/**
	 * 페이지 네비게이션의 시작 페이지 번호를 반환한다.
	 * @return 시작 페이지 번호
	 */
	public int getBeginPage() {
		if (getTotalPagesCount() == 0) {
			return 0;
		}
		return (getCurrentBlockNo() - 1) * pagesPerPage + 1;
	}

	/**
	 * 페이지 네비게이션의 끝 페이지 번호를 반환한다.
	 * @return 끝 페이지 번호
	 */
	public int getEndPage() {
		if (getTotalPagesCount() == 0) {
			return 0;
		}
		return (getCurrentBlockNo() == getTotalBlocksCount()
			? getTotalPagesCount() : getCurrentBlockNo() * pagesPerPage);
	}

	/**
	 * 요청한 페이지 번호에 해당하는 데이터의 조회구간의 시작 번호를 반환한다.
	 * @return 특정 열을 기준으로 정렬하고 순번을 부여했을 때 조회 구간의 시작 번호  
	 */
	public int getBeginIndex() {
		return (pageNo - 1) * listPerPage + 1;
	}

	/**
	 * 요청한 페이지 번호에 해당하는 데이터의 조회구간의 끝 번호를 반환한다.
	 * @return 특정 열을 기준으로 정렬하고 순번을 부여했을 때 조회 구간의 끝 번호  
	 */
	public int getEndIndex() {
		return pageNo * listPerPage;
	}

	public boolean isPrev() {
		return pageNo > 1;
	}

	public boolean isNext() {
		return pageNo < getTotalPagesCount();
	}

}
