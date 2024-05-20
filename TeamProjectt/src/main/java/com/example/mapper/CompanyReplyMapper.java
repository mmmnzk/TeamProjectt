package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.CompanyReplyVO;


public interface CompanyReplyMapper{
	
	public int insert(CompanyReplyVO vo) ;
	
	public CompanyReplyVO read(Long rno);
	
	public int delete (Long rno) ;
	
	public int update (CompanyReplyVO reply) ;
	
	public List<CompanyReplyVO> getListWithPaging(@Param("cri") Criteria cri,
											@Param("rno") Long rno);
	public int getCountByRno(Long rno);
}