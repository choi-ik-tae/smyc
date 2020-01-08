package kh.spring.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.ClosetDAO;
import kh.spring.dao.DressDAO;
import kh.spring.dao.DressImgDAO;
import kh.spring.dto.ClosetDTO;
import kh.spring.dto.DressDTO;
import kh.spring.dto.DressImgDTO;

@Service
public class ClosetService {
	
	@Autowired
	private DressDAO ddao;

	@Autowired
	private DressImgDAO dmdao;
	
	@Autowired
	private ClosetDAO cdao;
	
	// 옷장 등록
	public int closetUpload(ClosetDTO dto) {
		return cdao.insert(dto);
	}
	// 옷장 번호 및 이미지 가져오기
	public List<ClosetDTO> closetSeleteNoByEmail(String email) {
		return cdao.selectNoByEmail(email);
	}
	// 옷 등록
	@Transactional("txManager")
	public void dressUpload(DressDTO dto, DressImgDTO fdto, MultipartFile file, String path, String nick) {
		int result = ddao.insert(dto);

		System.out.println(file.getOriginalFilename());

		// 이미지 DB 저장 및 서버 저장
		if (result > 0) {
			int seq = ddao.selectNo().get(0).getNo();
			File filePath = new File(path);

			if (!filePath.exists()) {
				filePath.mkdir();
			}

			String oriName = file.getOriginalFilename();
			String sysName = System.currentTimeMillis() + "_" + oriName;
			fdto.setOri_name(oriName);
			fdto.setSys_name(sysName);
			fdto.setPath("/files/"+nick+"/"+sysName);
			try {
				file.transferTo(new File(path + "/" + sysName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			fdto.setD_no(seq);
			dmdao.insertImgs(fdto);
		}
	}
	// 선택한 옷장정보 가져오기
	public ClosetDTO closetSelectByName(String name) {
		return cdao.selectByName(name);
	}
	// 옷 정보 가져오기 선택한 옷장
	public List<DressDTO> dressSelectByCloset(int num) {
		return ddao.selectByCloset(num);
	}
	// 선택한 옷장 카테고리 별 정보 가져오기
	public List<DressDTO> dressSelectByCategory(String category,int c_no) {
		return ddao.selectByCategory(category,c_no);
	}
	// 선택한 옷장 카테고리 별 옷 이미지경로 가져오기
	// 상의
	public List<DressImgDTO> topImgSelect(String closet,String category) {
		ClosetDTO cs = closetSelectByName(closet);
		List<DressDTO> list = dressSelectByCategory(category, cs.getNo());
		List<DressImgDTO> topImgList = new ArrayList<DressImgDTO>();
		
		for(DressDTO tmp : list) {
			int num = tmp.getNo();
			DressImgDTO target = dmdao.selectPathByDress(num);
			
			topImgList.add(target);
		}
		return topImgList;
	}
	// 하의
	public List<DressImgDTO> pantsImgSelect(String closet,String category) {
		ClosetDTO cs = closetSelectByName(closet);
		List<DressDTO> list = dressSelectByCategory(category, cs.getNo());
		List<DressImgDTO> pantsImgList = new ArrayList<DressImgDTO>();
		
		for(DressDTO tmp : list) {
			int num = tmp.getNo();
			DressImgDTO target = dmdao.selectPathByDress(num);
			
			pantsImgList.add(target);
		}
		return pantsImgList;
	}
	// 신발
	public List<DressImgDTO> shoesImgSelect(String closet,String category) {
		ClosetDTO cs = closetSelectByName(closet);
		List<DressDTO> list = dressSelectByCategory(category, cs.getNo());
		List<DressImgDTO> shoesImgList = new ArrayList<DressImgDTO>();
		
		for(DressDTO tmp : list) {
			int num = tmp.getNo();
			DressImgDTO target = dmdao.selectPathByDress(num);
			
			shoesImgList.add(target);
		}
		return shoesImgList;
	}
	// 액세서리
	public List<DressImgDTO> accImgSelect(String closet,String category) {
		ClosetDTO cs = closetSelectByName(closet);
		List<DressDTO> list = dressSelectByCategory(category, cs.getNo());
		List<DressImgDTO> accImgList = new ArrayList<DressImgDTO>();
		
		for(DressDTO tmp : list) {
			int num = tmp.getNo();
			DressImgDTO target = dmdao.selectPathByDress(num);
			
			accImgList.add(target);
		}
		return accImgList;
	}
}
