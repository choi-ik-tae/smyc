package kh.spring.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.ClosetDAO;
import kh.spring.dao.DressDAO;
import kh.spring.dto.ClosetDTO;
import kh.spring.dto.DressDTO;
import kh.spring.dto.DressImgDTO;

@Service
public class ClosetService {
	
	@Autowired
	private DressDAO ddao;

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
	public void dressUpload(DressDTO dto, DressImgDTO fdto, MultipartFile file, String path) {
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
			try {
				file.transferTo(new File(path + "/" + sysName));
			} catch (Exception e) {
				e.printStackTrace();
			}
			fdto.setD_no(seq);
			ddao.insertImgs(fdto);
		}
	}

	// 옷 정보 가져오기

	// 옷장 정보 가져오기
}
