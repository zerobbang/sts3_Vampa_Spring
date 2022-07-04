package com.vam.model;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	// VO : Value Object
	// db 와 맞게 컬럼 생성 해준다.
	
	 /* 게시판 번호 */
    private int bno;
    
    /* 게시판 제목 */
    private String title;
    
    /* 게시판 내용 */
    private String content;
    
    /* 게시판 작가 */
    private String writer;
    
    /* 등록 날짜 */
    private Date regdate;
    
    /* 수정 날짜 */
    private Date updateDate;

}
