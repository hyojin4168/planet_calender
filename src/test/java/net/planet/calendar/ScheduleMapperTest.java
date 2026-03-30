package net.planet.calendar;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import net.planet.calendar.dao.ScheduleMapper;
import net.planet.calendar.dto.Schedule;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
        "file:src/main/webapp/WEB-INF/spring/root-context.xml"
})
public class ScheduleMapperTest {

    @Autowired
    private ScheduleMapper scheduleMapper;

    @Test
    public void testSelectScheduleDetail() {

        Long testId = 1L;   // DB에 실제 존재하는 ID

        Schedule schedule = scheduleMapper.selectScheduleDetail(testId);

        assertNotNull(schedule);
        System.out.println("조회 결과: " + schedule);
    }
}
