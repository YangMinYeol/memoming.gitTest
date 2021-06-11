package solo.admin.amember.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import solo.admin.amember.service.AdminMemberService;
import solo.common.common.CommandMap;

@Controller // 컨트롤러임을 알리는 어노테이션
public class AdminMemberController {

	@Resource(name="adminMemberService")
	private AdminMemberService adminMemberService;
	
	@RequestMapping(value="/admin/openAdminMember.do") // 요청 URL
	public ModelAndView openAdminMemberList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/adminMemberList"); // jsp 위치
		return mv;
	}
	
	// 회원 리스트
	@RequestMapping(value="/admin/selectMemberList.do")
	public ModelAndView selectMemberList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
	      
		List<Map<String, Object>> list = adminMemberService.selectMemberList(commandMap.getMap());
		mv.addObject("list", list);
		if(list.size()>0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}
		else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}
	
	/*
	 * // 회원 검색
	 * 
	 * @RequestMapping(value="/admin/openselectMemberSearchList.do") public
	 * ModelAndView openselectMemberSearchList(CommandMap commandMap)throws
	 * Exception{ ModelAndView mv = new ModelAndView("/admin/adminMemberSearch");
	 * return mv; }
	 */
	
	/*
	 * @RequestMapping(value="/admin/selectMemberSearchList.do") public ModelAndView
	 * selectMemberSearchList(CommandMap commandMap)throws Exception{ ModelAndView
	 * mv = new ModelAndView("/admin/adminMemberSearch");
	 * 
	 * List<Map<String, Object>> list =
	 * adminMemberService.selectMemberSearchList(commandMap.getMap());
	 * mv.addObject("list", list); if(list.size()>0) { mv.addObject("TOTAL",
	 * list.get(0).get("TOTAL_COUNT")); } else { mv.addObject("TOTAL", 0); } return
	 * mv; }
	 */
	
	@RequestMapping(value="/admin/selectMemberSearchList.do")
	public ModelAndView selectMemberSearchList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/admin/adminMemberList");
	      
		List<Map<String, Object>> list = adminMemberService.selectMemberSearchList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
	// 회원 상세보기
	@RequestMapping(value="/admin/openAdminMemberDetail.do")
	public ModelAndView openAdminMemberDetail(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/admin/adminMemberDetail");
	      
		Map<String, Object> map = adminMemberService.openAdminMemberDetail(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}
	   
	// 회원 제재
	@RequestMapping(value="/admin/ignoreAdminMember.do")
	public ModelAndView ignoreAdminMember(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/openAdminMember.do");
		adminMemberService.ignoreAdminMember(commandMap.getMap());
		return mv;  
	}
}
