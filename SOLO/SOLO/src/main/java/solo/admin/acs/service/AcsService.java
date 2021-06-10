package solo.admin.acs.service;

import java.util.List;
import java.util.Map;

public interface AcsService {
	
	// 공지사항 리스트
	List<Map<String, Object>> acsBoardList(Map<String, Object> map)throws Exception;
	
	// 공지사항 상세보기
	Map<String, Object> acsDetail(Map<String, Object> map)throws Exception;
	
	// 공지사항 작성
	void insertAcs(Map<String, Object> map)throws Exception;
	
	// 공지사항 수정폼
	Map<String, Object> updateAcsForm(Map<String, Object> map)throws Exception; 
	
	// 공지사항 수정
	void updateAcs(Map<String, Object> map)throws Exception;
	
	// 공지사항 삭제
	void deleteAcs(Map<String, Object> map)throws Exception; 
	
	// 전체 리스트
	List<Map<String, Object>> allList(Map<String, Object> map)throws Exception; 
	
	// 공지 리스트
	List<Map<String, Object>> notice(Map<String, Object> map)throws Exception;
	
	// 이벤트 리스트
	List<Map<String, Object>> event(Map<String, Object> map)throws Exception; 
	
	// 검색
	List<Map<String, Object>> SearchAcs(Map<String, Object> map)throws Exception; 
	
	// FAQ 리스트
	List<Map<String, Object>> faqBoardList(Map<String, Object> map)throws Exception;
	
	// FAQ 작성
	void insertFaq(Map<String, Object> map)throws Exception;
	
	// FAQ 수정폼
	Map<String, Object> updateFaqForm(Map<String, Object> map)throws Exception; 
	
	// FAQ 수정
	void updateFaq(Map<String, Object> map)throws Exception; 
}
