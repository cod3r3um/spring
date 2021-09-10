package com.yedam.app.emp.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.emp.domain.EmpVO;
import com.yedam.app.emp.service.DeptService;
import com.yedam.app.emp.service.EmpService;
import com.yedam.app.emp.service.JobsService;

@Controller
@RequestMapping("/emp/*")
public class EmpController {
	
	@Autowired EmpService empService;
	@Autowired JobsService jobsService;
	@Autowired DeptService deptService;

	@ModelAttribute("opt")
	public Map<String, Object> jobs() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jobs", jobsService.getJobList());
		map.put("dept", deptService.getDeptList());
		return map;
	}
	
	// 등록폼
	@GetMapping("insertemp")	// url 명
	public String insertEmp (EmpVO vo) {
		return "emp/insert";	// jsp 명
	}
	
	// 수정폼
	@GetMapping("updateEmp")
	public String insertFormEmp(EmpVO vo, Model model) {
		model.addAttribute("emp", empService.read(vo));
		return "emp/insert";
		
	}
	
	// 사원검색
	@RequestMapping("empSearch")
	public String empSearch(Model model, EmpVO empVo) {
		model.addAttribute("empList", empService.getList());
		return "emp/empSearch";
	}
	
	// 사원검색 ajax
	@RequestMapping("ajaxEmp")
	@ResponseBody
	public EmpVO ajaxEmp(EmpVO vo) {
		return empService.read(vo);
	}
	
	@RequestMapping("ajaxEmail")
	@ResponseBody
	public EmpVO ajaxEmail(EmpVO vo) {
		return empService.read(vo);
	}
	

}
