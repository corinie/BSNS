package org.bsns.controller;



import org.bsns.domain.BoardVO;
import org.bsns.service.BoardService;
import org.bsns.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board")
@Log4j
public class BoardController {
	
	@Setter(onMethod_= {@Autowired})
	private BoardService service;
	
	@GetMapping("/register")
	public void getRegister() {
		log.info("get register");
	}
	
	@PostMapping("/register")
	public String postRegister(BoardVO vo, String[] uuid, String[] hashtag) {
		log.info("post register");
		
		service.insert(vo, uuid, hashtag);
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/list")
	public void getList(Criteria cri, Model model) {
		log.info("get list");
		
		log.info(service.getList(cri));
		
		model.addAttribute("list", service.getList(cri));
	}
	
	@GetMapping("/hlist")
	public void getHashtagList(Criteria cri, String tagname, Model model) {
		log.info("get hlist");
		
		model.addAttribute("list", service.getHashtagList(cri, "#"+tagname));
	}
	
	
	@GetMapping("/view")
	public void getView(int bno, Model model) {
		log.info("get view");
		
		model.addAttribute("vo", service.read(bno));
	}
	
}
