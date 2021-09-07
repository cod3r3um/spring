package com.yedam.app.board.mapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyVO;
import com.yedam.app.board.service.ReplyService;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired ReplyMapper replyMapper;

	@Override
	public int insert(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.insert(vo);
	}

	@Override
	public int update(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.update(vo);
	}

	@Override
	public int delete(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.delete(vo);
	}

	@Override
	public ReplyVO read(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.read(vo);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		return replyMapper.getList(cri, bno);
	}
	
}
