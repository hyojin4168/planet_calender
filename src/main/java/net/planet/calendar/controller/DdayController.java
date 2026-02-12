package net.planet.calendar.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/dday")
public class DdayController {

    // 목록
    @GetMapping("")
    public String list(Model model) {

        List<Map<String, String>> list = new ArrayList<>();

        Map<String, String> item1 = new HashMap<>();
        item1.put("count", "D-3");
        item1.put("title", "시험");
        item1.put("date", "2026-02-03");

        Map<String, String> item2 = new HashMap<>();
        item2.put("count", "D-12");
        item2.put("title", "여행");
        item2.put("date", "2026-02-12");

        list.add(item1);
        list.add(item2);

        model.addAttribute("ddayList", list);

        return "dday/dday";
    }

    // 등록
    @GetMapping("/new")
    public String create(Model model) {
        model.addAttribute("mode", "create");
        return "dday/dday-form";
    }

    // 수정
    @GetMapping("/edit")
    public String edit(@RequestParam(required=false) int idx,
                       Model model) {

        model.addAttribute("mode", "edit");

        // 더미 값
        model.addAttribute("title", "시험");
        model.addAttribute("date", "2026-02-03");

        return "dday/dday-form";
    }
    
    @PostMapping("")
    public String save(
            @RequestParam String title,
            @RequestParam String date,
            @RequestParam String mode) {

        // 지금은 더미니까 그냥 목록으로 이동
        return "redirect:/dday";
    }

    
    // 삭제
    @GetMapping("/delete")
    public String delete() {
        return "dday/dday-delete";
    }
}
