package solo.board.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("boardDAO")
public class BoardDAO {

	// �Խ��Ǹ���Ʈ
	public List<Map<String, Object>>openBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)openBoardList("board.selectBoardList", map);
	}
	
	// ��Ÿ����Ʈ
	public List<Map<String, Object>>etcList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)openBoardList("board.etcList", map);
	}
	
	// ī�װ�-����
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> TopList(Map<String, Object> map)throws Exception{
		return(List<Map<String, Object>>)openBoardList("board.TopList", map);
	}
	  
	// ī�װ�-����
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> BottomList(Map<String, Object> map)throws Exception{
		return (List<Map<String, Object>>)openBoardList("board.BottomList", map);
	}
	   
	// ī�װ�-�ƿ���
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> OuterList(Map<String, Object> map)throws Exception{
		return (List<Map<String, Object>>)openBoardList("board.OuterList", map);
	}
	
	// �ֽż�
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> RecentlyBoard(Map<String, Object> map)throws Exception{
		return (List<Map<String, Object>>)openBoardList("board.RecentlyBoard", map);
	}
	
	// ��ȸ��
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> CountBoard(Map<String, Object> map)throws Exception{
		return (List<Map<String, Object>>)openBoardList("board.CountBoard", map);
	}
	   
	// �˻�
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> SearchBoard(Map<String, Object> map)throws Exception{
		return (List<Map<String, Object>>)openBoardList("board.SearchBoard", map);
	}
	
	// ��� ��ȸ��? ��� ��?
	@SuppressWarnings("unchecked")
	public Map<String, Object> CommentCount(Map<String, Object> map)throws Exception{
		return (Map<String, Object>)selectOne("board.CommentCount", map);
	}
	   
	// �۾���
	public void insertBoard(Map<String, Object> map) throws Exception{
		insert("board.insertBoard", map);
	}
	  
	// �����߰�
	public void insertFile(Map<String, Object> map) throws Exception {
		insert("board.insertFile", map);
	}
	   
	// ?
	public Map<String, Object> insertBoardM(Map<String, Object> map)throws Exception{
		return (Map<String, Object>) selectOne("board.insertBoardM", map);
	}
	   
	// ��ȸ�� ����
	public void updateHitCnt(Map<String, Object> map) throws Exception{ 
		update("board.updateHitCnt", map); 
	}
	   
	// �Խñ� �󼼺���
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map)throws Exception{
		return (Map<String, Object>) selectOne ("board.openBoardDetail", map);
	}
	   
	// �ۻ���
	public void deleteBoard(Map<String, Object> map) throws Exception {
		update("board.deleteBoard", map);
	}
	   
	// �Խñ� ������
	@SuppressWarnings("unchecked")  
	public Map<String, Object> updateBoardForm(Map<String, Object> map)throws Exception{
		return (Map<String, Object>)selectOne("board.updateBoardForm", map); 	   
	}
	
	// �ۼ���
	public void updateBoard(Map<String, Object> map)throws Exception{
	    update("board.updateBoard", map);
	}
	   
	// �����Խ��� ����Ʈ
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectPagingList("board.selectBoardList", map);
	}
		
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> openTopBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)openBoardList("board.selectTopBoardList", map);
	}
}
