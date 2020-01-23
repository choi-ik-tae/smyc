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
		Map<String, Object> parm = new HashMap<>();
		parm.put("search","%"+search+"%");
		return sst.selectList("Board.helpBoardAllSearch",parm);
	}
	//help 게시판 수정
	public int helpBoardUpdate(String title, String contents, int no) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("title",title);
		parm.put("contents",contents);
		parm.put("no",no);
		
		return sst.update("Board.helpBoardUpdate", parm);
	}
	public int helpBoardDelete(int no) {
		return sst.delete("Board.helpBoardDelete",no);
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
	public int boastDelete(int no) {
		return sst.delete("Board.boastDelete", no);
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
	// 게시물 중복 등록 검사
	public BoardDTO boastIsExist(int s_no) {
		return sst.selectOne("Board.boastIsExist",s_no);
	}
	// 자랑게시물 내용 수정
	public int boastModify(int no,String title, String contents) {
		Map<String, Object> parm = new HashMap<>();
		parm.put("no",no);
		parm.put("title",title);
		parm.put("contents",contents);
		
		return sst.update("Board.boastModify",parm);
	}
	// 카테고리 가져오기
	public String selectCategory(int no) {
		return sst.selectOne("Board.selectCategory",no);
	}
	// 내가 쓴 자랑 게시글
	public List<BoardDTO> myBoastSelectAll(String email){
		return sst.selectList("Board.myBoastSelectAll",email);
	}
	// 내가 쓴 도움 게시글
	public List<BoardDTO> myHelpSelectAll(String email){
		return sst.selectList("Board.myHelpSelectAll",email);
	}
}
