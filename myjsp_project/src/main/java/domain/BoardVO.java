package domain;

public class BoardVO {
	private int bno;
	private String title;
	private String writer;
	private String content;
	private String regdate;
	private String moddate;
	private int readcount;
	private String image_File;
	
	public BoardVO() {
		
	}
	
	
	//insert
	public BoardVO(String title, String writer, String content) {
		this.title = title;
		this.writer = writer;
		this.content = content;
	}

	//수정
	public BoardVO(int bno, String title, String content) {
		this.bno = bno;
		this.title = title;
		this.content = content;
	}

	
	
	//리스트 조회
	public BoardVO(int bno, String title, String writer, String regdate) {
		this.bno = bno;
		this.title = title;
		this.writer = writer;
		this.regdate = regdate;
	}


	//전체조회
	public BoardVO(int bno, String title, String writer, String content, String regdate, String moddate, int readcount,
			String image_File) {
		this.bno = bno;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.regdate = regdate;
		this.moddate = moddate;
		this.readcount = readcount;
		this.image_File = image_File;
	}


	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getModdate() {
		return moddate;
	}

	public void setModdate(String moddate) {
		this.moddate = moddate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getImage_File() {
		return image_File;
	}

	public void setImage_File(String image_File) {
		this.image_File = image_File;
	}


	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", writer=" + writer + ", content=" + content + ", regdate="
				+ regdate + ", moddate=" + moddate + ", readcount=" + readcount + ", image_File=" + image_File + "]";
	}
	
	
	
}
