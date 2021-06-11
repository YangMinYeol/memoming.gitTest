package solo.admin.amember.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import solo.admin.amember.dao.AdminMemberDAO;

@Service("adminMemberService") // �ش�Ŭ������ ��Ʈ�����̳ʿ� �ش� ��ü�� �������ִ� ����
public class AdminMemberServiceImpl implements AdminMemberService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminMemDAO")
	private AdminMemberDAO adminMemDAO;
	
	public List<Map<String, Object>> selectMemberList (Map<String, Object> map) throws Exception{
		return adminMemDAO.selectMemberList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectMemberSearchList(Map<String, Object> map)throws Exception{
		return adminMemDAO.selectMemberSearchList(map);
	}
	   
	@Override
	public Map<String, Object> openAdminMemberDetail(Map<String, Object> map)throws Exception{
		return adminMemDAO.openAdminMemberDetail(map);
	}
	   
	public void ignoreAdminMember(Map<String, Object> map)throws Exception{
		adminMemDAO.ignoreAdminMember(map);
	}

}
