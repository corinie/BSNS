package org.bsns.mapper;

import org.bsns.domain.ProfileVO;

public interface ProfileMapper {
	
	public void insertProfile(ProfileVO vo);
	public void deleteAllProfile(String mid);
	public ProfileVO readProfile(String mid);
}
