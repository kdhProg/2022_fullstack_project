package kr.co.olga.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.olga.service.VisitorsService;

@Controller
@RequestMapping(value = "/visitors/")
public class VisitorsController {
	
	@Autowired
	private VisitorsService vsService;
	
	@GetMapping(value="/getVisitorList")
	@ResponseBody
	public Map<String, Object> getVisitorList(){
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("countList", vsService.countGroupByDate());
		result.put("dateList", vsService.showDateGroupByDate());
		result.put("accumulateVisit", vsService.accumulateVisit());
		result.put("todayVisit", vsService.todayVisit());
		
		return result;
	}
}
