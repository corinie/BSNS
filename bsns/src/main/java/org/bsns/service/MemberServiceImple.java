package org.bsns.service;

import org.bsns.domain.MemberVO;
import org.bsns.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;

@Service
public class MemberServiceImple implements MemberService {
	
	@Setter(onMethod_= {@Autowired})
	MemberMapper mapper;
	
	@Transactional
	@Override
	public void setMember(MemberVO vo) {
		
		mapper.setMember(vo);
		mapper.setAuth(vo.getMid());

	}
	
	

}
