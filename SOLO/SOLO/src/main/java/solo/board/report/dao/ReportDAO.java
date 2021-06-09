package solo.board.report.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import solo.common.dao.AbstractDAO;

@Repository("reportDAO") // �ش� Ŭ������ ��Ʈ �����̳ʿ� ��ü�� �������ִ� ������̼�
public class ReportDAO extends AbstractDAO {
	
	// �Ű� ����Ʈ ����
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> openAdminReport(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("report.selectReportList", map);
	}
	   
	// �Ű� ���
	public void insertReport(Map<String, Object> map)throws Exception{
		insert("report.insertReport", map);
	}
	    
	// �Խñ� �Ű���
	@SuppressWarnings("unchecked")
	public Map<String, Object>selectBoardReport(Map<String, Object> map)throws Exception{
		return (Map<String, Object>)selectOne("report.selectBoardReport", map);
	}
	      
	// ��� �Ű���
	@SuppressWarnings("unchecked")
	public Map<String, Object>selectCommentReport(Map<String, Object> map)throws Exception{
		return (Map<String, Object>)selectOne("report.selectCommentReport", map);
	}
	
	// ��� �Ű���
	public void insertCommentReport(Map<String, Object> map) throws Exception{
		insert("report.insertCommentReport", map);
	}

	// �Ű� �󼼺���
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectReportDetail(Map<String, Object> map)throws Exception{
		return (Map<String, Object>) selectOne ("report.selectReportDetail", map);
	}
	   
	// �Ű� ���¾�����Ʈ
	public void updateAdminReport(Map<String, Object> map)throws Exception{
		update("report.updateStatus", map);
	}
	   
	// ȸ�� ���¾�����Ʈ
	public void updateMemWarning(Map<String, Object> map)throws Exception{
		System.out.println(map.get("REPORT_MEM_NUM1"));
		update("report.memWarning", map);
	}
	   
	// ȸ�� ���¾�����Ʈ2
	public void updateMemStatus(Map<String, Object> map)throws Exception{
		System.out.println(map.get("REPORT_MEM_NUM1"));
		update("report.updateMemStatus", map);
	}
}
