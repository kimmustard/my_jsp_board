package service;

import java.util.List;

import domain.CommentVO;

public interface CommentSerivce {

	int post(CommentVO cvo);

	List<CommentVO> getList(int bno);

	int modify(CommentVO cvo);

	int remove(int cno);

}
