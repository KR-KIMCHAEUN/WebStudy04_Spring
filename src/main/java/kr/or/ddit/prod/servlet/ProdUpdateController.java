package kr.or.ddit.prod.servlet;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.others.advice.OthersControllerAdvice;
import kr.or.ddit.prod.service.ProdService;
import kr.or.ddit.prod.service.ProdServiceImpl;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.ProdVO;

@Controller
@RequestMapping("/prod/prodUpdate.do")
public class ProdUpdateController{
	
	@Inject
	private ProdService service; 
	
	@GetMapping
	public String formUI(
			@Valid @RequestParam("what") String prodId
			,Model model
			){
		ProdVO prod = service.retrieveProd(prodId);
		model.addAttribute("prod",prod);
		return "prod/prodEdit";
	}
	
	@PostMapping
	public String updateProcess(
			 @Validated(UpdateGroup.class) @ModelAttribute("prod") ProdVO prod
			 ,BindingResult errors
			 ,Model model
			 ,RedirectAttributes redirectAttributes
			){
		
		String logicalViewName = null;
		
		if (!errors.hasErrors()) {
			ServiceResult result = service.modifyProd(prod);
			String message = null;
			switch (result) {
			case INVALIDPASSWORD:
				message = "비밀번호 인증 실패;";
				logicalViewName = "prod/prodEdit";
				break;
			case OK:
				logicalViewName = "redirect:/prod/prodView.do?what="+prod.getProdId();
				redirectAttributes.addFlashAttribute("message", "수정성공");
				break;
			default: 
				message = "서버 오류";
				logicalViewName = "prod/prodEdit";
				break;
			}
			model.addAttribute("message", message);

		} else {
			logicalViewName = "prod/prodEdit";

		}
		
		return logicalViewName;
	}
}

