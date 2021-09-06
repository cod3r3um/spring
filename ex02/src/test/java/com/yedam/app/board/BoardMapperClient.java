package com.yedam.app.board;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.mapper.BoardMapper;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class BoardMapperClient {

	@Autowired BoardMapper boardMapper;
	
	@Test
	public void getList() {
		Criteria cri = new Criteria(1, 20);
		cri.setType("W");
		cri.setKeyword("사샤");
		log.info(boardMapper.getList(cri).toString());
	}
	
	// @Test
	public void insert() {
		// BoardVO 생성
		BoardVO board = new BoardVO();
		
		board.setTitle("이게 진짜 타이틀이야?");
		board.setContent("이게 진짜 내용이야?");
		board.setWriter("작성자겠냐?");
		
		boardMapper.insert(board);
		
		log.info(Long.toString(board.getBno()));
	}
	
	// @Test
	public void read() {
		BoardVO board = new BoardVO();
		
		board.setBno(6);
		
		board = boardMapper.read(board);
		
		log.info(board.toString());
	}
	
	// @Test
	public void update() {
		BoardVO board = new BoardVO();
		
		board.setBno(7);
		board.setTitle("키티에게");
		board.setContent("안녕");
		board.setWriter("사샤");
		
		int result = boardMapper.update(board);
		assertEquals(result, 1);
		
		log.info(Integer.toString(result));
	}
	
	//@Test
	public void delete() {
		BoardVO board = new BoardVO();
		board.setBno(1);
		boardMapper.delete(board);
	}
}
