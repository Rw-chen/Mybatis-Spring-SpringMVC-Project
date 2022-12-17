package xyz.chen.service;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import xyz.chen.pojo.ClassSchedule;
import xyz.chen.pojo.StudentInfo;
import xyz.chen.pojo.TeacherInfo;

import java.util.List;


/**
 * @author Rw-chen
 * @version 0.1
 */
public interface ClassScheduleService {
    List<ClassSchedule> getClassSchedule(StudentInfo studentInfo);

    // 根据老师查找课程信息
    List<ClassSchedule> getTeacherClassSchedule(TeacherInfo teacherInfo);

    List<ClassSchedule> getAllClassSchedule();

    List<ClassSchedule> getClassScheduleByClassroomId(int id);

    List<ClassSchedule> getClassScheduleByCourseArrangementId(int id);

    List<ClassSchedule> getClassScheduleByTime(int weekTh, int dayTh, int courseTh);

    ClassSchedule getClassScheduleByCaIdAndTimes(int caId, int times);

    ClassSchedule getClassScheduleByPara4(int csId, int weekTh, int dayTh, int courseTh);

    void classScheduleUpdate(ClassSchedule classSchedule);

    void deleteClassSchedule(int caId, int times);

    void addClassSchedule(ClassSchedule classSchedule);
}
