package org.bsns.service;

import java.util.List;

import org.bsns.domain.BoardVO;
import org.bsns.domain.HashtagVO;
import org.bsns.mapper.BoardMapper;
import org.bsns.mapper.HashtagMapper;
import org.bsns.mapper.PhotoMapper;
import org.bsns.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;

@Service
public class BoardServiceImple implements BoardService {
	
	@Setter(onMethod_= {@Autowired})
	private BoardMapper mapper;
	@Setter(onMethod_= {@Autowired})
	private PhotoMapper pmapper;
	@Setter(onMethod_= {@Autowired})
	private HashtagMapper hmapper;
	
	
	@Override
	@Transactional
	public void insert(BoardVO vo, String[] uuid, String[] hashtag) {
		mapper.insert(vo);
		
		if(uuid != null) {
			for(int i=0; i<uuid.length; i++) {
				pmapper.submitPhoto(uuid[i]);
			}			
		}
		
		if(hashtag != null) {			
			for(int i=0; i<hashtag.length; i++) {
				HashtagVO hvo = new HashtagVO();
				hvo.setTagname(hashtag[i]);
				hvo.setStatus("r");
				hvo.setMid(vo.getWriter());
				
				hmapper.insertHash(hvo);
			}
		}
	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(BoardVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public BoardVO read(int bno) {
		return mapper.read(bno);
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return mapper.getList(cri);
	}
	
	@Override
	public List<BoardVO> getHashtagList(Criteria cri, String tagname) {
		return mapper.getHashtagList(cri, tagname);
	}
	
	@Override
	public List<BoardVO> getScrollList(Criteria cri) {
		return mapper.getScrollList(cri);
	}

}
