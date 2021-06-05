package solo.member.login.controller;

import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import solo.common.common.CommandMap;
import solo.member.login.service.LoginService;
import solo.member.login.service.MailService;

@Controller
public class LoginController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mailService")
	private MailService mailService;
	
	@Inject
	private JavaMailSender mailSender;
	
	@Resource(name = "loginService")
	private LoginService loginService;
	
	// @RequestMapping 은 요청 URL주소
	@RequestMapping(value= "/member/openLoginForm.do")
	public ModelAndView loginForm(HttpServletRequest request) throws Exception{
		// session
		HttpSession session = request.getSession();
		
		System.out.println("session : " + session.getAttribute("session_MEMBER"));
		
		if(session.getAttribute("session_MEMBER")!=null) { // 만약 세션_멤버가 널이 아니면
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/main/openMainList.do"); // 메인페이지
			return mv;
		} else {
			ModelAndView mv = new ModelAndView("/member/loginForm"); // 로그인페이지
			return mv;
		}
	}

	@RequestMapping(value = "/member/login.do" , method = {RequestMethod.GET, RequestMethod.POST}) // get방식, post방식 둘 다 사용 get방식은 여러번 호출해도 같은 결과를 냄 post방식은 호출때 마다 결과가 다름
	public ModelAndView login(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/member/login"); // 로그인확인 페이지
		String message = "";
		String url = "";
		
		HttpSession session = request.getSession(); // 세션
		
		//아이디 확인문
		Map<String, Object> chk = loginService.login(commandMap.getMap());
		if(chk==null) { // 아이디가 없으면
			message = "해당 아이디가 존재하지 않습니다.";
		} else { // 아이디가 있으면
			if(chk.get("MEM_PW").equals(commandMap.get("MEM_PW"))) { //만약 비밀번호가 맞으면
				session.setAttribute("session_MEM_ID", commandMap.get("MEM_ID")); // session_MEM_ID에 MEM_ID값을 넣음
				session.setAttribute("session_MEM_NUM", commandMap.get("MEM_NUM")); // session_MEM_NUM에 MEM_NUM값을 넣음
				session.setAttribute("session_MEMBER", chk); // session_MEMBER에 chk값을 넣음
			} else { // if문을 통해 sql과 정보 일치 확인
				message = "비밀번호가 맞지 않습니다.";
			}
		}
		System.out.println(chk);
		mv.addObject("message", message);
		mv.addObject("url", url);
		
		return mv;
	}
	
	@RequestMapping(value="/member/logout.do") // 로그아웃
	public ModelAndView logout(CommandMap commandMap, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession(); // 세션
		if (session != null) // 만약 세션이 널이 아니면
			session.invalidate(); // 세션을 무효화 시킴
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/main/logoutSc.do");
		return mv;
	}
	
	@RequestMapping(value="/main/logoutSc.do")
	public ModelAndView openJoinForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/member/logout"); // 로그아웃
		
		return mv;
	}
	
	@RequestMapping(value="/member/findId.do") // 아이디 찾기 폼을 보여주는 메소드
	public ModelAndView findId(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/member/findAccount");
		int ran = new Random().nextInt(900000) + 100000; // 랜덤한 값
		
		mv.addObject("random", ran);
		
		return mv;
	}
	
	@RequestMapping(value = "/member/openFindIdResult.do", method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/text; charset=utf8")
	public @ResponseBody String findIdResult(CommandMap commandMap) throws Exception {
		String id = String.valueOf(loginService.findId(commandMap.getMap()));
		
		if(id.equals("1")) {
			String findId = (String)(loginService.findIdWithEmail(commandMap.getMap()).get("MEM_ID"));
			System.out.println(findId);
			return findId;	
		}else {
			return id;
		}
	}
	
	
	@RequestMapping(value = "/member/findPw.do") // 비밀번호 찾기 폼을 보여주는 메소드
	public ModelAndView findPw(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/findAccount");
		int ran = new Random().nextInt(900000) + 100000; // 랜덤한 값
		
		mv.addObject("random",ran);
		
		return mv;
	}
	
	@RequestMapping(value = "/member/openFindPwResult.do", method=RequestMethod.GET) // 비밀번호 찾기 결과
	@ResponseBody
	public boolean findPwEmail(CommandMap commandMap,@RequestParam String MEM_ID, @RequestParam String MEM_EMAIL, @RequestParam int random, HttpServletRequest req) throws Exception {
		
		String emailCheck = String.valueOf(loginService.findPwWithEmail(commandMap.getMap()));
		System.out.println(emailCheck);
		if(emailCheck.equals("1")) {
			int ran = new Random().nextInt(900000) + 100000;
			   HttpSession session = req.getSession(true);
			   String authCode = String.valueOf(ran);
			   session.setAttribute("authCode", authCode);
			   session.setAttribute("random", random);
			   String subject = "내 비밀번호 변경 코드 안내 입니다.";
			   StringBuilder sb = new StringBuilder();
			   sb.append("귀하의 임시 비밀번호는 " + authCode + "입니다.");
			   
			   commandMap.put("MEM_ID", MEM_ID);
			   commandMap.put("MEM_EMAIL", MEM_EMAIL);
			   commandMap.put("authCode", authCode);
			   loginService.updateTempPw(commandMap.getMap());
			   return mailService.send(subject, sb.toString(),"alsduf1997@gmail.com", MEM_EMAIL, null);
		}else {
			  return false;
		}
	}
}