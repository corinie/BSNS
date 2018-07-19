package org.bsns.service;

import org.bsns.domain.ProfileVO;
import org.bsns.mapper.ProfileMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;

@Service
public class ProfileServiceImple implements ProfileService {
	
	@Setter(onMethod_= {@Autowired})
	ProfileMapper mapper;
	
	@Transactional
	@Override
	public void insertProfile(ProfileVO vo) {
		
		mapper.deleteAllProfile(vo.getMid());
		mapper.insertProfile(vo);

	}

	@Override
	public ProfileVO readProfile(String mid) {
		
		return mapper.readProfile(mid);
	}
	

}
