package kr.or.ddit.member.controller;

import java.io.IOException;
import java.security.Principal;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

//POJO(PlainOldJavaObject)

@Controller
public class MemberDeleteController{
	
	@Inject
	private MemberService service;
	
	@PostMapping("/member/memberDelete.do")
	public String deleteProcess(
			Principal principal
			,@RequestParam("password") String password
			,RedirectAttributes redirectAttributes
			){
		String memId=principal.getName();
		MemberVO inputData = new MemberVO(memId, password);
		ServiceResult result = service.removeMember(inputData);
		String logicalViewName = null;
		String message = null;

		switch(result) {
		case INVALIDPASSWORD : 
			message = "비밀 번호 오류";
			redirectAttributes.addFlashAttribute("message", message);
			logicalViewName = "redirect:/mypage";
			break;
		case OK :
			logicalViewName = "forward:/login/logOut.do";
			break;
		default:
			message = "서버 오류, 다시 시도해주세요.";
			redirectAttributes.addFlashAttribute("message", message);
			logicalViewName = "redirect:/mypage";
			break;
		}
		
		return logicalViewName;
	}

}
