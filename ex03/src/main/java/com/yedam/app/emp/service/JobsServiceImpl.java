package com.yedam.app.emp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.emp.domain.JobsVO;
import com.yedam.app.emp.mapper.JobsMapper;

@Service
public class JobsServiceImpl implements JobsService{

	@Autowired JobsMapper jobsMapper;
	public List<JobsVO> getJobList(){
		return jobsMapper.getJobList();
	}
}
