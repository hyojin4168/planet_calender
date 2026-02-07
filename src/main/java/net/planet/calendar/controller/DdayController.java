package net.planet.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DdayController {

    // 목록
    @GetMapping("/dday")
    public String list() {
        return "dday/dday";
    }

    // 등록
    @GetMapping("/dday/new")
    public String create() {
        return "dday/dday-form";
    }

    // 수정
    @GetMapping("/dday/edit")
    public String edit() {
        return "dday/dday-form";
    }

    // 삭제 (확인 페이지)
    @GetMapping("/dday/delete")
    public String delete() {
        return "dday/dday-delete";
    }
}
