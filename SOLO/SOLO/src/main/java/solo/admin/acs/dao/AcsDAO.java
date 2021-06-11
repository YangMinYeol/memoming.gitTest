package solo.admin.acs.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import solo.common.dao.AbstractDAO;

@Repository // 해당 클래스를 루트컨테이너에 빈객체로 생성해주는 어노테이션
public class AcsDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> acsBoardList(Map<String, Object> map)throws Exception{
		return (List<Map<String, Object>>) openBoardList("acs.acsBoardList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> acsDetail(Map<String, Object> map)throws Exception{
		return (Map<String, Object>) selectOne("acs.acsDetail", map);
	}
	
	public void updateHitCnt(Map<String, Object> map) throws Exception{ 
		update("acs.updateHitCnt", map); 
	}
	
	public void insertAcs(Map<String, Object> map)throws Exception{
		insert("acs.insertAcs", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> updateAcsForm(Map<String, Object> map)throws Exception{
		return (Map<String, Object>) selectOne("acs.updateForm", map);
	}
	
	public void updateAcs(Map<String, Object> map)throws Exception{
		update("acs.updateAcs", map);
	}
	
	public void deleteAcs(Map<String, Object> map)throws Exception{
		update("acs.deleteAcs", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> allList(Map<String, Object> map)throws Exception{
		return (List<Map<String, Object>>)openBoardList("acs.acsBoardList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> notice(Map<String, Object> map)throws Exception{
		return (List<Map<String, Object>>)openBoardList("acs.notice", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> event(Map<String, Object> map)throws Exception{
		return (List<Map<String, Object>>)openBoardList("acs.event", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> SearchAcs(Map<String, Object> map)throws Exception{
		return (List<Map<String, Object>>)openBoardList("acs.SearchAcs", map);
	}

}

