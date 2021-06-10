package solo.admin.acs.service;

import java.util.List;
import java.util.Map;

public interface AcsService {
	
	// �������� ����Ʈ
	List<Map<String, Object>> acsBoardList(Map<String, Object> map)throws Exception;
	
	// �������� �󼼺���
	Map<String, Object> acsDetail(Map<String, Object> map)throws Exception;
	
	// �������� �ۼ�
	void insertAcs(Map<String, Object> map)throws Exception;
	
	// �������� ������
	Map<String, Object> updateAcsForm(Map<String, Object> map)throws Exception; 
	
	// �������� ����
	void updateAcs(Map<String, Object> map)throws Exception;
	
	// �������� ����
	void deleteAcs(Map<String, Object> map)throws Exception; 
	
	// ��ü ����Ʈ
	List<Map<String, Object>> allList(Map<String, Object> map)throws Exception; 
	
	// ���� ����Ʈ
	List<Map<String, Object>> notice(Map<String, Object> map)throws Exception;
	
	// �̺�Ʈ ����Ʈ
	List<Map<String, Object>> event(Map<String, Object> map)throws Exception; 
	
	// �˻�
	List<Map<String, Object>> SearchAcs(Map<String, Object> map)throws Exception; 
	
	// FAQ ����Ʈ
	List<Map<String, Object>> faqBoardList(Map<String, Object> map)throws Exception;
	
	// FAQ �ۼ�
	void insertFaq(Map<String, Object> map)throws Exception;
	
	// FAQ ������
	Map<String, Object> updateFaqForm(Map<String, Object> map)throws Exception; 
	
	// FAQ ����
	void updateFaq(Map<String, Object> map)throws Exception; 
}
