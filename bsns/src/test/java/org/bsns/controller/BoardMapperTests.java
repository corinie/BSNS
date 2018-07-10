package org.bsns.controller;

import org.bsns.domain.BoardVO;
import org.bsns.mapper.BoardMapper;
import org.bsns.util.Criteria;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Setter(onMethod_= {@Autowired})
	private BoardMapper mapper;
	
	@Test
	public void insertTest() {
		
		BoardVO vo = new BoardVO();
		vo.setContent("test");
		vo.setWriter("user");
		mapper.insert(vo);
		
		
	}
	
	@Test
	public void getListTest() {
		log.info(mapper.getList(new Criteria(1)));
	}
	

}
