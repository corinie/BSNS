package org.bsns.controller;

import org.bsns.domain.CommentVO;
import org.bsns.mapper.CommentMapper;
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
public class CommentMapperTests {

	@Setter(onMethod_ = { @Autowired })
	private CommentMapper mapper;

	@Test
	public void insertTest() {

		for (int i = 0; i < 10; i++) {
			CommentVO vo = new CommentVO();
			vo.setBno(6);
			vo.setComment("test"+i);
			vo.setCommenter("test"+i);
			mapper.insert(vo);
		}
		

	}
	
	@Test
	public void getListTest() {
		log.info(mapper.getList(6, new Criteria(1)));
	}

}
