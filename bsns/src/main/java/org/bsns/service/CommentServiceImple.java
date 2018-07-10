package org.bsns.service;

import java.util.List;

import org.bsns.domain.CommentVO;
import org.bsns.mapper.CommentMapper;
import org.bsns.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
@Service
public class CommentServiceImple implements CommentService {
	
	@Setter(onMethod_= {@Autowired})
	private CommentMapper mapper;
	
	@Override
	public void insert(CommentVO vo) {
		mapper.insert(vo);
	}

	@Override
	public void delete(int cno) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(CommentVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<CommentVO> getList(int bno, Criteria cri) {
		return mapper.getList(bno, cri);
	}

}
