package org.bsns.controller;

import java.util.stream.Collectors;

import org.bsns.domain.MemberVO;
import org.bsns.mapper.MemberMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MemberMapperTests {
	
	@Autowired
    private PasswordEncoder encoder;
	
	@Setter(onMethod_ = { @Autowired })
	private MemberMapper mapper;
	
	@Test
	public void insertMember() {
		
		for(int i=0; i<100; i++) {
			
			MemberVO vo = new MemberVO();
			vo.setMid("user"+i);
			vo.setMpw(encoder.encode("pw"+i));
			vo.setMname("name"+i);
			vo.setEmail("user"+i+"@bsns.com");
			vo.setMprofile("pro"+i);
			
			mapper.setMember(vo);
			mapper.setAuth("user"+i);
		}
		
	}
	
	@Test
	public void readMember() {
		
		MemberVO vo = mapper.readMember("user1");
		
		log.info(vo.getAvo().stream().map(authVO -> new SimpleGrantedAuthority(authVO.getAuth())).collect(Collectors.toList()));
        log.info("dsfasfefkdjfkasdjfijef jd");
		
		
	}
	

}
