package com.yedam.app.emp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.emp.domain.DeptVO;
import com.yedam.app.emp.mapper.DeptMapper;

@Service
public class DeptServiceImpl implements DeptService{
	
	@Autowired DeptMapper deptMapper;

	@Override
	public List<DeptVO> getDeptList() {
		return deptMapper.getDeptList();
	}

	
}
