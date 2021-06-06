package solo.board.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import solo.board.board.dao.BoardDAO;
import solo.common.util.FileUtils;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	// 게시판 리스트
	@Override
	public List<Map<String, Object>> openBoardList(Map<String, Object> map) throws Exception {
		return boardDAO.openBoardList(map);
	}
	   
	// 기타 리스트
	@Override
	public List<Map<String, Object>> etcList(Map<String, Object> map)throws Exception{
		return boardDAO.etcList(map);
	}
	   
	// 상의 리스트
  	@Override
  	public List<Map<String, Object>> TopList(Map<String, Object> map)throws Exception{
  		return boardDAO.TopList(map);
  	}
	   
  	// 하의 리스트
  	@Override
  	public List<Map<String, Object>> BottomList(Map<String, Object> map)throws Exception{
  		return boardDAO.BottomList(map);
  	}
	   
  	// 아우터 리스트
  	@Override
  	public List<Map<String, Object>> OuterList(Map<String, Object> map)throws Exception{
  		return boardDAO.OuterList(map);
  	}
	   
  	// 최신순
  	@Override
  	public List<Map<String, Object>> RecentlyBoard(Map<String, Object> map)throws Exception{
  		return boardDAO.RecentlyBoard(map);
  	}
	   
  	// 조회순
  	@Override
  	public List<Map<String, Object>> CountBoard(Map<String, Object> map)throws Exception{
  		return boardDAO.CountBoard(map);
  	}
	   
  	// 검색
  	@Override
  	public List<Map<String, Object>> SearchBoard(Map<String, Object> map)throws Exception{
  		return boardDAO.SearchBoard(map);
  	}
	   
  	// ?
  	@Override
  	public Map<String, Object> CommentCount(Map<String, Object> map)throws Exception{
  		return boardDAO.CommentCount(map);
  	}
	  
  	// 글쓰기
  	@Override
  	public void insertBoard(Map<String, Object> map)throws Exception{
  		boardDAO.insertBoard(map);
  	}
	   
  	// ?
  	@Override
  	public Map<String, Object> insertBoardM(Map<String, Object> map)throws Exception{
  		return boardDAO.insertBoardM(map);
  	}
	   
  	// 게시글 상세보기
  	@Override
  	public Map<String, Object> selectBoardDetail(Map<String, Object> map)throws Exception{
  		boardDAO.updateHitCnt(map); // 조회수 증가
  		Map<String, Object> resultMap = boardDAO.selectBoardDetail(map);
  		return resultMap;
  	}
	   
  	// 파일 추가
  	@Override
  	public void insertBoardWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
  		boardDAO.insertBoard(map);
	      
  		map.put("IDX", map.get("BOARD_NUM")); // IDX에 BOARD_NUM을 넣는다
  		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
  		for(int i=0, size=list.size(); i<size; i++) {
  			boardDAO.insertFile(list.get(i));
  		}
  	}
	   
  	// 글삭제
  	@Override
  	public void deleteBoard(Map<String, Object> map) throws Exception {
  		boardDAO.deleteBoard(map);
  	}
	   
  	// 수정폼
  	@Override
  	public Map<String, Object> updateBoardForm(Map<String, Object> map)throws Exception{
  		return boardDAO.updateBoardForm(map);
  	}
	 
  	// 수정
  	public void updateBoard(Map<String, Object> map)throws Exception{
  		boardDAO.updateBoard(map);
  	}
	     
  	// 자유게시판 리스트?
  	@Override
  	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
  		return boardDAO.selectBoardList(map);
  	}
	   
  	@Override
  	public List<Map<String, Object>> openTopBoardList(Map<String, Object> map) throws Exception {
  		return boardDAO.openTopBoardList(map);
  	}
   
}
