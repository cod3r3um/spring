package com.yedam.app.emp.service;

import java.util.List;

import com.yedam.app.emp.domain.EmpVO;

public interface EmpService {
	
	// 등록 ( void 혹은 int )
	public int insert(EmpVO vo);
	
	// 수정
	public int update(EmpVO vo);
	
	// 삭제
	public int delete(EmpVO vo);
	
	// 단건조회
	public EmpVO read(EmpVO vo);
	
	// 전체조회
	public List<EmpVO> getList();
}
