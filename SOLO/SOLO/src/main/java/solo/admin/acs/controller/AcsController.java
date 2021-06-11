package solo.admin.acs.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import solo.admin.acs.service.AcsService;
import solo.common.common.CommandMap;

@Controller
public class AcsController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "acsService")
	private AcsService acsService;
	
	// 공지사항 리스트
	@RequestMapping(value="/admin/acsBoardList.do")
	public ModelAndView acsBoardList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/admin/acsList");
		List<Map<String, Object>> list = acsService.acsBoardList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
	// 공지사항 상세보기
	@RequestMapping(value="/admin/openAcsDetail.do")
	public ModelAndView openAcsDetail(CommandMap commandMap)throws Exception {
		ModelAndView mv = new ModelAndView("/admin/acsDetail");
		Map<String, Object> map = acsService.acsDetail(commandMap.getMap());
		mv.addObject("map", map);
	      
		return mv;
	}
	
	// 공지사항 작성폼
	@RequestMapping(value="/admin/openAcsWrite.do")
	public ModelAndView openAcsWrite(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/admin/acsWriteForm");
		
		return mv;
	}
	
	// 공지사항 작성
	@RequestMapping(value="/admin/insertAcs.do")
	public ModelAndView insertAcs(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/acsBoardList.do");
		acsService.insertAcs(commandMap.getMap());
		
		return mv;
	}
	
	// 공지사항 수정폼
	@RequestMapping(value="/admin/updateAcsForm.do")
	public ModelAndView updateAcsForm(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/admin/acsUpdateForm");
		Map<String, Object> map = acsService.updateAcsForm(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;	
	}
	
	// 공지사항 수정
	@RequestMapping(value="/admin/updateAcs.do")
	public ModelAndView updateAcs(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/acsBoardList.do");
		acsService.updateAcs(commandMap.getMap());
		
		return mv;
	}
	
	// 공지사항 삭제
	@RequestMapping(value="/admin/acsDelete.do")
	public ModelAndView acsDelete(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/acsBoardList.do");
		acsService.deleteAcs(commandMap.getMap());
		
		return mv;
	}
	
	// 전체 리스트
	@RequestMapping(value="/admin/allList.do")
	public ModelAndView allList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/admin/acsList");
		List<Map<String, Object>> list = acsService.allList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
	// 공지사항 리스트
	@RequestMapping(value="/admin/notice.do")
	public ModelAndView notice(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/admin/acsList");
		List<Map<String, Object>> list = acsService.notice(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
	// 이벤트 리스트
	@RequestMapping(value="/admin/event.do")
	public ModelAndView event(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/admin/acsList");
		List<Map<String, Object>> list = acsService.event(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
	// 공지사항 검색
	@RequestMapping(value="/admin/SearchAcs.do")
	public ModelAndView SearchAcs(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/admin/acsList");
		List<Map<String, Object>> list = acsService.SearchAcs(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;  
	}

}