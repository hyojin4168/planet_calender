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

        LocalDate baseDate;

        if (date != null) {
            baseDate = LocalDate.parse(date);
            model.addAttribute("selectedDate", baseDate);

            List<Schedule> schedules =
                    scheduleService.getSchedulesByDate(baseDate);
            model.addAttribute("schedules", schedules);
        } else {
            baseDate = LocalDate.now();
        }

        // 월 단위 조회 추가
        List<Schedule> monthSchedules =
                scheduleService.getSchedulesByMonth(
                        baseDate.getYear(),
                        baseDate.getMonthValue()
                );

        model.addAttribute("monthSchedules", monthSchedules);

        return "calendar/calendar";
    }


}
