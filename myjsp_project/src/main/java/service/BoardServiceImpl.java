package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
import domain.PagingVO;
import domain.RecommendVO;
import repository.BoardDAO;
import repository.BoardDAOImpl;
import repository.CommentDAO;
import repository.CommentDAOImpl;


public class BoardServiceImpl implements Service {
	
	private static final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	private BoardDAO bdao;
	private CommentDAO cdao;
	
	public BoardServiceImpl() {
		bdao = new BoardDAOImpl();
		cdao = new CommentDAOImpl();
	}

	@Override
	public int register(BoardVO bvo) {
		log.info("register check 2");
		return bdao.insert(bvo);
	}

	@Override
	public List<BoardVO> getList() {
		log.info("list check 2");
		return bdao.selectList();
	}

	@Override
	public BoardVO detail(int bno) {
		log.info("detaile check 2");
		return bdao.selectOne(bno);
	}
	
	@Override
	public BoardVO ncdetail(int bno) {
		log.info("detaile check 2");
		return bdao.ncselectOne(bno);
	}

	@Override
	public int edit(BoardVO bvo) {
		log.info("modify check 2");
		return bdao.update(bvo);
	}

	@Override
	public int remove(int bno) {
		log.info("remove check 2");
		cdao.cmtDelete(bno);
		return bdao.delete(bno);
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		return bdao.getTotalCount(pgvo);
	}

	@Override
	public List<PagingVO> getPageList(PagingVO pgvo) {
		log.info("pageList check 2");
		return bdao.getPageList(pgvo);
	}

	@Override
	public List<BoardVO> getMyList(String writer) {
		return bdao.getMyList(writer);
	}

	@Override
	public RecommendVO rcmCheck(RecommendVO rvo) {
		log.info("recommend Check 2");
		return bdao.rcmCheck(rvo);
	}


	
	
	
}
