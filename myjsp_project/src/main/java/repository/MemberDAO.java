package repository;

import java.util.List;

import domain.MemberVO;

public interface MemberDAO {

	int insert(MemberVO mvo);

	MemberVO login(MemberVO mvo);

	int lastLogin(String id);

	int update(MemberVO mvo);

	String getFileName(String id);

	int delete(String id);

	List<MemberVO> selectList();

}
