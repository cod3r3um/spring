package com.yedam.app.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.PageVO;
import com.yedam.app.board.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired BoardService boardService;
	
	// 전체조회
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		System.out.println("cri=====" + cri);
		int total = boardService.getTotalCount(cri);
		model.addAttribute("list", boardService.getList(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
	}
	
	// 단건조회 (수정 페이지)
	@GetMapping("/get")
	public void get(Model model, BoardVO board, @ModelAttribute("cri") Criteria cri) {	// bno parameter를 넘겨줄 것 -> 커맨드 개체 ( 파라미터를 담는 vo )
		model.addAttribute("board", boardService.read(board));
	}
	
	// 수정 처리 (수정 페이지로)
	@PostMapping("/modify")
	public String modify(BoardVO vo,
						 @ModelAttribute("cri") Criteria cri,
						 RedirectAttributes rttr) {
		int result = boardService.update(vo);
		if (result == 1 ) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/board/list";	// 파라미터 전달 X
	}
	
	// 등록 페이지
	@GetMapping("/register")
	public void registerForm() {}
	
	// 등록 처리 (목록으로)
	@PostMapping("/register")
	public String register(BoardVO vo, RedirectAttributes rttr) {
		boardService.insert(vo);
		rttr.addFlashAttribute("result", vo.getBno());
		return "redirect:/board/list";	// 파라미터 전달 X
	}
	
	// 삭제 처리 (목록으로)
	@PostMapping("/delete")
	public String delete(BoardVO vo,
						 @ModelAttribute("cri") Criteria cri,
						 RedirectAttributes rttr) {
		int result = boardService.delete(vo);
		if (result == 1 ) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addFlashAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("amount", cri.getAmount());
		return "redirect:/board/list";	// 파라미터 전달 X
	}
	
}
