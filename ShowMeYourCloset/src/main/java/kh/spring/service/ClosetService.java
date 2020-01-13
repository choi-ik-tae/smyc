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
	// 옷장 정보 가져오기
	public List<ClosetDTO> closetSeleteByEmail(String email) {
		return cdao.selectByEmail(email);
	}
	// 옷 등록
	@Transactional("txManager")
	public void dressUpload(DressDTO dto, DressImgDTO fdto, MultipartFile file, String path, String nick, String rootPath) {
		int result = ddao.insert(dto);
		// 이미지 DB 저장 및 서버 저장
		if (result > 0) {
			int seq = ddao.selectNo().get(0).getNo();
			File filePath = new File(path);
			File fileRootPath = new File(rootPath);
			
			if(!fileRootPath.exists()) {
				fileRootPath.mkdir();
			}
			if (!filePath.exists()) {
				filePath.mkdir();
			}

			String oriName = file.getOriginalFilename();
			String sysName = System.currentTimeMillis() + "_" + oriName;
			fdto.setOri_name(oriName);
			fdto.setSys_name(sysName);
			fdto.setPath("/files/" + nick + "/" + sysName);
			try {
				file.transferTo(new File(path + "/" + sysName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			fdto.setD_no(seq);
			dmdao.insertImgs(fdto);
		}
	}
	// 사용자 옷 이미지 전체 가져오기
	public List<String> selectImgByEmail(String email,int c_no) {
		List<String> imgList = dmdao.selectPathByEmail(email, c_no);

		return imgList;
	}
	// 사용자가 옷장 선택했을 때 정보 가져오기
	public ClosetDTO closetSelectByName(String name,String email) {
		return cdao.selectByName(name,email);
	}
	// 선택한 옷장 옷 정보 가져오기
	public List<DressDTO> dressSelectByCloset(int c_no) {
		List<DressDTO> dressList = ddao.selectByCloset(c_no);

		return dressList;
	}
	// 선택한 옷장 카테고리 별 정보 가져오기
	public List<DressDTO> dressSelectByCategory(String email,String category,int c_no) {
		List<DressDTO> dressList = ddao.selectByCategory(email,category,c_no); 

		return dressList;
	}
	// 선택한 옷장 카테고리 별 옷 이미지경로 가져오기
	public List<DressImgDTO> targetImgSelect(String email,int closet,String category) {
		List<DressDTO> list = ddao.selectByCategory(email,category,closet);
		List<DressImgDTO> targetImgList = new ArrayList<DressImgDTO>();		
		
		if(list.size() > 0) { // list null point 값 안주면 널포인트 나는데 해결해야함
			for(DressDTO tmp : list) {
				int num = tmp.getNo();
				DressImgDTO target = dmdao.selectImgByDress(num);
				targetImgList.add(target);
			}
		}
		return targetImgList;
	}
	// 선택한 옷 정보 가져오기
	public DressDTO dressSelectInfo(int no) {
		return ddao.selectDress(no);
	}
	public DressImgDTO dressSelectImg(int d_no) {
		return dmdao.selectImgByDress(d_no);
	}
	// 옷이 어느 옷장에 있는가
	public ClosetDTO closetSelectName(int c_no) {
		return cdao.selectByDress(c_no);
	}
	// 옷 정보 중 계절 문자열 분리해서 배열담기
	public String[] splitDressSeason(int no) {
		String season[] = ddao.selectDress(no).getSeason().split(",");
		return season;
	}
	// 옷 정보 및 이미지 삭제
	@Transactional("txManager")
	public void dressDelete(int no,String path) {
		String target = path + "/" + dmdao.selectImgByDress(no).getSys_name();

		File file = new File(target);
		if( file.exists() ){ 
			if(file.delete()){ 
				System.out.println("파일삭제 성공");
				ddao.delete(no);
				dmdao.delete(no);
			}else{ 
				System.out.println("파일삭제 실패"); 
			} 
		}else{ 
			System.out.println("파일이 존재하지 않습니다."); 
		}
		
	}
}
