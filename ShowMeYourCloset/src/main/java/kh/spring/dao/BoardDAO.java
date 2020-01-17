package kh.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.BoardDTO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	// help게시판 전체 글 가져오기
	public List<BoardDTO> helpBoardSelectAll(){
		return sst.selectList("Board.helpBoardSelectAll");
	}
	
	// help게시판 등록
	public int helpBoardInsert(BoardDTO dto) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("email",dto.getEmail());
		parm.put("nick",dto.getNickname());
		parm.put("title",dto.getTitle());
		parm.put("contents",dto.getContents());
		
		return sst.insert("Board.helpBoardInsert",parm);
	}
	
	// help게시판 네비 별 페이지 가져오기
	public List<BoardDTO>selectByPage(int start, int end){
		Map<String, Object> parm = new HashMap<>();
		parm.put("start",start);
		parm.put("end",end);
		
		return sst.selectList("Board.selectByPage", parm);
		
	}
	
	// help게시판 디테일
	public BoardDTO helpBoardDetailPage(int no){
		return sst.selectOne("Board.helpBoardDetailPage", no);
	}

}
