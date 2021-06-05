package solo.member.join.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import solo.member.join.dao.JoinDAO;

@Service("joinService") // 서비스 레이어 클래스들에 사용되어지는 어노테이션이다.
public class JoinServiceImpl implements JoinService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="joinDAO")
	private JoinDAO joinDAO;
	
	@Override
	public List<Map<String, Object>> selectJoinList(Map<String, Object> map) throws Exception {
		return joinDAO.selectJoinList(map);
	}
	
	// 회원가입
	@Override
	public void insertJoin(Map<String, Object> map) throws Exception {
		joinDAO.insertJoin(map);
	}
	
	// 아이디 중복체크
	@Override
	public int selectIdCheck(Map<String, Object> map) throws Exception {
		return joinDAO.selectIdCheck(map);
	}
	
	// 닉네임 중복체크
	@Override
	public int selectNickCheck(Map<String, Object> map) throws Exception {
		return joinDAO.selectNickCheck(map);
	}

}
