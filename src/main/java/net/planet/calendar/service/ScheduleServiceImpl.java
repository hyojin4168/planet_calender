package net.planet.calendar.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.planet.calendar.dao.ScheduleMapper;
import net.planet.calendar.dto.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService {

    private final ScheduleMapper scheduleMapper;

    @Autowired
    public ScheduleServiceImpl(ScheduleMapper scheduleMapper) {
        this.scheduleMapper = scheduleMapper;
    }

    @Override
    public Schedule getScheduleDetail(Long scheduleId) {
        return scheduleMapper.selectScheduleDetail(scheduleId);
    }

    @Override
    public void createSchedule(Schedule schedule) {
        scheduleMapper.insertSchedule(schedule);
    }

    @Override
    public void updateSchedule(Schedule schedule) {
        scheduleMapper.updateSchedule(schedule);
    }

    @Override
    public void deleteSchedule(Long scheduleId) {
        scheduleMapper.deleteSchedule(scheduleId);
    }

    @Override
    public List<Schedule> getSchedulesByDate(LocalDate date) {
        return scheduleMapper.selectSchedulesByDate(date);  
    }
    
    @Override
    public List<Schedule> getSchedulesByMonth(int year, int month) {
        return scheduleMapper.selectSchedulesByMonth(year, month);
    }

}
