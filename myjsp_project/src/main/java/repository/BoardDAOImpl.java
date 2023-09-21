package repository;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
import orm.DatabaseBuilder;
import service.BoardServiceImpl;

public class BoardDAOImpl implements BoardDAO {

	
	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);

	private SqlSession sql;
	private final String NS = "BoardMapper.";
	
	public BoardDAOImpl() {
		new DatabaseBuilder();
		sql = DatabaseBuilder.getFactory().openSession();
	}
	
	
	@Override
	public int insert(BoardVO bvo) {
		log.info("register check 3");
		int isOk = sql.insert(NS+"add", bvo);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}
	
	
}
