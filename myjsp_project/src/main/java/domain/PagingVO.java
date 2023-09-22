package domain;

public class PagingVO {
	
	private int pageNo;
	private int qty;
	
	private String type;
	private String keyword;
	
	//페이지네이션 기본리스트값 출력 생성자
	public PagingVO() {
		this(1,10);
	}
	
	//페이지네이션 기본리스트값 출력 생성자
	public PagingVO(int pageNo, int qty) {
		this.pageNo = pageNo;
		this.qty = qty;
	}
	
	//쿼리문 limit 0,10
	public int getPageStart() {
		return (pageNo-1)*qty;
	}
	
	//검색어 분류
	public String[] getTypeToArray() {
		return (this.type == null) ? new String[] {} : this.type.split("");
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	
}
