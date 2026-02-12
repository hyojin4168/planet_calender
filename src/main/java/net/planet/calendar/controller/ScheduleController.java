package net.planet.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {

	@GetMapping("/detail")
	public String detail(
	        @RequestParam(required = false) String date,
	        @RequestParam(required = false) String idx,
	        Model model) {

	    model.addAttribute("date", date);
	    model.addAttribute("idx", idx);

	    return "schedule/scheduleDetail";
	    
	}
	
	@GetMapping("/create")
	public String createForm(@RequestParam(required=false) String date, Model model) {
	    model.addAttribute("mode", "create");
	    model.addAttribute("date", date);
	    return "schedule/scheduleForm";
	}

	
	@GetMapping("/edit")
	public String editForm(@RequestParam String date,
	                       @RequestParam int idx,
	                       Model model) {

	    model.addAttribute("mode", "edit");
	    model.addAttribute("date", date);

	    // 지금은 더미
	    model.addAttribute("title", "여행");
	    model.addAttribute("content", "여행 메모");

	    return "schedule/scheduleForm";
	}

}
