package com.vam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.BoardMapper;
import com.vam.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{

	// 속성 field
	@Autowired
	private BoardMapper mapper;
	// spring이 관리하는 객체 (빈)은 singleton 방법으로 관리되어 1개의 인스턴스가 유지
	// Autowired 통해 new 생성자 호출 없이 해당 객체 사용
	
	
	// enroll 함수에서는 boardMapper 인스턴스 사용하는데
	// 그 인스턴스를 이 함수 안에서 사용하는 것이 아니라 외부에서 주입 받아서 사용.
	// 낮은 결합도를 위해서
	@Override
	    public void enroll(BoardVO board) {
	        
	        mapper.enroll(board);
	        
	 }


	@Override
	public List<BoardVO> getList() {
		return mapper.getList();
	}


	@Override
	public BoardVO getPage(int bno) {
		return mapper.getPage(bno);
	}


	@Override
	public int modify(BoardVO board) {
		return mapper.modify(board);
	}

}
