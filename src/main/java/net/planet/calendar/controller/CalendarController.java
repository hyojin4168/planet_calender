package net.planet.calendar.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.planet.calendar.dto.Schedule;
import net.planet.calendar.service.ScheduleService;

@Controller
public class CalendarController {

    private final ScheduleService scheduleService;

    @Autowired
    public CalendarController(ScheduleService scheduleService) {
        this.scheduleService = scheduleService;
    }

    @GetMapping("/calendar")
    public String calendar(@RequestParam(required = false) String date,
                           Model model) {

        LocalDate selectedDate;

        if (date == null || date.trim().isEmpty()) {
            selectedDate = LocalDate.now();
        } else {
            selectedDate = LocalDate.parse(date);
        }

        int year = selectedDate.getYear();
        int month = selectedDate.getMonthValue();

        List<Schedule> schedules =
                scheduleService.getSchedulesByDate(selectedDate);

        List<Schedule> monthSchedules =
                scheduleService.getSchedulesByMonth(year, month);

        model.addAttribute("selectedDate", selectedDate);
        model.addAttribute("schedules", schedules);
        model.addAttribute("monthSchedules", monthSchedules);

        return "calendar/calendar";
    }

}
