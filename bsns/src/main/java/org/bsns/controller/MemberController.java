package org.bsns.controller;

import java.security.Principal;
import java.util.List;

import org.bsns.domain.BoardVO;
import org.bsns.domain.MemberVO;
import org.bsns.domain.ProfileVO;
import org.bsns.service.BoardService;
import org.bsns.service.MemberService;
import org.bsns.service.ProfileService;
import org.bsns.util.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {
	
	@Autowired
    private PasswordEncoder encoder;
	
	@Setter(onMethod_= {@Autowired})
	MemberService service;
	@Setter(onMethod_= {@Autowired})
	BoardService boardService;
	@Setter(onMethod_= {@Autowired})
	ProfileService fofileService;
	
	@GetMapping("/login")
	public void getLogin() {
		log.info("get login...");
	}
	
	@GetMapping("/join")
	public void getJoin() {
		log.info("get join...");
	}
	
	@PostMapping("/join")
	public String postJoin(MemberVO vo) {
		
		String pw = encoder.encode(vo.getMpw());
		
		vo.setMpw(pw);
		
		service.setMember(vo);
		
		return "redirect:/member/login";
		
	}
	
	@GetMapping("/profile")
	public void getProfile(Criteria cri, String mid, Model model) {
		
		
		
		
		List<BoardVO> list = boardService.getListId(cri, mid);
		ProfileVO profileVo = fofileService.readProfile(mid);
		
		model.addAttribute("list", list);
		model.addAttribute("name", mid);
		if(profileVo != null) {
			model.addAttribute("profile", profileVo);
		}else {
			model.addAttribute("profile", null);
		}
		
	}
	
	@GetMapping("/profileRegister")
	public void getProfileRegister() {
		log.info("get profile register");
	}

}
