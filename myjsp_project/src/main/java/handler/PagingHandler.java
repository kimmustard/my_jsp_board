package handler;

import domain.PagingVO;

public class PagingHandler {

	private int startPage;
	private int endPage;
	private int realEndPage;
	private boolean prev, next;
	private int dyStPage;	// 유연한 qty
	private int dyEndPage;	// 유연한 qty
	
	private int totalCount;
	private PagingVO pgvo;	//페이징 DB접속 객체
	


	public PagingHandler(PagingVO pgvo, int totalCount) {
		this.pgvo = pgvo;
		this.totalCount = totalCount;
		
	
		this.endPage = 
				(int)Math.ceil(pgvo.getPageNo() / (double) 10 ) * 10;
		

		
		this.startPage = endPage - 9;
		
		this.realEndPage = (int)Math.ceil(totalCount / (double) pgvo.getQty());
		if(realEndPage < this.endPage) {
			this.endPage = this.realEndPage;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEndPage;
		
		System.out.println();
		System.out.println(pgvo.getQty());
		
	}
	


	
	
	public int getDyEndPage() {
		return dyEndPage;
	}


	public void setDyEndPage(int dyEndPage) {
		this.dyEndPage = dyEndPage;
	}


	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getRealEndPage() {
		return realEndPage;
	}

	public void setRealEndPage(int realEndPage) {
		this.realEndPage = realEndPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public PagingVO getPgvo() {
		return pgvo;
	}

	public void setPgvo(PagingVO pgvo) {
		this.pgvo = pgvo;
	}



	public int getDyStPage() {
		return dyStPage;
	}



	public void setDyStPage(int dyStPage) {
		this.dyStPage = dyStPage;
	}
	
	
	
	
}
