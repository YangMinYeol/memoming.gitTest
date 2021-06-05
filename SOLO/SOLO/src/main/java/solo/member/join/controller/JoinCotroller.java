package solo.member.join.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import solo.common.common.CommandMap;
import solo.member.join.service.JoinService;

@Controller
public class JoinCotroller {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="joinService")
	private JoinService joinService;
	
	@RequestMapping(value="/member/openJoinForm.do")
	public ModelAndView openJoinForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/joinForm");
		
		return mv;
	}
	
	@RequestMapping(value="/member/insertJoin.do")
	public ModelAndView insertJoin(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/member/openLoginForm.do");
		joinService.insertJoin(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/member/idCheck.do") // ���̵� �ߺ�Ȯ��
	public @ResponseBody String idCheck(CommandMap commandMap) throws Exception{
		
		System.out.println(commandMap.getMap());
		
		String idCheck = String.valueOf(joinService.selectIdCheck(commandMap.getMap()));
		
		System.out.println(idCheck);
		
		return idCheck;
	}
	
	@RequestMapping(value = "/member/nickCheck.do") // �г��� �ߺ�Ȯ��
	public @ResponseBody String nickCheck(CommandMap commandMap) throws Exception {
		
		System.out.println(commandMap.getMap());
		
		String nickCheck = String.valueOf(joinService.selectNickCheck(commandMap.getMap()));
		
		System.out.println(nickCheck);
		
		return nickCheck;
	}
	
	@RequestMapping(value = "/member/openAgree.do") // �̿��� �����ֱ�
	public ModelAndView openAgree(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/member/agree");
		
		return mv;
	}

}
