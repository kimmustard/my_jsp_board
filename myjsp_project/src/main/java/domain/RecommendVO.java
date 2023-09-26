package domain;

public class RecommendVO {
	
	private int cno;
	private int bno;
	private String id;

	public RecommendVO() {
		
	}
	
	
	//게시판 추천 테이블
	public RecommendVO(int bno, String id) {
		this.bno = bno;
		this.id = id;
	}
	

	public RecommendVO(int cno, int bno, String id) {
		this.cno = cno;
		this.bno = bno;
		this.id = id;
	}


	public int getCno() {
		return cno;
	}


	public void setCno(int cno) {
		this.cno = cno;
	}


	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	@Override
	public String toString() {
		return "RecommendVO [cno=" + cno + ", bno=" + bno + ", id=" + id + "]";
	}


	
	
	
	
}
