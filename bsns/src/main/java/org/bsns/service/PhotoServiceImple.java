package org.bsns.service;

import java.util.List;

import org.bsns.domain.PhotoVO;
import org.bsns.mapper.PhotoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class PhotoServiceImple implements PhotoService {
	
	@Setter(onMethod_= {@Autowired})
	PhotoMapper mapper;
	
	@Override
	public void insertPhoto(PhotoVO vo) {
		mapper.insertPhoto(vo);
	}

	@Override
	public List<PhotoVO> listPhoto(int bno) {
		return mapper.listPhoto(bno);
	}
	
	

}
