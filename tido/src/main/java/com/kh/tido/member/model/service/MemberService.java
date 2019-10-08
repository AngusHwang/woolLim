package com.kh.tido.member.model.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.kh.tido.member.model.vo.Member;
import com.kh.tido.member.model.vo.MemberAuth;

public interface MemberService {

	Member loginMember(Member mem);

	void insertAuth(String email) throws Exception;

	int updateAuth(MemberAuth memberAuth) throws Exception;

	int insertMember(Member mem, MultipartFile uploadFile, HttpServletRequest request);

	int selectId(String memberId);

	int selectName(String name);

}
