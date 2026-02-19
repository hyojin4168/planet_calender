package net.planet.calendar.service;

import java.time.LocalDate;
import java.util.List;

import net.planet.calendar.dto.Schedule;

public interface ScheduleService {

    Schedule getScheduleDetail(Long scheduleId);

    void updateSchedule(Schedule schedule);

    void deleteSchedule(Long scheduleId);
    
    void createSchedule(Schedule schedule);
    
    List<Schedule> getSchedulesByDate(LocalDate date);
    
    List<Schedule> getSchedulesByMonth(int year, int month);

}

