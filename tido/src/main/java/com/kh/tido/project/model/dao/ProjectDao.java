package com.kh.tido.project.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tido.project.model.vo.Project;

@Repository
public class ProjectDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int saveProject(Project project) {
		
		return sqlSession.insert("projectMapper.saveProject",project);
	}

	public Project openProject() {
		return sqlSession.selectOne("projectMapper.openProject");
	}
	
	
	
}