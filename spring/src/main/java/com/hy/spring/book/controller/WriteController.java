package com.hy.spring.book.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hy.spring.book.model.BookService;
import com.hy.spring.book.model.BookVO;

@Controller
public class WriteController{
	@Autowired
	private BookService bookService;
	private Logger logger=LoggerFactory.getLogger(WriteController.class);
	
	public WriteController() {
		logger.info("WriteController 생성자 호출");
	}
	
	@RequestMapping(value="/book/write.do", method=RequestMethod.GET)
	public String write_get(){
		logger.info("글쓰기 화면 보여주기");
		
		return "book/write";
	}
	
	@RequestMapping(value="/book/write.do", method=RequestMethod.POST)
	public String write_post(@ModelAttribute BookVO bookVo){
		//1. 요청 파라미터 출력
		logger.info("write_post()파라미터 bookVo="+bookVo);
		//2. db 작업.
		bookService.
		//3. 결과, 뷰페이지 저장/리턴
		
	}
	
}
