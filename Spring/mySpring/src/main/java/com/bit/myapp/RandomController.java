package com.bit.myapp;

import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RandomController {
	
	@RequestMapping(value="/random")
	public String random(Model model) {
		Random r = new Random();
		int luck = r.nextInt(45);
		//JSP 와 Controller 사이에 데이터 연결체
		model.addAttribute("Luck",luck);
		return "random"; //views/random.jsp를 호출한다.
	}
}



