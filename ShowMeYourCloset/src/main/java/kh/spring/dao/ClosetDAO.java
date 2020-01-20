package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ClosetDTO;

@Repository
public class ClosetDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	// 옷장 등록
	public int insert(ClosetDTO dto) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("email",dto.getEmail());
		parm.put("name",dto.getName());
		parm.put("memo",dto.getMemo());
		parm.put("pub",dto.getPub());
		parm.put("img",dto.getImg());
		
		return sst.insert("Closet.insert", parm);
	}
	// 옷장 정보 가져오기
	public List<ClosetDTO> selectByEmail(String email) {
		return sst.selectList("Closet.selectByEmail", email);
	}
	// 옷장 이름 가져오기
	public List<String> selectNameByEmail(String email) {
		return sst.selectList("Closet.selectNameByEmail", email);
	}
	// 사용자가 옷장 선택 했을 때 정보 가져오기
	public ClosetDTO selectByName(String name,String email) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("email",email);
		parm.put("name",name);
		return sst.selectOne("Closet.selectByName", parm);
	}
	// 옷이 어느 옷장에 있는가
	public ClosetDTO selectByDress(int no) {
		return sst.selectOne("Closet.selectByDress", no);
	}
	// 옷장 수정
	public int update(int no, String name, String img,String pub) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("no",no);
		parm.put("name",name);
		parm.put("img",img);
		parm.put("pub",pub);
		return sst.update("Closet.update",parm);
	}
	// 옷장 삭제
	public int delete(int no,String email) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("no",no);
		parm.put("email",email);
		return sst.delete("Closet.delete",parm);
	}
	
}
