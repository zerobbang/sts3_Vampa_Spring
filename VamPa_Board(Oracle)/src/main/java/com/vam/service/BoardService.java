package com.vam.service;

import java.util.List;

import com.vam.model.BoardVO;

public interface BoardService {

    /* 게시글 등록 */
    public void enroll(BoardVO board);
    
    // 게시글 목록
    public List<BoardVO> getList();
    
    // 게시글 상세 조회
    public BoardVO getPage(int bno);
    
    // 게시글 수정
    public int modify(BoardVO board);
}
