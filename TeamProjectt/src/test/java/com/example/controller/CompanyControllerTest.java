package com.example.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration//서블릿 콘덱스트를 사용하겠다는 의미
//@ContextConfiguration({"file:src/main/webapp/WEB-INF/root-context.xml",
//						"file:src/main/webapp/WEB-INF/appServlet/servlet-context.xml"})
@ContextConfiguration(classes = {com.example.config.RootConfig.class, 
									com.example.config.ServletConfig.class})
@Log4j

public class CompanyControllerTest {
	
	@Setter(onMethod_= {@Autowired})
	private WebApplicationContext ctx;
	private MockMvc mockMvc;//가짜 mvc-url과 파라미터를 브라우저 사용자처럼 만들어 컨트롤러 실행
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
//	@Test//.리스트 조회 테스트
	public void testGetList() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders
							.get("/company/list")
							.param("", ""))
							.andReturn()
							.getModelAndView()
							.getModelMap()
					
							);
	}	
	
	
	
//	@Test//1.입력 테스트
	public void testRegister() throws Exception{
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders
											.post("/company/register")
											.param("title", "테스트 새글 제목")
											.param("content", "테스트 새글 내용")
											.param("writer", "user00")
											)
									.andReturn()
									.getModelAndView()
									.getViewName();
	log.info(resultPage);
				
	}
	
	@Test//2.조회 테스트
	public void testGEt() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders
							.get("/company/get")
							.param("cno", "2"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
		
				);
	}
	
//	@Test //3. 수정테스트
	public void testModify() throws Exception {

		String resultPage = mockMvc.perform(MockMvcRequestBuilders
											.post("/company/modify")
											.param("bno", "2")
											.param("title", "ㅋㅋㅋ")
											.param("content", "수정된 테스트 새글 내용")
											.param("writer", "user00")
											)
									.andReturn()
									.getModelAndView()
									.getViewName();
		log.info(resultPage);
	}
	
//	@Test //4.삭제 테스트
	public void testRemove() throws Exception {
		//삭제전 데이터베이스에 게시물 번호 확인할것
		String resultPage = mockMvc.perform(MockMvcRequestBuilders
											.post("/company/remove")
											.param("bno", "36"))
									.andReturn()
									.getModelAndView()
									.getViewName();
		log.info(resultPage);
	}
//	@Test
	public void testListPaging() throws Exception{
		
		log.info(mockMvc.perform(
				MockMvcRequestBuilders.get("/company/companyList")
						.param("pageNum", "2")
						.param("amount", "5"))
						.andReturn().getModelAndView().getViewName());
	}
}
