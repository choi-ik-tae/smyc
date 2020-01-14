package kh.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.BoardDTO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<BoardDTO> helpBoardSelectAll(){
		return sst.selectList("Board.helpBoardSelectAll");
	}

}
