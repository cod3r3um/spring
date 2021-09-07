package com.yedam.app.board;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.mapper.ReplyMapper;
import com.yedam.app.board.service.ReplyService;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class ReplyMapperClient {
	
	@Autowired ReplyMapper replyMapper;
	@Autowired ReplyService replyService;

	@Test
	public void getList() {
		Criteria cri = new Criteria(1, 20);
		log.info(replyService.getList(cri, 186L).toString());
	}
}
