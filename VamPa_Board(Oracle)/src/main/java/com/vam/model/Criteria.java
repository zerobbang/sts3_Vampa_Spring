package com.vam.model;

import lombok.Data;

@Data
public class Criteria {
	
	/* 현재 페이지 */
    private int pageNum;
    
    /* 한 페이지 당 보여질 게시물 갯수 */
    private int amount;
    
    /* 기본 생성자 -> 기봅 세팅 : pageNum = 1, amount = 10 */
    public Criteria() {
        this(1,10);
        // this 이 클래스에서 생성된 인스턴스 
        // this() 생성자
        // 기본 생성자가 밑에 다른 생성자를 호출
        
    }
    
    /* 생성자 => 원하는 pageNum, 원하는 amount */
    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }
    
    // 요청 페이지 숫자가 없으면 사용자 생성자로 넘겨주어 pageNum 1, amount 10으로 설정해준다. 

}
