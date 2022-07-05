package com.vam.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vam.model.BoardVO;

	
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTests {
 
     private static final Logger log = LoggerFactory.getLogger(BoardMapperTests.class);
     
     @Autowired
     private BoardMapper mapper;
     // 인터페이스
 
     @Test
     public void testEnroll() {
         
         BoardVO vo = new BoardVO();
         
         vo.setTitle("mapper test");
         vo.setContent("mapper test");
         vo.setWriter("mapper test");
         
         mapper.enroll(vo);
         
     }
     
     
     // 리스트 출력
     // for 문 , 향상된 for 문 , foreach&람다식
     @Test
     public void testGetList() {
    	 
    	 List list = mapper.getList();
    	 
    	 for(Object a : list) {
    		 log.info(""+a);
    	 }
     }
     
     //게시글 상세 조회
     @Test
     public void testGetPage() {
    	 int bno = 8;
    	 log.info(""+mapper.getPage(bno));
     }
     
     
     @Test
     public void testModify() {
    	 // given, when, then
    	 BoardVO vo = new BoardVO();
    	 vo.setBno(8);
    	 
    	 // 데이터 변경
    	 vo.setTitle("Junit에서 바꾼...");
    	 vo.setContent("안녕하세요");

    	 // 실행
    	 int result = mapper.modify(vo);
    	 // 결과
    	 log.info("수정 결과 : "+result);
     }
     
 
}

