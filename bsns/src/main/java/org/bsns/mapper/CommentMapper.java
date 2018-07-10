package org.bsns.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.bsns.domain.CommentVO;
import org.bsns.util.Criteria;

public interface CommentMapper {
	
	public void insert(CommentVO vo);
	public void delete(int cno);
	public void update(CommentVO vo);
	public List<CommentVO> getList(@Param("bno") int bno, @Param("cri") Criteria cri);
}
