package net.planet.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TodoController {

    // 목록
    @GetMapping("/todo")
    public String list() {
        return "todo/todo";
    }

    // 등록
    @GetMapping("/todo/new")
    public String create() {
        return "todo/todo-form";
    }

    // 수정
    @GetMapping("/todo/edit")
    public String edit() {
        return "todo/todo-form";
    }

    // 삭제 (확인 페이지)
    @GetMapping("/todo/delete")
    public String delete() {
        return "todo/todo-delete";
    }
}
