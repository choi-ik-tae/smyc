package kh.spring.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import kh.spring.dto.MembersDTO;

public class MembersDAO {
	
	private SqlSessionTemplate sst;
	
	public int insert(MembersDTO dto) {
		Map<String ,String >parm = new HashMap<>();
		
		
	}

}
