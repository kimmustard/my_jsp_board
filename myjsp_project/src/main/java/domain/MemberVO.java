package domain;

public class MemberVO {
	private String id;
	private String pwd;
	private String email;
	private int age;
	private String regdate;
	private String lastlogin;

	private String introduce; // 자기소개
	private String profile; // 프로필사진
	private int grade; // 등급 일반회원0 우수회원1 관리자2

	public MemberVO() {

	}

	public MemberVO(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}

	public MemberVO(String id, String pwd, String email, int age, String introduce, String profile) {
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.age = age;
		this.introduce = introduce;
		this.profile = profile;
	}

	public MemberVO(String id, String pwd, String email, int age, String regdate, String lastlogin, String introduce,
			String profile, int grade) {
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.age = age;
		this.regdate = regdate;
		this.lastlogin = lastlogin;
		this.introduce = introduce;
		this.profile = profile;
		this.grade = grade;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getLastlogin() {
		return lastlogin;
	}

	public void setLastlogin(String lastlogin) {
		this.lastlogin = lastlogin;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pwd=" + pwd + ", email=" + email + ", age=" + age + ", regdate=" + regdate
				+ ", lastlogin=" + lastlogin + ", introduce=" + introduce + ", profile=" + profile + ", grade=" + grade
				+ "]";
	}

}
