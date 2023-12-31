package domain;

public class CommentVO {

	private int cno;
	private int bno;
	private String writer;
	private String content;
	private String regdate;
	private int cmt_recommend;

	public CommentVO() {
		
	}
	
	

	public CommentVO(int bno, String writer, String content) {
		this.bno = bno;
		this.writer = writer;
		this.content = content;
	}



	public CommentVO(int cno, String content) {
		this.cno = cno;
		this.content = content;
	}


	public CommentVO(int cno, int bno, String writer, String content, String regdate, int cmt_recommend) {
		this.cno = cno;
		this.bno = bno;
		this.writer = writer;
		this.content = content;
		this.regdate = regdate;
		this.cmt_recommend = cmt_recommend;
		
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getCmt_recommend() {
		return cmt_recommend;
	}

	public void setCmt_recommend(int cmt_recommend) {
		this.cmt_recommend = cmt_recommend;
	}

	
	
}
