package com.yedam.app.emp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.emp.domain.DeptVO;
import com.yedam.app.emp.service.DeptService;

@Controller
public class DeptController {
	
	@Autowired DeptService deptService;

	// 부서관리 페이지
	@GetMapping("dept")
	public String dept() {
		return "emp/dept";
	}
	
	
	// ajax: 목록, 등록, 수정, 삭제
	@GetMapping("deptList")
	@ResponseBody
	public List<DeptVO> deptList() {
		return deptService.getDeptList();
	}
	
}
