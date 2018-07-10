package org.bsns.service;

import java.util.List;

import org.bsns.domain.PhotoVO;

public interface PhotoService {
	
	public void insertPhoto(PhotoVO vo);
	public List<PhotoVO> listPhoto(int bno);

}
