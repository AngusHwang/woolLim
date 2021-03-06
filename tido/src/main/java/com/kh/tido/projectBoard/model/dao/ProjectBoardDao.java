package com.kh.tido.projectBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tido.board.model.vo.PageInfo;
import com.kh.tido.projectBoard.model.vo.PBReply;
import com.kh.tido.projectBoard.model.vo.ProjectBoard;

@Repository("pbDao")
public class ProjectBoardDao {
	
	@Autowired
	private SqlSession sqlSession ;
	
	public int getpbListCount() {
		return sqlSession.selectOne("pboardMapper.getpbListCount");
	}

	public ArrayList<ProjectBoard> selectpBoardList(PageInfo pi) {
	    int offset = (pi.getCurrentPage()-1)* pi.getLimit();
	    RowBounds rb = new RowBounds(offset,pi.getLimit());
		return (ArrayList)sqlSession.selectList("pboardMapper.selectpBoardList",null,rb);
	}

	public int insertpBoard(ProjectBoard pBoard) {
		return sqlSession.insert("pboardMapper.insertpBoard",pBoard);
	}

	public int updatepBoard(ProjectBoard pBoard) {
		return sqlSession.update("pboardMapper.updatepBoard",pBoard);
	}

	public int deletepBoard(int pbNo) {
		return sqlSession.update("pboardMapper.deletepBoard",pbNo);
	}

	public int insertPBReply(PBReply pbReply) {
		return sqlSession.insert("pboardMapper.insertPBReply",pbReply);
	}

	public ArrayList<PBReply> selectpbReplyList(int refPbno) {
		return (ArrayList)sqlSession.selectList("pboardMapper.selectpbReplyList",refPbno);
	}

	public int getReplyCount(int refPbno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("pboardMapper.getReplyCount",refPbno);
	}

	public int increaseViewCount(int refPbno) {
		
		return sqlSession.update("pboardMapper.increaseViewCount",refPbno);
	}



}
