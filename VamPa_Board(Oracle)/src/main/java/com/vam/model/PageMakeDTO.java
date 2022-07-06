package com.vam.model;

import lombok.Data;

@Data
public class PageMakeDTO {
	
	/* 시작 페이지 */
    private int startPage;
    
    /* 끝 페이지 */
    private int endPage;
    
    /* 이전 페이지, 다음 페이지 존재유무 */
    private boolean prev, next;
    
    /*전체 게시물 수*/
    private int total;
    
    /* 현재 페이지, 페이지당 게시물 표시수 정보 */
    private Criteria cri;
    // Criteria의 pageNum(현재 페이지 숫자)변수 값을 얻기 위해 선언
    
	/*
	 * public PageMakeDTO(Criteria cri, int total) { this.cri = cri; this.total =
	 * total;
	 * 
	 * // 마지막 페이지 // 1 ~ 10 / 11 ~ 20 처럼 10 단위로 끊어내기 위해 this.endPage =
	 * (int)(Math.ceil(cri.getPageNum()/10))*10;
	 * 
	 * // 시작 페이지 this.startPage = (int)(this.endPage - 9);
	 * 
	 * // 전체 마지막 페이지 // 페이지 수는 짜르는 Amount에 따라 달라지기 때문에 다음과 같이 처리 해준다. int realEnd =
	 * (int)(Math.ceil(total*1.0/cri.getAmount()));
	 * 
	 * // 전체 마지막 페이지가 화면 출력 마지막 페이지보다 작은 경우, 보이는 페이지 값 조정 // 만약 현재 page가 14인데 마지막
	 * realEnd가 18이면 // 페이지 수를 20까지 보여주는 것이 아니라 realEnd값으로 셋팅해서 18까지만 보인다.
	 * if(realEnd <this.endPage ) { this.endPage = realEnd; }
	 * 
	 * // 시작 페이지 값이 1보다 큰 경우 this.prev = this.startPage > 1; // 마지막 페이지 값이 실제 페이지 수
	 * 보다 작은 경우 this.next = this.endPage < realEnd ; }
	 */
    
    /* 생성자 */
    public PageMakeDTO(Criteria cri, int total) {
        
        this.cri = cri;
        this.total = total;
        
        /* 마지막 페이지 */
        this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
        /* 시작 페이지 */
        this.startPage = this.endPage - 9;
        
        /* 전체 마지막 페이지 */
        int realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount()));
        
        /* 전체 마지막 페이지(realend)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정 */
        if(realEnd < this.endPage) {
            this.endPage = realEnd;
        }
        
        /* 시작 페이지(startPage)값이 1보다 큰 경우 true */
        this.prev = this.startPage > 1;
        
        /* 마지막 페이지(endPage)값이 1보다 큰 경우 true */
        this.next = this.endPage < realEnd;
        
        
    }
 

}
