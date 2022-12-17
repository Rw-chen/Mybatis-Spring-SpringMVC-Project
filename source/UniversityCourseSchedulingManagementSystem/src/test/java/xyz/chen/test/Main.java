package xyz.chen.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import xyz.chen.pojo.*;
import xyz.chen.service.*;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-context.xml")
public class Main {

    @Autowired
    private ClassInfoService classInfoService;
    @Autowired
    private StudentInfoService studentInfoService;
    @Autowired
    private TeacherInfoService teacherInfoService;
    @Autowired
    private AdministratorService administratorService;
    @Autowired
    private StatusInfoService statusInfoService;
    @Autowired
    private ClassScheduleService classScheduleService;
    @Autowired
    private CourseInfoService courseInfoService;
    @Autowired
    private ClassroomService classroomService;
    @Autowired
    private CourseArrangementService courseArrangementService;

    @Test
    public void test() {
//        System.out.println(studentInfoService.getStudentInfo("20223301", "zhangfei"));
//        System.out.println(teacherInfoService.getTeacherInfo("t20050311", "ohmygod"));
//        System.out.println(administratorService.getAdministrator("admin", "0x7f"));
//        System.out.println(statusInfoMapper.getAllStatus());
//        System.out.println(administratorService.getAdministratorById("admin"));
//        System.out.println(studentInfoService.getStudentById("20223301"));
//        System.out.println(teacherInfoService.getTeacherById("t20001010"));
//        Administrator admin = new Administrator("test", "300", "400");
//        administratorService.updateAdministrator(admin);
//        StudentInfo student = new StudentInfo("stu", "xxx", "ÀÔ…–œ„","ƒ–", 20, 1);
//        studentInfoService.updateStudent(student);
//        System.out.println(classroomService.getClassroom(4));
//        TeacherInfo teacherInfo = new TeacherInfo();
//        teacherInfo.setWorkId("t20051010");
//        List<ClassSchedule> classSchedules = classScheduleService.getTeacherClassSchedule(teacherInfo);
//        List<CourseDetail> list = new ArrayList<>();
//        for (ClassSchedule cs : classSchedules) {
//            CourseDetail courseDetail = new CourseDetail();
//            courseDetail.setCourseName(courseInfoService.getCourseInfo(cs.getCourseArrangement().getCourseId()).getCourseName());
//            courseDetail.setClassroom(classroomService.getClassroom(cs.getClassRoomId()).getClassroomName());
//            courseDetail.setTeacherName(teacherInfoService.getTeacherById(cs.getCourseArrangement().getTeacherId()).getTeacherName());
//            courseDetail.setTimes(cs.getTimes());
//            courseDetail.setWeek(cs.getWeekth());
//            courseDetail.setDay(cs.getDayth());
//            courseDetail.setCourseth(cs.getCourseth());
//            list.add(courseDetail);
//        }
//        list.sort(new Comparator<CourseDetail>() {
//            @Override
//            public int compare(CourseDetail o1, CourseDetail o2) {
//                if (o1.getWeek() != o2.getWeek()) return o1.getWeek() - o2.getWeek();
//                if (!o1.getDay().equals(o2.getDay())) return o1.getDay().compareTo(o2.getDay());
//                return o1.getCourseth() - o2.getCourseth();
//            }
//        });
//        System.out.println(list);
//        System.out.println(teacherInfoService.getAllTeacher());
//        System.out.println(studentInfoService.getAllStudent());
//        System.out.println(courseInfoService.getAllCourse());
//        studentInfoService.deleteStudent("ewrwer");
//        System.out.println(courseArrangementService.getAllCourseArrangement());
//        CourseInfo courseInfo = new CourseInfo(16, "ª„±‡”Ô—‘", 10.5, "dddd");
//        courseInfoService.updateCourseInfo(courseInfo);
//        Classroom classroom = new Classroom(20, "C202", 300);
//        classroomService.updateClassroom(classroom);
//        classroomService.deleteClassroom(20);
//        System.out.println(classScheduleService.getClassScheduleByClassroomId(1));
//        CourseArrangement ca = new CourseArrangement();
//        ca.setId(15);
//        ca.setClassId(4);
//        ca.setCourseId(4);
//        ca.setTeacherId("t20070701");
//        courseArrangementService.updateCourseArrangement(ca);
//        courseArrangementService.deleteCourseArrangement(15);
//        System.out.println(classScheduleService.getAllClassSchedule());
//        System.out.println(classScheduleService.getClassScheduleByCourseArrangementId(11));
        System.out.println(teacherInfoService.getTeacherById(""));
    }


}
