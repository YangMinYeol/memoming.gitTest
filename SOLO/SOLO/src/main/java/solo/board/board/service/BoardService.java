package solo.board.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface BoardService {
	
	List<Map<String, Object>> openBoardList(Map<String, Object> map)throws Exception;
	   
	List<Map<String, Object>> etcList(Map<String, Object> map)throws Exception;
	   
	List<Map<String, Object>> TopList(Map<String, Object> map)throws Exception;
	   
	List<Map<String, Object>> BottomList(Map<String, Object> map)throws Exception;
	   
	List<Map<String, Object>> OuterList(Map<String, Object> map)throws Exception;
	   
	List<Map<String, Object>> RecentlyBoard(Map<String, Object> map)throws Exception;
	   
	List<Map<String, Object>> CountBoard(Map<String, Object> map)throws Exception;
	   
	List<Map<String, Object>> SearchBoard(Map<String, Object> map)throws Exception;
	   
	Map<String, Object> CommentCount(Map<String, Object> map)throws Exception;
	   
	Map<String, Object> insertBoardM(Map<String, Object> map)throws Exception;
	   
	void insertBoard(Map<String, Object> map) throws Exception;
	
	void insertBoardWrite(Map<String, Object> map, HttpServletRequest request) throws Exception;
	   
	Map<String, Object> selectBoardDetail(Map<String, Object> map)throws Exception;
	   
	void deleteBoard(Map<String, Object> map) throws Exception;
	   
	Map<String, Object> updateBoardForm(Map<String, Object> map)throws Exception;
	   
	void updateBoard(Map<String, Object> map)throws Exception;
	   
	List<Map<String, Object>> selectBoardList(Map<String,Object> map) throws Exception;
		
	List<Map<String, Object>> openTopBoardList(Map<String, Object> map)throws Exception;
}
