package org.bsns.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.bsns.domain.PhotoVO;

public interface PhotoMapper {
	
	public void insertPhoto(PhotoVO vo);
	public void submitPhoto(String uuid);
	
	public void updateSumbitPhoto(@Param("uuid") String uuid, @Param("bno") int bno);
	public void updateNull(int bno);
	
	public List<PhotoVO> listPhoto(int bno);
	

}
