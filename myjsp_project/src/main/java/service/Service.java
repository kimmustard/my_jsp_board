package service;

import java.util.List;

import domain.BoardVO;
import domain.PagingVO;

public interface Service {

	int register(BoardVO bvo);

	List<BoardVO> getList();

	BoardVO detail(int bno);
	
	BoardVO ncdetail(int bno);

	int edit(BoardVO bvo);

	int remove(int bno);

	int getTotalCount(PagingVO pgvo);

	List<PagingVO> getPageList(PagingVO pgvo);


	

}
