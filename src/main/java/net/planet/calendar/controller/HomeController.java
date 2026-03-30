package net.planet.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    @GetMapping("/")
    public String root() {
        return "redirect:/calendar";   
    }

    @GetMapping("/home")
    public String home() {
        return "home";
    }
}


