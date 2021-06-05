package solo.board.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("boardDAO")
public class BoardDAO {

	// 게시판리스트
	public List<Map<String, Object>>openBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)openBoardList("board.selectBoardList", map);
	}
	
	// 기타리스트
	public List<Map<String, Object>>etcList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)openBoardList("board.etcList", map);
	}
	
	// 카테고리-상의
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> TopList(Map<String, Object> map)throws Exception{
		return(List<Map<String, Object>>)openBoardList("board.TopList", map);
	}
	  
	// 카테고리-하의
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> BottomList(Map<String, Object> map)throws Exception{
		return (List<Map<String, Object>>)openBoardList("board.BottomList", map);
	}
	   
	// 카테고리-아우터
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> OuterList(Map<String, Object> map)throws Exception{
		return (List<Map<String, Object>>)openBoardList("board.OuterList", map);
	}
	
	// 최신순
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> RecentlyBoard(Map<String, Object> map)throws Exception{
		return (List<Map<String, Object>>)openBoardList("board.RecentlyBoard", map);
	}
	
	// 조회순
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> CountBoard(Map<String, Object> map)throws Exception{
		return (List<Map<String, Object>>)openBoardList("board.CountBoard", map);
	}
	   
	// 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> SearchBoard(Map<String, Object> map)throws Exception{
		return (List<Map<String, Object>>)openBoardList("board.SearchBoard", map);
	}
	
	// 댓글 조회수? 댓글 수?
	@SuppressWarnings("unchecked")
	public Map<String, Object> CommentCount(Map<String, Object> map)throws Exception{
		return (Map<String, Object>)selectOne("board.CommentCount", map);
	}
	   
	// 글쓰기
	public void insertBoard(Map<String, Object> map) throws Exception{
		insert("board.insertBoard", map);
	}
	  
	// 파일추가
	public void insertFile(Map<String, Object> map) throws Exception {
		insert("board.insertFile", map);
	}
	   
	// ?
	public Map<String, Object> insertBoardM(Map<String, Object> map)throws Exception{
		return (Map<String, Object>) selectOne("board.insertBoardM", map);
	}
	   
	// 조회수 증가
	public void updateHitCnt(Map<String, Object> map) throws Exception{ 
		update("board.updateHitCnt", map); 
	}
	   
	// 게시글 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map)throws Exception{
		return (Map<String, Object>) selectOne ("board.openBoardDetail", map);
	}
	   
	// 글삭제
	public void deleteBoard(Map<String, Object> map) throws Exception {
		update("board.deleteBoard", map);
	}
	   
	// 게시글 수정폼
	@SuppressWarnings("unchecked")  
	public Map<String, Object> updateBoardForm(Map<String, Object> map)throws Exception{
		return (Map<String, Object>)selectOne("board.updateBoardForm", map); 	   
	}
	
	// 글수정
	public void updateBoard(Map<String, Object> map)throws Exception{
	    update("board.updateBoard", map);
	}
	   
	// 자유게시판 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectPagingList("board.selectBoardList", map);
	}
		
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> openTopBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)openBoardList("board.selectTopBoardList", map);
	}
}
