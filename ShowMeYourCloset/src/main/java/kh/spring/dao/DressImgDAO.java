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
	public DressImgDTO selectImgByDress(int d_no) {
		return sst.selectOne("DressImg.selectByDress",d_no);
	}
	// 사용자 옷 이미지 경로 전체 가져오기
	public List<String> selectPathByEmail(String email, int c_no) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("email",email);
		parm.put("c_no",c_no);
		
		return sst.selectList("DressImg.selectByEmail",parm);
	}
	// 사용자 선택 옷장 카테고리 별 이미지 경로 추출
	public List<DressImgDTO> selectPathByCategory(String email,String category) {
		// 미완성
		return sst.selectList("DressImg.selectByCateogry");
	}
	// 옷 이미지 삭제
	public int delete(int d_no) {
		return sst.delete("DressImg.delete", d_no);
	}
	// 옷 이미지 수정
	public int update(DressImgDTO fdto) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("d_no",fdto.getD_no());
		parm.put("ori_name",fdto.getOri_name());
		parm.put("sys_name",fdto.getSys_name());
		parm.put("path",fdto.getPath());
		
		return sst.insert("DressImg.update", parm);
	}
}
