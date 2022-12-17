package xyz.chen.dao;

import org.apache.ibatis.annotations.*;
import xyz.chen.pojo.ClassSchedule;
import xyz.chen.pojo.StudentInfo;
import xyz.chen.pojo.TeacherInfo;

import java.util.List;


/**
 * @author Rw-chen
 * @version 0.1
 */
public interface ClassScheduleMapper {
    // 根据学生查找课程信息
    List<ClassSchedule> getClassSchedule(StudentInfo studentInfo);

    // 根据老师查找课程信息
    List<ClassSchedule> getTeacherClassSchedule(TeacherInfo teacherInfo);

//    @Select("select * from classSchedule where caId = #{id}")
    List<ClassSchedule> getClassScheduleByCourseArrangementId(int id);

    List<ClassSchedule> getAllClassSchedule();

    @Select("select * from classSchedule where csId = #{id}")
    List<ClassSchedule> getClassScheduleByClassroomId(int id);

    ClassSchedule getClassScheduleByCaIdAndTimes(@Param("caId") int caId, @Param("times") int times);

    ClassSchedule getClassScheduleByPara4(@Param("csId") int csId, @Param("weekTh") int weekTh, @Param("dayTh") int dayTh, @Param("courseTh") int courseTh);

    List<ClassSchedule> getClassScheduleByTime(@Param("weekTh") int weekTh, @Param("dayTh") int dayTh, @Param("courseTh") int courseTh);

    @Update("update classSchedule set csId = #{classRoomId}, weekth = #{weekth}, dayth = #{dayth}, courseth = #{courseth} where caId = #{classArrangementId} and times = #{times}")
    void classScheduleUpdate(ClassSchedule classSchedule);

    @Delete("delete from classSchedule where caId = #{caId} and times = #{times}")
    void deleteClassSchedule(@Param("caId") int caId, @Param("times") int times);

    @Insert("insert into classSchedule values(#{classArrangementId}, #{times}, #{classRoomId}, #{weekth}, #{dayth}, #{courseth})")
    void addClassSchedule(ClassSchedule classSchedule);
}
