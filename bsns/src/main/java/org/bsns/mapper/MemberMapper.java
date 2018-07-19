package org.bsns.mapper;

import org.bsns.domain.MemberVO;

public interface MemberMapper {
	
	public MemberVO readMember(String mid);
	public void setAuth(String mid);
	public void setMember(MemberVO vo);

}
