package solo.board.comment.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import solo.common.dao.AbstractDAO;

@Repository("commentDAO")
public class CommentDAO extends AbstractDAO{
	
	//
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> openCommentList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) openCommentList("comment.selectCommentList", map);
	}
	
	// ´ñ±Û ÀÛ¼º
	public void insertComment(Map<String, Object> map) throws Exception{
		insert("comment.insertComment", map);
	}
	
	public void insertFile(Map<String, Object> map) throws Exception {
		insert("board.insertFile", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object>selectBoardNum(Map<String, Object> map)throws Exception{
		return (Map<String, Object>)selectOne("comment.selectBoardNum", map);
	}
	 
	// ´ñ±Û »èÁ¦
	public void deleteComment(Map<String, Object> map) throws Exception {
		update("comment.deleteComment", map);
	}
	 
	// ´ñ±Û ¼öÁ¤ Æû
	@SuppressWarnings("unchecked")
	public Map<String, Object> updateCommentForm(Map<String, Object> map)throws Exception{
		return (Map<String, Object>) selectOne ("comment.openCommentModifyForm", map);
	}
	 
	// ´ñ±Û ¼öÁ¤
	public void updateComment(Map<String, Object> map)throws Exception{
		update("comment.updateComment", map);
	}
	
}