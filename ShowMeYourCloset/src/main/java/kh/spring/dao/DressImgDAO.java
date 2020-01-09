package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.DressImgDTO;

@Repository
public class DressImgDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	// 옷이미지 등록
	public int insertImgs(DressImgDTO fdto) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("d_no",fdto.getD_no());
		parm.put("ori_name",fdto.getOri_name());
		parm.put("sys_name",fdto.getSys_name());
		parm.put("path",fdto.getPath());
		
		return sst.insert("DressImg.insert", parm);
	}
	// 선택한 옷 이미지 경로 가져오기
	public DressImgDTO selectPathByDress(int num) {
		return sst.selectOne("DressImg.selectByDress",num);
	}
	// 사용자 옷 이미지 경로 전체 가져오기
	public List<String> selectPathByEmail(String email) {
		return sst.selectList("DressImg.selectByEmail",email);
	}
	
}
