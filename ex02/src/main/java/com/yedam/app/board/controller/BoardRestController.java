package com.yedam.app.board.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.board.domain.BoardVO;

@Controller
public class BoardRestController {

	@RequestMapping("test1")
	@ResponseBody
	public Map<String, Object> test1(@RequestParam String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		
		if(id.equals("admin")) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		return map;
	}
	
	@PostMapping(value = "test2")	//test?id=choi -> /test/choi
	
	@ResponseBody
	public BoardVO test2(BoardVO vo) {
		vo.setBno(10);
		vo.setContent("안녕이니?");
		vo.setRegdate(new Date());
		return vo;
	}
}
