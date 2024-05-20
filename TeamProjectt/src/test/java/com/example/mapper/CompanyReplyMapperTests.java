package com.example.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.example.domain.Criteria;
import com.example.domain.CompanyReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
//@ContextConriguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//Java Config
@ContextConfiguration(classes= {com.example.config.RootConfig.class})
@Log4j
public class CompanyReplyMapperTests {
	
	//테스트 전에 해당 번호의 게시물이 존재하는지 반드시 확인할 것
	private Long[] bnoArr = {14L,2L,3L,147L,149L};
	
	@Setter(onMethod_=@Autowired)
	private CompanyReplyMapper mapper;
	
//	@Test
	public void testCreate() {
		
		IntStream.rangeClosed(1, 10).forEach(i -> {
			CompanyReplyVO vo = new CompanyReplyVO();
			
			//게시물의 번호
			vo.setBno(bnoArr[i%5]);
			vo.setReply("댓글 테스트 "+i);
			vo.setReplyer("replyer"+i);
			
			mapper.insert(vo);
		});
	}
	@Test
	public void testRead() {
		
		Long targetRno=2L;
		
		CompanyReplyVO vo = mapper.read(targetRno);
		
		log.info(vo);
	}
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	@Test
	public void testDelete() {
		Long targetRno = 1L;
	
		mapper.delete(targetRno);
	}
	
	@Test
	public void testUpdate() {
		
//		Long targetRno = 14L;		
//		ReplyVO vo = mapper.read(targetRno);
		
		CompanyReplyVO vo = new CompanyReplyVO();
		vo.setRno(2L);
		vo.setBno(2L);
		vo.setReply("ㅋㅋ");
		vo.setReplyer("홍길동");
		
		int count = mapper.update(vo);
		
		log.info("UPDATE COUNT: "+ count);
		
	}
	
	@Test
	public void testList() {
		
		Criteria cri = new Criteria();
		
		//7L
		List<CompanyReplyVO> replies = mapper.getListWithPaging(cri, 2L);
		
		replies.forEach(reply -> log.info(reply));
	}
	
//	@Test
	public void testList2() {
			
		Criteria cri = new Criteria(2,10);
		
		//7L
		List<CompanyReplyVO> replies = mapper.getListWithPaging(cri, 205L);
		
		replies.forEach(reply -> log.info(reply));
	}

}

