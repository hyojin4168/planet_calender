package net.planet.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    // 기본 진입 → 캘린더
    @GetMapping("/")
    public String root() {
        return "calendar/calendar";
    }

    // 홈(D-Day 요약)
    @GetMapping("/home")
    public String home() {
        return "home";
    }
}
