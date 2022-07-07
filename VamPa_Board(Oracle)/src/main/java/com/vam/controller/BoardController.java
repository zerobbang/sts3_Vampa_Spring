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
import com.vam.model.Criteria;
import com.vam.model.PageMakeDTO;
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
    // 원래 getList를 불러올거면 Criteria 데이터 타입이 필요하지 않다.
    // 그런데 우리는 페이징 기능 구현 하면서 getList함수를 사용하는 것이 아니라 getListPaging함수를 사용할 것이기 때문에
    // 그 함수의 생성자에 맞춰서 바꿔준다.
    // total 추가
    public void boardListGET(Model model,Criteria cri) {
    	// Criteria에 pageNum이 있고 get.jsp에는 bno가 있다.
    	
    	// model 객체는 controller 에서 생성된 데이터를 담아 view 로 전달할 때 사용하는 객체
    	// servlet의 request.setAttribute()와 비슷한 역할을 한다.
        log.info("게시판 목록 페이지 진입");
        
        // model.addAttribute("list", bservice.getList());
        // 원래는 위 코드 였지만 이제 페이징 기능을 구현하면서 파라미터로 Criteria를 사용하기 때문에
        // 이에 맞게 getListPaging으로 넘겨준다.
        model.addAttribute("list", bservice.getListPaging(cri));
        // list에 bservice.getList()값을 담아 셋팅한다.
        
        int total = bservice.getTotal(cri);
        
        PageMakeDTO pageMake = new PageMakeDTO(cri, total);
        model.addAttribute("pageMaker",pageMake);
        
    }
	// servlet-context를 통해서 /WEB-INF/views/board/list.jsp로 리턴한다.
	
    
	@GetMapping("/enroll")
	public void boardEnrollGET() {
		log.info("게시판 등록 페이지 진입");
	}

	
	
	// GetMapping은 요청을 받으면 화면을 띄워준다
	// PostMapping은 처리값을 받아와서 처리한다.
	
	// 게시글 등록 
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
	
	
	
	// 게시글 상세 조회
	// GET 요청은 페이지 이동이 거듭되는 동안 이전 페이지들의 요청 정보를 기억하고 있어야 한다.
	// url 파라미터가 누적되어 전달되는데 이런 기법을 URL Rewrite 처리 한다.
	@GetMapping("/get")
	public void boardGetPage(int bno, Model model,Criteria cri) {
		model.addAttribute("pageInfo",bservice.getPage(bno));
		// pageNum, amount 넘겨주기
		model.addAttribute("cri",cri);

	}
	
	
	// 수정 페이지 이동
	@GetMapping("/modify")
    public void boardModifyGET(int bno, Model model, Criteria cri) {
        
        model.addAttribute("pageInfo", bservice.getPage(bno));
        // 수정 페이지로 넘어갈때도 pageNum, amount를 넘겨준다.
        model.addAttribute("cri",cri);
        
    }
	
	/* 페이지 수정 */
    @PostMapping("/modify")
    public String boardModifyPOST(BoardVO board, RedirectAttributes rttr) {
        
        bservice.modify(board);
        
        rttr.addFlashAttribute("result", "modify success");
        
        return "redirect:/board/list";
        
    }
    
    
    // 게시글 삭제
    @PostMapping("/delete")
    public String boardDeletePOST(int bno, RedirectAttributes rttr) {
    	bservice.delete(bno);
    	rttr.addFlashAttribute("result","delete success");
    	return "redirect:/board/list";
    }
	

}