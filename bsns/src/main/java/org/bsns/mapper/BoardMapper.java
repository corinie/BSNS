package org.bsns.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.bsns.domain.BoardVO;
import org.bsns.domain.HashtagVO;
import org.bsns.util.Criteria;

public interface BoardMapper {
	
	public void insert(BoardVO vo);
	public void delete(int bno);
	public void update(BoardVO vo);
	public BoardVO read(int bno);
	public List<BoardVO> getList(Criteria cri);
	public List<BoardVO> getHashtagList(@Param("cri") Criteria cri, @Param("tagname") String tagname);
	public List<BoardVO> getScrollList(Criteria cri);
	
}