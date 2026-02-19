package net.planet.calendar.dao;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.*;

import net.planet.calendar.dto.Schedule;

@Mapper
public interface ScheduleMapper {

    // ======================
    // 상세 조회
    // ======================
    @Select(
        "SELECT " +
        "schedule_id AS scheduleId, " +
        "title, " +
        "start_date AS startDate, " +
        "start_time AS startTime, " +
        "end_time AS endTime, " +
        "memo, " +
        "created_at AS createdAt " +
        "FROM schedule " +
        "WHERE schedule_id = #{scheduleId}"
    )
    Schedule selectScheduleDetail(Long scheduleId);

    // ======================
    // 날짜별 조회
    // ======================
    @Select(
        "SELECT " +
        "schedule_id AS scheduleId, " +
        "title, " +
        "start_date AS startDate, " +
        "start_time AS startTime, " +
        "end_time AS endTime, " +
        "memo, " +
        "created_at AS createdAt " +
        "FROM schedule " +
        "WHERE start_date = #{date} " +
        "ORDER BY start_time"
    )
    List<Schedule> selectSchedulesByDate(LocalDate date);

    // ======================
    // 등록
    // ======================
    @Insert(
        "INSERT INTO schedule " +
        "(title, start_date, start_time, end_time, memo, created_at) " +
        "VALUES " +
        "(#{title}, #{startDate}, #{startTime}, #{endTime}, #{memo}, NOW())"
    )
    int insertSchedule(Schedule schedule);

    // ======================
    // 수정
    // ======================
    @Update(
        "UPDATE schedule SET " +
        "title = #{title}, " +
        "start_date = #{startDate}, " +
        "start_time = #{startTime}, " +
        "end_time = #{endTime}, " +
        "memo = #{memo} " +
        "WHERE schedule_id = #{scheduleId}"
    )
    int updateSchedule(Schedule schedule);

    // ======================
    // 삭제
    // ======================
    @Delete(
        "DELETE FROM schedule WHERE schedule_id = #{scheduleId}"
    )
    int deleteSchedule(Long scheduleId);
    
    @Select(
    	    "SELECT " +
    	    "schedule_id AS scheduleId, " +
    	    "title, " +
    	    "start_date AS startDate, " +
    	    "start_time AS startTime, " +
    	    "end_time AS endTime, " +
    	    "memo, " +
    	    "created_at AS createdAt " +
    	    "FROM schedule " +
    	    "WHERE YEAR(start_date) = #{year} " +
    	    "AND MONTH(start_date) = #{month}"
    	)
    	List<Schedule> selectSchedulesByMonth(@Param("year") int year,
    	                                      @Param("month") int month);

}
