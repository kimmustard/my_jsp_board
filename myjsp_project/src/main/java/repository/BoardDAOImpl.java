package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
import domain.PagingVO;
import domain.RecommendVO;
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


	@Override
	public List<BoardVO> selectList() {
		log.info("list check 3");
		return sql.selectList(NS+"list");
	}


	@Override
	public BoardVO selectOne(int bno) {
		log.info("detaile check 3");
		sql.update(NS+"read", bno);
		sql.commit();
		return sql.selectOne(NS+"detail", bno);
	}

	
	@Override
	public BoardVO ncselectOne(int bno) {
		return sql.selectOne(NS+"detail", bno);
	}

	@Override
	public int update(BoardVO bvo) {
		log.info("modify check 3");
		int isOk = sql.update(NS+"up", bvo);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}


	@Override
	public int delete(int bno) {
		log.info("delete check 3");
		sql.delete(NS+"delRmd", bno);
		sql.commit();
		
		int isOk = sql.delete(NS+"del", bno);
		if(isOk > 0) {
			sql.commit();
		}
		return isOk;
	}


	@Override
	public int getTotalCount(PagingVO pgvo) {
		return sql.selectOne(NS+"cnt", pgvo);
	}


	@Override
	public List<PagingVO> getPageList(PagingVO pgvo) {
		log.info("pageList check 3");
		return sql.selectList(NS+"page", pgvo);
	}


	@Override
	public List<BoardVO> getMyList(String writer) {
		return sql.selectList(NS+"mylist", writer);
	}


	@Override
	public RecommendVO rcmCheck(RecommendVO rvo) {
			log.info("recommend Check 3");
			RecommendVO rvo1 = sql.selectOne(NS+"rcmCheck", rvo);
			
			if(rvo1 != null) {
				log.info("이미 추천한 게시물입니다.");
				return rvo1;
			}
		
			
			int isOk = sql.insert(NS+"rcmAdd", rvo);
			if(isOk > 0) {
				sql.commit();
				
			}
			log.info("recommend Check 4");
			
			int bno = rvo.getBno();
			log.info("recommen bno = {}" , bno);
			int isOk1 = sql.update(NS+"rcmPlus", bno);
			
			if (isOk1> 0) {
				
				sql.commit();
			}
			
			return rvo;
			
			
		}

		
		
	}


	
	

