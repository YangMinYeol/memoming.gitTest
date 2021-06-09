package solo.board.report.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import solo.common.dao.AbstractDAO;

@Repository("reportDAO") // 해당 클래스를 루트 컨테이너에 빈객체로 생성해주는 어노테이션
public class ReportDAO extends AbstractDAO {
	
	// 신고 리스트 보기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> openAdminReport(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("report.selectReportList", map);
	}
	   
	// 신고 등록
	public void insertReport(Map<String, Object> map)throws Exception{
		insert("report.insertReport", map);
	}
	    
	// 게시글 신고목록
	@SuppressWarnings("unchecked")
	public Map<String, Object>selectBoardReport(Map<String, Object> map)throws Exception{
		return (Map<String, Object>)selectOne("report.selectBoardReport", map);
	}
	      
	// 댓글 신고목록
	@SuppressWarnings("unchecked")
	public Map<String, Object>selectCommentReport(Map<String, Object> map)throws Exception{
		return (Map<String, Object>)selectOne("report.selectCommentReport", map);
	}
	
	// 댓글 신고등록
	public void insertCommentReport(Map<String, Object> map) throws Exception{
		insert("report.insertCommentReport", map);
	}

	// 신고 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectReportDetail(Map<String, Object> map)throws Exception{
		return (Map<String, Object>) selectOne ("report.selectReportDetail", map);
	}
	   
	// 신고 상태업데이트
	public void updateAdminReport(Map<String, Object> map)throws Exception{
		update("report.updateStatus", map);
	}
	   
	// 회원 상태업데이트
	public void updateMemWarning(Map<String, Object> map)throws Exception{
		System.out.println(map.get("REPORT_MEM_NUM1"));
		update("report.memWarning", map);
	}
	   
	// 회원 상태업데이트2
	public void updateMemStatus(Map<String, Object> map)throws Exception{
		System.out.println(map.get("REPORT_MEM_NUM1"));
		update("report.updateMemStatus", map);
	}
}
