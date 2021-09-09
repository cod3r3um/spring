package com.yedam.app.board.service;

import org.apache.ibatis.annotations.Param;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyPageVO;
import com.yedam.app.board.domain.ReplyVO;

public interface ReplyService {

	// 등록 ( void 혹은 int )
			public int insert(ReplyVO vo);
			
			// 수정
			public int update(ReplyVO vo);
			
			// 삭제
			public int delete(ReplyVO vo);
			
			// 단건조회
			public ReplyVO read(ReplyVO vo);
			
			// 전체조회
			public ReplyPageVO getList(@Param("cri") Criteria cri, @Param("bno") Long bno);
			
}
