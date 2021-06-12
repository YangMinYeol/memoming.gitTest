package solo.admin.agoods.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import solo.admin.agoods.service.AgoodsService;
import solo.common.common.CommandMap;
import solo.shop.goods.service.GoodsService;

@Controller
public class AgoodsController {
	
	@Resource(name="agoodsService")
	private AgoodsService agoodsService;
	
	@Resource(name="goodsService")
	private GoodsService goodsService;
	
	// ��ǰ���� ����Ʈ
	@RequestMapping(value="/admin/aGoodsList")
	public ModelAndView aGoodsList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/adminGoodsList");
		List<Map<String, Object>> list = agoodsService.aGoodsList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
	// ��ǰ����
	@RequestMapping(value="/admin/deleteAdminGoods.do")
	public ModelAndView deleteAdminGoods(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/aGoodsList.do");
		agoodsService.deleteAdminGoods(commandMap.getMap());
	
		return mv;
	}
	
	// ��ǰ������
	@RequestMapping(value = "/admin/goodsModifyForm.do")
	public ModelAndView goodsModifyForm(CommandMap commandMap, HttpServletRequest request) throws Exception { // ��ǰ ������(������)
		ModelAndView mv = new ModelAndView("shop/goodsWrite");
		
		Map<String, Object> map = goodsService.selectGoodsDetail(commandMap.getMap(), request);
		System.out.println("������1=" + commandMap.getMap());
		System.out.println("������2=" + map);
		mv.addObject("map", map);
		mv.addObject("list", map.get("list"));
		mv.addObject("type", "midify");
		mv.addObject("title", "��ǰ ����");
		System.out.println("������3=" + map);
		return mv;
	}
	
	@RequestMapping(value = "/admin/goodsModify.do")
	public ModelAndView goodsModify(CommandMap commandMap, HttpServletRequest request) throws Exception { // ��ǰ �����Ϸ�(������)
		ModelAndView mv = new ModelAndView("redirect:/admin/aGoodsList.do");
		System.out.println(commandMap.getMap());
		String GOODS_HASH = request.getParameter("HASH");
		commandMap.put("GOODS_IMG_THUM", request.getSession().getAttribute("GOODS_IMG_THUM"));
		commandMap.put("GOODS_HASH", GOODS_HASH);
		agoodsService.updateGoods(commandMap.getMap(), request);
		System.out.println("������ƮMap=" + commandMap);
		System.out.println("������ƮMap=" + commandMap.getMap());
		mv.addObject("IDX", commandMap.getMap().get("GOODS_NUM"));

		return mv;
	}
}
