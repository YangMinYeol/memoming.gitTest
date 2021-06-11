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
	
	// �������� ����Ʈ
	@RequestMapping(value="/admin/acsBoardList.do")
	public ModelAndView acsBoardList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/admin/acsList");
		List<Map<String, Object>> list = acsService.acsBoardList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
	// �������� �󼼺���
	@RequestMapping(value="/admin/openAcsDetail.do")
	public ModelAndView openAcsDetail(CommandMap commandMap)throws Exception {
		ModelAndView mv = new ModelAndView("/admin/acsDetail");
		Map<String, Object> map = acsService.acsDetail(commandMap.getMap());
		mv.addObject("map", map);
	      
		return mv;
	}
	
	// �������� �ۼ���
	@RequestMapping(value="/admin/openAcsWrite.do")
	public ModelAndView openAcsWrite(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/admin/acsWriteForm");
		
		return mv;
	}
	
	// �������� �ۼ�
	@RequestMapping(value="/admin/insertAcs.do")
	public ModelAndView insertAcs(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/acsBoardList.do");
		acsService.insertAcs(commandMap.getMap());
		
		return mv;
	}
	
	// �������� ������
	@RequestMapping(value="/admin/updateAcsForm.do")
	public ModelAndView updateAcsForm(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/admin/acsUpdateForm");
		Map<String, Object> map = acsService.updateAcsForm(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;	
	}
	
	// �������� ����
	@RequestMapping(value="/admin/updateAcs.do")
	public ModelAndView updateAcs(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/acsBoardList.do");
		acsService.updateAcs(commandMap.getMap());
		
		return mv;
	}
	
	// �������� ����
	@RequestMapping(value="/admin/acsDelete.do")
	public ModelAndView acsDelete(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/acsBoardList.do");
		acsService.deleteAcs(commandMap.getMap());
		
		return mv;
	}
	
	// ��ü ����Ʈ
	@RequestMapping(value="/admin/allList.do")
	public ModelAndView allList(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/admin/acsList");
		List<Map<String, Object>> list = acsService.allList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
	// �������� ����Ʈ
	@RequestMapping(value="/admin/notice.do")
	public ModelAndView notice(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/admin/acsList");
		List<Map<String, Object>> list = acsService.notice(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
	// �̺�Ʈ ����Ʈ
	@RequestMapping(value="/admin/event.do")
	public ModelAndView event(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/admin/acsList");
		List<Map<String, Object>> list = acsService.event(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
	// �������� �˻�
	@RequestMapping(value="/admin/SearchAcs.do")
	public ModelAndView SearchAcs(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("/admin/acsList");
		List<Map<String, Object>> list = acsService.SearchAcs(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;  
	}

}