package solo.board.board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import solo.board.board.service.BoardService;
import solo.board.comment.service.CommentService;
import solo.common.common.CommandMap;

@Controller // 컨트롤러 선언
public class BoardController {
	Logger log = Logger.getLogger(this.getClass()); // 로그 선언
	
	@Resource(name="boardService") // 빈의 이름을 이용해서 주입할 객체를 검색한다
	private BoardService boardService;
	
	@Resource(name="commentService")
	private CommentService commentService;
	
	@RequestMapping(value = "/board/openBoardList.do") // 응답할 url 설정
	public ModelAndView openBoardList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("board/boardList"); // jsp위치
		List<Map<String, Object>> list = boardService.openBoardList(commandMap.getMap());
		mv.addObject("list",list);
		
		return mv;
	}
	
	@RequestMapping(value = "/board/selectBoardList.do")
	public ModelAndView boardListPaging(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView"); // jsonView로 리턴
		
		List<Map<String,Object>> list = boardService.openBoardList(commandMap.getMap());
		mv.addObject("list", list);
		if(list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		}
		else {
			mv.addObject("TOTAL", 0);
		}
		return mv;
	}
	
	@RequestMapping(value = "/board/openBoardWrite.do")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("board/boardWrite");
		
		return mv;
	}
	
	@RequestMapping(value = "/board/insertBoard.do")
	public ModelAndView insertJoin(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/openBoardList.do");
		commandMap.put("BOARD_IMAGE", request.getSession().getAttribute("GOODS_IMG_THUM"));
		boardService.insertBoardWrite(commandMap.getMap(), request);
		mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
		
		return mv;
	}
	
	@RequestMapping(value = "/board/boardDelete.do")
	public ModelAndView boardDelete(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/openBoardList.do");
		boardService.deleteBoard(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value = "/board/openBoardDetail.do")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/boardDetail");
		List<Map<String, Object>> list1 = commentService.openCommentList(commandMap.getMap());
		mv.addObject("list1", list1);
		Map<String, Object> map = boardService.selectBoardDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value = "/board/updateBoardForm.do")
	public ModelAndView updateBoardForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/boardModify");
		Map<String, Object> map = boardService.updateBoardForm(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	@RequestMapping(value="/board/updateBoard.do")
	public ModelAndView updateBoard(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/openBoardList.do");
		boardService.updateBoard(commandMap.getMap());
		
		return mv;
	}	
	
	@RequestMapping(value = "/board/etcBoard.do")
	public ModelAndView etcBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("board/boardList");
		List<Map<String, Object>> list = boardService.etcList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	   
	@RequestMapping(value = "/board/TopList.do")
	public ModelAndView TopList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("board/boardList");
		List<Map<String, Object>> list = boardService.TopList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	   
	@RequestMapping(value = "/board/BottomList.do")
	public ModelAndView BottomList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("board/boardList");
		List<Map<String, Object>> list = boardService.BottomList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	   
	@RequestMapping(value = "/board/OuterList.do")
	public ModelAndView OuterList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("board/boardList");
		List<Map<String, Object>> list = boardService.OuterList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	   
	@RequestMapping(value="/board/RecentlyBoard.do")
	public ModelAndView RecentlyBoard(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("board/boardList");
		List<Map<String, Object>> list = boardService.RecentlyBoard(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	   
	@RequestMapping(value="/board/CountBoard.do")
	public ModelAndView CountBoard(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("board/boardList");
		List<Map<String, Object>> list = boardService.CountBoard(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;		
	}
	   
	@RequestMapping(value="/board/SearchBoard.do")
	public ModelAndView SearchBoard(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("board/boardList");
		List<Map<String, Object>> list = boardService.SearchBoard(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;      
	}
	   
	@RequestMapping(value = "/board/openTopBoardList.do")
	public ModelAndView openTopBoardList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		List<Map<String, Object>> list = boardService.openTopBoardList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
}