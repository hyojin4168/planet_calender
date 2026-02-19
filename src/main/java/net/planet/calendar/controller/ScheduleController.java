package net.planet.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import net.planet.calendar.dto.Schedule;
import net.planet.calendar.service.ScheduleService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {

    private final ScheduleService scheduleService;

    @Autowired
    public ScheduleController(ScheduleService scheduleService) {
        this.scheduleService = scheduleService;
    }

    // =========================
    // 상세
    // =========================
    @GetMapping("/detail")
    public String detail(@RequestParam Long scheduleId, Model model) {

        Schedule schedule = scheduleService.getScheduleDetail(scheduleId);

        if (schedule == null) {
            return "error/404";
        }

        model.addAttribute("schedule", schedule);
        return "schedule/scheduleDetail";
    }

    // =========================
    // 등록 폼
    // =========================
    @GetMapping("/create")
    public String createForm(Model model) {

        model.addAttribute("schedule", new Schedule());
        return "schedule/scheduleForm";
    }

    // =========================
    // 등록 처리
    // =========================
    @PostMapping("/create")
    public String create(@ModelAttribute Schedule schedule) {

        scheduleService.createSchedule(schedule);
        return "redirect:/calendar";
    }

    // =========================
    // 수정 폼
    // =========================
    @GetMapping("/edit")
    public String editForm(@RequestParam Long scheduleId, Model model) {

        Schedule schedule = scheduleService.getScheduleDetail(scheduleId);

        if (schedule == null) {
            return "error/404";
        }

        model.addAttribute("schedule", schedule);
        return "schedule/scheduleForm";
    }

    // =========================
    // 수정 처리
    // =========================
    @PostMapping("/update")
    public String update(@ModelAttribute Schedule schedule) {

        scheduleService.updateSchedule(schedule);
        return "redirect:/schedule/detail?scheduleId=" + schedule.getScheduleId();
    }

    // =========================
    // 삭제
    // =========================
    @GetMapping("/delete")
    public String delete(@RequestParam Long scheduleId) {

        scheduleService.deleteSchedule(scheduleId);
        return "redirect:/calendar";
    }
}
