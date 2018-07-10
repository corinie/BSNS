package org.bsns.controller;

import java.util.List;

import org.bsns.domain.CommentVO;
import org.bsns.service.CommentService;
import org.bsns.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.Setter;

@RestController
@RequestMapping("/comment")
public class CommentController {
	
	@Setter(onMethod_= {@Autowired})
	private CommentService service;
	
	@PostMapping("/register/{bno}")
	public ResponseEntity<String> postRegister(@RequestBody CommentVO vo, @PathVariable("bno")int bno){
		ResponseEntity<String> entity = null;
		
		try {
			vo.setBno(bno);
			service.insert(vo);
			entity = new ResponseEntity<String>("rsuccess", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@GetMapping("/list/{bno}")
	public ResponseEntity<List<CommentVO>> getList(@PathVariable("bno") int bno, Criteria cri){
		ResponseEntity<List<CommentVO>> entity = null;
		
		try {
			entity = new ResponseEntity<List<CommentVO>>(service.getList(bno, cri), HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
