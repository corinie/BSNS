package org.bsns.service;

import org.bsns.domain.ProfileVO;

public interface ProfileService {
	
	public void insertProfile(ProfileVO vo);
	public ProfileVO readProfile(String mid);

}
