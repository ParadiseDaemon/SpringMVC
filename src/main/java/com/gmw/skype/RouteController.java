package com.gmw.skype;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RouteController {
	@RequestMapping(value = "/views/home")
	public String home(){
		return "/views/home";
	}
	
	@RequestMapping(value = "/template/first")
	public String first(){
		return "/template/first";
	}
	
	@RequestMapping(value = "/template/second")
	public String second(){
		return "/template/second";
	}
	
}
