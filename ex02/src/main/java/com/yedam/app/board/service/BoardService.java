package com.yedam.app.board.service;

import java.util.List;

import com.yedam.app.board.domain.BoardAttachVO;
import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;

public interface BoardService {

	// 등록 ( void 혹은 int )
	public int insert(BoardVO vo);
	
	// 수정
	public int update(BoardVO vo);
	
	// 삭제
	public int delete(BoardVO vo);
	
	// 단건조회
	public BoardVO read(BoardVO vo);
	
	// 전체조회
	public List<BoardVO> getList(Criteria cri);
	
	// 전체 데이터 건수
	public int getTotalCount(Criteria cri);
	
	// 첨부파일 단건조회
	public BoardAttachVO attachRead(String uuid);
		
}
