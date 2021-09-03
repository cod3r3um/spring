package com.yedam.app.board;

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

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:/spring/*-context.xml",
					   "file:src\\main\\webapp\\WEB-INF\\spring\\appServlet\\servlet-context.xml"})
@WebAppConfiguration
public class BoardControllerClient {

	@Autowired private WebApplicationContext ctx;	// 가짜 서버
	private MockMvc mockMvc;
	
	@org.junit.Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test	// 215페이지
	public void testlist() throws Exception {
		log.info(
				 mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
						.andReturn()
						.getModelAndView()
						.getModelMap()
						.toString()
				 );
	}
}
