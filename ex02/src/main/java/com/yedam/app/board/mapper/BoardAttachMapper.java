package com.yedam.app.board.mapper;

import java.util.List;

import com.yedam.app.board.domain.BoardAttachVO;

public interface BoardAttachMapper {

	public void insert(BoardAttachVO vo);

	public void delete(String uuid);

	public List<BoardAttachVO> findByBno(Long bno);

	public void deleteAll(Long bno);

	public List<BoardAttachVO> getOldFiles();
	
	public BoardAttachVO read(String uuid);

}