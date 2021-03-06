package org.bsns.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.bsns.domain.BoardVO;
import org.bsns.util.Criteria;

public interface BoardService {
	public void insert(BoardVO vo, String[] uuid, String[] hashtag);
	public void delete(int bno);
	public void update(BoardVO vo);
	public BoardVO read(int bno);
	public List<BoardVO> getList(Criteria cri);
	public List<BoardVO> getHashtagList(Criteria cri, String tagname);
	public List<BoardVO> getScrollList(Criteria cri);
	
	public List<BoardVO> getListId(@Param("cri") Criteria cri, @Param("mid") String mid);
}
