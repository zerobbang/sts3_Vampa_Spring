package com.vam.mapper;

import java.util.List;

import com.vam.model.BoardVO;
import com.vam.model.Criteria;

public interface BoardMapper {
	
	// 글 등록 함수
	public void enroll(BoardVO board);
	
	// 게시글 목록
	public List<BoardVO> getList();
	
	// 게시글 상세 조회
	public BoardVO getPage(int bno);
	
	// 게시글 수정
	public int modify(BoardVO board); 
	
	// 게시글 삭제
	public int delete(int bno);
	
	 /* 게시판 목록(페이징 적용) */
    public List<BoardVO> getListPaging(Criteria cri);
    // 함수 getListPaging이 Criteria의 참조형 변수(객체)를 cri라는 변수로 받아 BoardVO의 리스트 형태로 반환하는 약속 정의
	
    
    // 총 게시판 갯수
    public int getTotal();

}
