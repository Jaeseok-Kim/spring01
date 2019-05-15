package com.example.spring.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring.Paging;
import com.example.spring.member.model.MemberDTO;
import com.example.spring.member.service.MemberService;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService memberService;
	
	@RequestMapping("member/list.do")
	public ModelAndView selectList(@RequestParam(defaultValue="1") int currentPage) {
		
		int count = memberService.countMember();//레코드 갯수 계산
		
		Paging page = new Paging(currentPage, count);
		int pageX = (page.getCurrentPage()-1)*10;//페이징을 위한 limit 설정
		List<MemberDTO> list = memberService.selectList(pageX);
		
		logger.info("memberList = "+list);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/memberList");
		
		Map<String,Object> map = new HashMap<>();
		map.put("member", list);
		map.put("count", count);
		map.put("page", page);
		//System.out.println("---currentPage : "+page.getCurrentPage()+" startPage : "+page.getStartPage()+" endPage : "+page.getEndPage()+" totalPage : "+page.getTotalPage());
		mav.addObject("map",map);
		return mav;
	}
	
	@RequestMapping("member/view.do")
	public String view(@RequestParam String userid, Model model) {
		model.addAttribute("member",memberService.view(userid));
		return "member/view";
	}
	
	@RequestMapping("member/write.do")
	public String moveToInsertPage() {
		return "member/memberInsert";
	}
	
	@RequestMapping("member/insert.do")
	public String insertMember(MemberDTO memberDto) throws Exception {
		memberService.insertMember(memberDto);
		return "redirect:/member/list.do";
	}
	
	@RequestMapping("member/update.do")
	public String updateMember(@ModelAttribute MemberDTO memberDto, Model model) {
		boolean result=memberService.checkPw(memberDto.getUserid(), memberDto.getPasswd());
		
		  if(result) { 
			  memberService.updateMember(memberDto); 
			  return "redirect:/member/list.do"; 
		  }else { 
			  MemberDTO dto2 = memberService.view(memberDto.getUserid());
			  memberDto.setJoin_date(dto2.getJoin_date());
			  model.addAttribute("message","비밀번호가 일치하지 않습니다.");
			  model.addAttribute("member",memberDto); 
			  return "member/view"; 
		  }
		
	}
	
	@RequestMapping("member/delete.do")
	public String deleteMember(@ModelAttribute MemberDTO memberDto,Model model) {
		boolean result = memberService.checkPw(memberDto.getUserid(),memberDto.getPasswd());
		
		if(result) {
			memberService.deleteMember(memberDto.getUserid());
			return "redirect:/member/list.do";
		}else {
			MemberDTO dto2 = memberService.view(memberDto.getUserid());
			memberDto.setJoin_date(dto2.getJoin_date());
			model.addAttribute("message","비밀번호가 일치하지 않습니다.");
			model.addAttribute("member",memberDto);
			return "member/view";
		}
	}
	
}
