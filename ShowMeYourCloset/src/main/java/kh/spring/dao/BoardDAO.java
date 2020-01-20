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
	
	// help게시판 검색 페이징
	public List<BoardDTO> helpBoardSearch(int start, int end, String search){
		Map<String, Object> parm = new HashMap<>();
		parm.put("start",start);
		parm.put("end",end);
		parm.put("search","%"+search+"%");
		
		return sst.selectList("Board.helpBoardSearch", parm);
		
	}
	
	// help 게시판 전체 뽑아오기
	public List<BoardDTO> helpBoardAllSearch (String search){
		return sst.selectList("Board.helpBoardAllSearch",search);
	}
	// 조회수 증가
	public int viewCountPlus(int no) {
		return sst.update("Board.viewCountPlus",no);
	}
	// boast 게시판 등록
	public int boastBoardInsert(BoardDTO dto) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("s_no",dto.getS_no());
		parm.put("email",dto.getEmail());
		parm.put("nick",dto.getNickname());
		parm.put("title",dto.getTitle());
		parm.put("contents",dto.getContents());
		
		return sst.insert("Board.boastBoardInsert",parm);
	}
	// boast 게시물 출력
	public List<BoardDTO> boastSelectAll() {
		return sst.selectList("Board.boastSelectAll");
	}
	// boast 게시물 선택
	public BoardDTO boastSelectByNo(int no) {
		return sst.selectOne("Board.boastSelectByNo",no);
	}
	// boast 게시물 삭제
	public int boastDelete(int s_no) {
		return sst.delete("Board.boastDelete", s_no);
	}
	// boast New
	public List<BoardDTO> boastSelectNew() {
		return sst.selectList("Board.boastSelectNew");
	}
	// boast Trendy
	public List<BoardDTO> boastSelectTrendy() {
		return sst.selectList("Board.boastSelectTrendy");
	}
	// boast popular
	public List<Integer> boastSelectPopular() {
		return sst.selectList("Board.boastSelectPopular");
	}
	// boast random
	public List<BoardDTO> boastSelectRandom() {
		return sst.selectList("Board.boastSelectRandom");
	}
	// 자랑 게시판 검색
	public List<BoardDTO> boastBoardSearchAll(String keyWord) {
		return sst.selectList("Board.boastBoardSearchAll","%"+keyWord+"%");
	}
}
