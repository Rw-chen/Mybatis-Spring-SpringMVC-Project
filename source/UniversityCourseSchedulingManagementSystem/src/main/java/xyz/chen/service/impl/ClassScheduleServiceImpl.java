package xyz.chen.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.chen.dao.ClassScheduleMapper;
import xyz.chen.pojo.ClassSchedule;
import xyz.chen.pojo.StudentInfo;
import xyz.chen.pojo.TeacherInfo;
import xyz.chen.service.ClassScheduleService;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
@Service
public class ClassScheduleServiceImpl implements ClassScheduleService {
    @Autowired
    ClassScheduleMapper classScheduleMapper;

    @Override
    public List<ClassSchedule> getClassSchedule(StudentInfo studentInfo) {
        return classScheduleMapper.getClassSchedule(studentInfo);
    }

    @Override
    public List<ClassSchedule> getTeacherClassSchedule(TeacherInfo teacherInfo) {
        return classScheduleMapper.getTeacherClassSchedule(teacherInfo);
    }

    @Override
    public List<ClassSchedule> getAllClassSchedule() {
        return classScheduleMapper.getAllClassSchedule();
    }

    @Override
    public List<ClassSchedule> getClassScheduleByClassroomId(int id) {
        return classScheduleMapper.getClassScheduleByClassroomId(id);
    }

    @Override
    public List<ClassSchedule> getClassScheduleByCourseArrangementId(int id) {
        return classScheduleMapper.getClassScheduleByCourseArrangementId(id);
    }

    @Override
    public List<ClassSchedule> getClassScheduleByTime(int weekTh, int dayTh, int courseTh) {
        return classScheduleMapper.getClassScheduleByTime(weekTh,dayTh, courseTh);
    }

    @Override
    public ClassSchedule getClassScheduleByCaIdAndTimes(int caId, int times) {
        return classScheduleMapper.getClassScheduleByCaIdAndTimes(caId, times);
    }

    @Override
    public ClassSchedule getClassScheduleByPara4(int csId, int weekTh, int dayTh, int courseTh) {
        return classScheduleMapper.getClassScheduleByPara4(csId, weekTh, dayTh, courseTh);
    }

    @Override
    public void classScheduleUpdate(ClassSchedule classSchedule) {
        classScheduleMapper.classScheduleUpdate(classSchedule);
    }


    @Override
    public void deleteClassSchedule(int caId, int times) {
        classScheduleMapper.deleteClassSchedule(caId, times);
    }

    @Override
    public void addClassSchedule(ClassSchedule classSchedule) {
        classScheduleMapper.addClassSchedule(classSchedule);
    }
}
