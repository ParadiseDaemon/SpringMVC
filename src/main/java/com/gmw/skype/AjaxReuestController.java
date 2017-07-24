package com.gmw.skype;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/test")
public class AjaxReuestController {
	@RequestMapping(value = "/poetry.html", method = RequestMethod.GET)
	@ResponseBody
	public String poetry(){
		return "{\"name\":\"wjch\"}";
	}
}
