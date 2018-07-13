package org.bsns.controller;

import java.util.List;

import org.bsns.domain.BoardVO;
import org.bsns.service.BoardService;
import org.bsns.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/boardrest")
@Log4j
public class BoardRestController {
	
	@Setter(onMethod_= {@Autowired})
	private BoardService service;

	@GetMapping("/scrolllist/{page}")
	public ResponseEntity<List<BoardVO>> scrollList(Criteria cri) {
		ResponseEntity<List<BoardVO>> entity = null;

		try {
			entity = new ResponseEntity<List<BoardVO>>(service.getScrollList(cri), HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
