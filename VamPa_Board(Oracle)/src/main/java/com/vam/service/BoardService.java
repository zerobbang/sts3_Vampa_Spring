package com.vam.service;

import java.util.List;

import com.vam.model.BoardVO;
import com.vam.model.Criteria;

public interface BoardService {

    /* 게시글 등록 */
    public void enroll(BoardVO board);
    
    // 게시글 목록
    public List<BoardVO> getList();
    
    // 게시글 상세 조회
    public BoardVO getPage(int bno);
    
    // 게시글 수정
    public int modify(BoardVO board);
    
    // 게시글 삭제
    public int delete(int bno);
    
    // 페이징
    public List<BoardVO> getListPaging(Criteria cri);
    
    // 게시글 총 개수
    public int getTotal(Criteria cri);
}
