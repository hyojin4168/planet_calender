package net.planet.calendar.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/todo")
public class TodoController {

    // 목록
	@GetMapping("")
	public String list(Model model) {

	    List<Map<String, Object>> dateGroups = new ArrayList<>();

	    // 첫 번째 날짜 그룹
	    Map<String, Object> group1 = new HashMap<>();
	    group1.put("date", "2026-02-03");

	    List<Map<String, Object>> todos1 = new ArrayList<>();

	    Map<String, Object> t1 = new HashMap<>();
	    t1.put("title", "운동하기");
	    t1.put("done", false);

	    Map<String, Object> t2 = new HashMap<>();
	    t2.put("title", "약 챙기기");
	    t2.put("done", true);

	    todos1.add(t1);
	    todos1.add(t2);

	    group1.put("todos", todos1);

	    // 두 번째 날짜 그룹
	    Map<String, Object> group2 = new HashMap<>();
	    group2.put("date", "2026-02-04");

	    List<Map<String, Object>> todos2 = new ArrayList<>();

	    Map<String, Object> t3 = new HashMap<>();
	    t3.put("title", "개발 공부 1시간");
	    t3.put("done", false);

	    todos2.add(t3);
	    group2.put("todos", todos2);

	    dateGroups.add(group1);
	    dateGroups.add(group2);

	    model.addAttribute("todoGroups", dateGroups);

	    return "todo/todo";
	}

    // 등록
    @GetMapping("/new")
    public String create(Model model) {
        model.addAttribute("mode", "create");
        return "todo/todo-form";
    }

    // 수정
    @GetMapping("/edit")
    public String edit(Model model) {
        model.addAttribute("mode", "edit");
        model.addAttribute("title", "과제 제출");
        return "todo/todo-form";
    }

    // 저장
    @PostMapping("")
    public String save() {
        return "redirect:/todo";
    }

    // 삭제
    @GetMapping("/delete")
    public String delete(
            @RequestParam String date,
            @RequestParam int idx) {

        // 지금은 더미 단계
        // 실제 삭제는 나중에 DB 붙일 때 처리

        return "redirect:/todo";
    }

}
