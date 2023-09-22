package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.MemberVO;
import orm.DatabaseBuilder;

public class MemberDAOImpl implements MemberDAO {

	private static final Logger log = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	private SqlSession sql;
	private final String NS = "MemberMapper.";
	
	public MemberDAOImpl() {
		new DatabaseBuilder();
		sql = DatabaseBuilder.getFactory().openSession();
	
	}

	@Override
	public int insert(MemberVO mvo) {
		log.info("register check 3");
		int isOk = sql.insert(NS+"add", mvo);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public MemberVO login(MemberVO mvo) {
		log.info("login check 3");
		return sql.selectOne(NS+"login", mvo);
	}

	@Override
	public int lastLogin(String id) {
		log.info("logout check 3");
		int isOk = sql.update(NS+"last",id);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public int update(MemberVO mvo) {
		log.info("member update check 3");
		int isOk = sql.update(NS+"up", mvo);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public String getFileName(String id) {
		log.info("remove fileName GET check 3");
		return sql.selectOne(NS+"fileName", id);
	}

	@Override
	public int delete(String id) {
		log.info("Member remove check 3");
		int isOk = sql.delete(NS+"del", id);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public List<MemberVO> selectList() {
		return sql.selectList(NS+"list");
	}

	
	
	
	
}
