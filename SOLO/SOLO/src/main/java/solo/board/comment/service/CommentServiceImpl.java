package solo.board.comment.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import solo.board.comment.dao.CommentDAO;
import solo.common.util.FileUtils;

@Service("commentService") // 해당 클래스를 빈객체로 생성해주는 어노테이션
public class CommentServiceImpl implements CommentService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commentDAO") // 빈의 이름을 이용해서 주입할 객체를 검색한다
	private CommentDAO commentDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	
	@Override // 댓글 목록
	public List<Map<String, Object>> openCommentList(Map<String, Object> map) throws Exception{
		return commentDAO.openCommentList(map);
	}
	
	@Override // 댓글 작성
	public void insertCommentWrite(Map<String, Object> map, HttpServletRequest request) throws Exception{
		commentDAO.insertComment(map);
		map.put("BOARD_NUM", map.get("BOARD_NUM"));
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i=0, size=list.size(); i<size; i++) {
			commentDAO.insertFile(list.get(i));
		}
	}
	
	@Override // 댓글 삭제
	public void deleteComment(Map<String, Object> map) throws Exception {
		commentDAO.deleteComment(map);
	}
	
	@Override // 댓글 수정 폼
	public Map<String, Object> updateCommentForm(Map<String, Object> map)throws Exception{
		return commentDAO.updateCommentForm(map);
	}
	
	@Override // 댓글 수정
	public void updateComment(Map<String, Object> map)throws Exception{
		commentDAO.updateComment(map);
	}
	
}
