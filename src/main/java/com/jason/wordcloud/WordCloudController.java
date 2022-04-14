package com.jason.wordcloud;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class WordCloudController {
	
	@RequestMapping(value = "/wordCloud_arbor.do")
	public String wordCloud_arbor() throws Exception{
		return "wordCloud_arbor";
	}
	
	@RequestMapping(value = "/wordCloud_d3.do")
	public String wordCloud() throws Exception{
		return "wordCloud_d3";
	}
}
