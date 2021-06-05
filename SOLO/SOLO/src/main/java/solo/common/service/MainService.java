package solo.common.service;

import java.util.List;
import java.util.Map;

public interface MainService {
	
	// 메인
	List<Map<String, Object>> selectMainList(Map<String, Object> commandMap) throws Exception;
	
	// 메인 공지시항 리스트
	List<Map<String, Object>> selectNoticeList(Map<String, Object> commandMap) throws Exception;
	
	// 메인 검색
	List<Map<String, Object>> mainSearch(Map<String, Object> map, String keyword) throws Exception;
}
