package org.bsns.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String mid, mpw, mname, email, mprofile;
	private List<AuthVO> avo;

}
