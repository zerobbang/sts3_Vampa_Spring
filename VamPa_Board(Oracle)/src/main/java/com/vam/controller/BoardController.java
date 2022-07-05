package com.vam.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vam.model.BoardVO;
import com.vam.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService bservice;
	

	
	
	// log 메서드를 사용할 수 있도록 한다.
	// lombok은 어노테이션으로 가능 @log4j
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	 /* 게시판 목록 페이지 접속 */
    @GetMapping("/list")
    // => @RequestMapping(value="list", method=RequestMethod.GET)
    public void boardListGET(Model model) {
        
        log.info("게시판 목록 페이지 진입");
        
        model.addAttribute("list", bservice.getList());
        // list에 bservice.getList()값을 담아 셋팅한다.
        
    }
	// servlet-context를 통해서 /WEB-INF/views/board/list.jsp로 리턴한다.
	
    
	@GetMapping("/enroll")
	public void boardEnrollGET() {
		log.info("게시판 등록 페이지 진입");
	}
	
	
	// GetMapping은 요청을 받으면 화면을 띄워준다
	// PostMapping은 처리값을 받아와서 처리한다.
	
	// 게시판 등록 
	// 목록 페이지로 이동 처리
	@PostMapping("/enroll")
	public String boardEnrollPOST(BoardVO board, RedirectAttributes rttr) {
		log.info("BoardVO : "+board);
		
		bservice.enroll(board);
		
		rttr.addFlashAttribute("result", "enroll success");
		// addFlashAttribute는 post 형식으로 전달
		// flash이기 때문에 휘발성
		
		return "redirect:/board/list";
	}
	
}