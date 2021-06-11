package solo.admin.amember.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import solo.common.dao.AbstractDAO;

@Repository("adminMemDAO")
public class AdminMemberDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberList (Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectPagingList ("adminMem.selectMemberList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberSearchList (Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectPagingList ("adminMem.selectMemberSearchList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> openAdminMemberDetail (Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne ("adminMem.openAdminMemberDetail", map);
	}
	
	public void ignoreAdminMember (Map<String, Object> map) throws Exception{
		update("adminMem.ignoreAdminMember", map);
	}

}
