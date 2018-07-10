package org.bsns.service;

import java.util.List;


import org.bsns.domain.CommentVO;
import org.bsns.util.Criteria;

public interface CommentService {
	
	public void insert(CommentVO vo);
	public void delete(int cno);
	public void update(CommentVO vo);
	public List<CommentVO> getList(int bno, Criteria cri);
}
