package kh.spring.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.BoardDAO;
import kh.spring.dao.BoardLikeDAO;
import kh.spring.dao.ClosetDAO;
import kh.spring.dao.CommentDAO;
import kh.spring.dao.DressDAO;
import kh.spring.dao.DressImgDAO;
import kh.spring.dao.StyleDAO;
import kh.spring.dto.ClosetDTO;
import kh.spring.dto.DressDTO;
import kh.spring.dto.DressImgDTO;
import kh.spring.dto.StyleDTO;

@Service
public class ClosetService {

	@Autowired
	private DressDAO ddao;

	@Autowired
	private DressImgDAO dmdao;

	@Autowired
	private ClosetDAO cdao;

	@Autowired 
	private StyleDAO sdao;
	
	@Autowired
	private BoardDAO bdao;
	
	@Autowired
	private BoardLikeDAO ldao;
	
	@Autowired
	private CommentDAO cmdao;

	// 옷장 등록
	public int closetUpload(ClosetDTO dto) {
		return cdao.insert(dto);
	}
	// 옷장 정보 가져오기
	public List<ClosetDTO> closetSeleteByEmail(String email) {
		return cdao.selectByEmail(email);
	}
	// 옷장 이름 가져오기
	public List<String> closetSelectNameByEmail(String email) {
		return cdao.selectNameByEmail(email);
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
	public int dressDelete(int no,String path,String category,String itemPath) {
		int result = 0;
	
		
		if(dmdao.selectImgByDress(no) != null) {
			String target = path + "/" + dmdao.selectImgByDress(no).getSys_name();
	
			
			File file = new File(target);
			if( file.exists() ){
				List<StyleDTO> s_no = sdao.selectByDelete(category, itemPath);
				if(s_no.size() > 0) {
					for(StyleDTO tmp : s_no) {
						int b_no = bdao.boastSelectByDelete(tmp.getNo());
						if(file.delete()){ 
							System.out.println("파일삭제 성공");
							// 옷이 스타일에 등록 되어있을 때 그 스타일에 따른 자랑게시물 삭제
							if(tmp.getNo() > 0) {
								// 코디에 옷이 하나도 없을때 자랑게시물 삭제
								StyleDTO sTarget = sdao.detailStyle(tmp.getNo());
								if(sTarget.getTop() == null && sTarget.getPants() == null && sTarget.getAcc() == null && sTarget.getShoes() == null) {
									bdao.boastDeleteByStyle(tmp.getNo());
									cmdao.boardDelete(b_no);
									ldao.likeDelete(b_no);
								}
							}
							sdao.deleteItem(category, itemPath);
							ddao.delete(no);
							dmdao.delete(no);
							result = 1;
							break;
						}else{ 
							result = 0;
						}
					}
				}else {
					ddao.delete(no);
					dmdao.delete(no);
					result = 1;
				}
			}else{ 
				System.out.println("파일이 존재하지 않습니다.");
				result = 0;
			}
		}
		System.out.println("여긴 어딘데?");
		return result;
	}
	// 옷 정보 수정 및 이미지 교체
	@Transactional("txManager")
	public int dressModify(DressDTO dto, DressImgDTO fdto, MultipartFile file, String path, String nick, String itemSysName) {
		int result = ddao.update(dto);
		if (result > 0) {
			int seq = dto.getNo();
			
			File target = new File(path+"/"+fdto.getSys_name());
			if (target.exists()) {
				System.out.println("이미지 유지 : "+target);
				return result;
			} else {
				target = new File(path+"/"+itemSysName);
				System.out.println("이미지 변경 : "+target);
				if(target.delete()){ 
					System.out.println("파일삭제 성공");
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
					// 옷 수정 시 코디 아이템 수정
					sdao.updateItem(dto.getCategory(), "/files/" + nick + "/" + itemSysName, "/files/" + nick + "/" + sysName);
					dmdao.update(fdto);
				}else{ 
					System.out.println("파일삭제 실패");
					result = 0;
				}
			}
		}
		return result;
	}
	// 옷장 수정모드 - 옷 삭제
	@Transactional("txManager")
	public void closetDeleteDress(List<Integer> no,String path) {
		if(no.size() > 0) {
			for(int tmp : no) {
				if(dmdao.selectImgByDress(tmp) != null) {
					String target = path + dmdao.selectImgByDress(tmp).getPath();
					File file = new File(target);
					if( file.exists() ){ 
						// 옷 삭제 시 코디에서 옷 삭제
						sdao.deleteItem(ddao.selectDress(tmp).getCategory(), dmdao.selectImgByDress(tmp).getPath());
						if(file.delete()){ 
							System.out.println("파일삭제 성공");
							ddao.delete(tmp);
							dmdao.delete(tmp);
						}else{ 
							System.out.println("파일삭제 실패");
						} 
					}else{ 
						System.out.println("파일이 존재하지 않습니다.");
					}
				}
			}
		}
	}
	// 옷장 수정모드 - 옷장 이름, 이미지 변경
	public void closetUpdate(int no,String img, String name, String pub) {
		cdao.update(no, name, img, pub);
	}
	// 이미지 경로 통해서 옷 상세정보 가져오기
	public DressDTO pathDetailDress(String path) {
		return ddao.pathDetailDress(path);
	}
	// 옷장 수정모드 - 옷장 삭제
	public void closetDelete(int c_no,String email,String path) {
		List<DressDTO> dress = ddao.selectByCloset(c_no);
		List<Integer> dressNo = new ArrayList<>();
		// 옷장 속 옷 번호 담기
		for(DressDTO tmp : dress) {
			dressNo.add(tmp.getNo());
		}
		if(dressNo.size() > 0) {
			// 옷장 별 이미지 삭제
			for(int tmp : dressNo) {
				if(dmdao.selectImgByDress(tmp) != null) {
					String target = path + dmdao.selectImgByDress(tmp).getPath();
					File file = new File(target);
					if( file.exists() ){ 
						// 옷 삭제 시 코디에서 옷 삭제
						sdao.deleteItem(ddao.selectDress(tmp).getCategory(), dmdao.selectImgByDress(tmp).getPath());
						if(file.delete()){ 
							System.out.println("파일삭제 성공");
							ddao.delete(tmp);
							dmdao.delete(tmp);
							cdao.delete(c_no, email);
						}else{ 
							System.out.println("파일삭제 실패");
						} 
					}else{ 
						System.out.println("파일이 존재하지 않습니다.");
					}
				}
			}
		} else {
			cdao.delete(c_no, email);
		}
	}
}
