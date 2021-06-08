package solo.board.comment.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import solo.board.comment.service.CommentService;
import solo.common.common.CommandMap;

@Controller // 컨트롤러라는것을 알림
public class CommentController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commentService") // 빈의 이름을 이용하여 사용할 객체를 검색
	private CommentService commentService;
	
	@RequestMapping(value="/comment/insertComment.do") //댓글작성
    public ModelAndView insertComment(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/openBoardDetail.do");
		commentService.insertCommentWrite(commandMap.getMap(), request);
		mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
         
      return mv;
   }
	
	
	@RequestMapping(value = "/comment/commentDelete.do") // 댓글 삭제
	public ModelAndView commentDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/board/openBoardList.do");
		commentService.deleteComment(commandMap.getMap());
		mv.addObject("COMMENT_NUM", commandMap.get("COMMENT_NUM"));
	      
		return mv;      
	}

	@RequestMapping(value="/comment/updateCommentForm.do") // 댓글 수정 폼
	public ModelAndView updateCommentForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board/commentModify");
		List<Map<String, Object>> list1 = commentService.openCommentList(commandMap.getMap());
		mv.addObject("list1", list1);
		Map<String, Object> map = commentService.updateCommentForm(commandMap.getMap());
		mv.addObject("map", map);
		mv.addObject("CONTENTS_NUM", commandMap.get("COMMENTS_NUM"));
		return mv;
	}
	
	@RequestMapping(value="/comment/updateComment.do") // 댓글 수정
	public ModelAndView updateComment(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/board/openBoardDetail.do");
		mv.addObject("CONTENTS_NUM", commandMap.get("COMMENTS_NUM"));
		mv.addObject("BOARD_NUM", commandMap.get("BOARD_NUM"));
		mv.addObject("CONTENTS_CONTENT", commandMap.get("COMMENTS_CONTENT"));
		commentService.updateComment(commandMap.getMap());
		return mv;
	}
	
}
