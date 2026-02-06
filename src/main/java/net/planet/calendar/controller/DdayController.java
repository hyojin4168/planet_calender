package net.planet.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DdayController {

    @GetMapping("/dday")
    public String dday() {
        return "dday/dday";
    }
}
