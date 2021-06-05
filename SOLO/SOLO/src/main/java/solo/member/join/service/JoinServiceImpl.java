package solo.member.join.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import solo.member.join.dao.JoinDAO;

@Service("joinService") // ���� ���̾� Ŭ�����鿡 ���Ǿ����� ������̼��̴�.
public class JoinServiceImpl implements JoinService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="joinDAO")
	private JoinDAO joinDAO;
	
	@Override
	public List<Map<String, Object>> selectJoinList(Map<String, Object> map) throws Exception {
		return joinDAO.selectJoinList(map);
	}
	
	// ȸ������
	@Override
	public void insertJoin(Map<String, Object> map) throws Exception {
		joinDAO.insertJoin(map);
	}
	
	// ���̵� �ߺ�üũ
	@Override
	public int selectIdCheck(Map<String, Object> map) throws Exception {
		return joinDAO.selectIdCheck(map);
	}
	
	// �г��� �ߺ�üũ
	@Override
	public int selectNickCheck(Map<String, Object> map) throws Exception {
		return joinDAO.selectNickCheck(map);
	}

}
