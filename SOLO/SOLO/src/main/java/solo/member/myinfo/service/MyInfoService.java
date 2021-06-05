package solo.member.myinfo.service;

import java.util.List;
import java.util.Map;

public interface MyInfoService {
	
	Map<String, Object> selectMyInfoForm(Map<String, Object> map) throws Exception; // 마이페이지 폼
	
	Map<String, Object> updateMyInfoForm(Map<String, Object> map) throws Exception; // 마이페이지 수정폼
	
	void updateMyInfo(Map<String, Object> map) throws Exception; // 마이페이지 수정
	
	void deleteMyInfo(Map<String, Object> map) throws Exception; // 회원탈퇴
	
	List<Map<String, Object>> openMyBoardList(Map<String, Object> map) throws Exception;

}
