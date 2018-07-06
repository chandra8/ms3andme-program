package com.ms3.java.coding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProcessController {

	@Autowired
	private BusinessLogicService businessService;
	
	@RequestMapping("/")
	public String getUserInterface(){
		//return businessService.processNumbers(name);
		return "userinterface";
	}
	
    @CrossOrigin(origins = "*")
	@RequestMapping(value = "/get/keyVlaues", method = RequestMethod.POST)
	public @ResponseBody FinalResponse getGeneratedValues(@RequestBody RangeObject range){
		return businessService.processNumbers(range);
	}
}
