package xyz.chen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import xyz.chen.pojo.*;
import xyz.chen.service.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
@Controller
@RequestMapping("teacher")
public class TeacherController {
    @Autowired
    private TeacherInfoService teacherInfoService;
    @Autowired
    private ClassScheduleService classScheduleService;
    @Autowired
    private CourseInfoService courseInfoService;
    @Autowired
    private ClassroomService classroomService;
    @Autowired
    private ClassInfoService classInfoService;

    @PostMapping("/login")
    String login(HttpServletRequest request) {
        System.out.println("---------------/teacher/login-----------------");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        TeacherInfo teacher = teacherInfoService.getTeacherInfo(username, password);
        if (teacher != null) { // µÇÂ¼³É¹¦
            request.getSession().setAttribute("teacher", teacher);
        } else {
            request.setAttribute("msg", "µÇÂ¼Ê§°Ü£¬ÃÜÂë»òÕËºÅ´íÎó!!!");
            return "login";
        }
        return "teacherMain";
    }

    @PostMapping("/update")
    String update(HttpServletRequest request, TeacherInfo teacher) {
        System.out.println("------------------/teacher/update-----------------");
        teacherInfoService.updateTeacher(teacher);
        request.getSession().setAttribute("teacher", teacher); // ¸²¸Ç¸üÐÂ
        return "teacherMain";
    }
    @RequestMapping("/getAllCourse")
    String getAllCourse(HttpServletRequest request) {
        TeacherInfo teacher = (TeacherInfo) request.getSession().getAttribute("teacher");
        List<ClassSchedule> classSchedules = classScheduleService.getTeacherClassSchedule(teacher);
        List<CourseDetail> list = new ArrayList<>();
        for (ClassSchedule cs : classSchedules) {
            CourseDetail courseDetail = new CourseDetail();
            courseDetail.setCourseName(courseInfoService.getCourseInfo(cs.getCourseArrangement().getCourseId()).getCourseName());
            courseDetail.setClassroom(classroomService.getClassroom(cs.getClassRoomId()).getClassroomName());
            courseDetail.setClassName(classInfoService.getClassInfo(cs.getCourseArrangement().getClassId()).getClassName());
            courseDetail.setTimes(cs.getTimes());
            courseDetail.setWeek(cs.getWeekth());
            courseDetail.setDay(cs.getDayth());
            courseDetail.setCourseth(cs.getCourseth());
            list.add(courseDetail);
        }

        list.sort(new Comparator<CourseDetail>() {
            @Override
            public int compare(CourseDetail o1, CourseDetail o2) {
                if (o1.getWeek() != o2.getWeek()) return o1.getWeek() - o2.getWeek();
                if (!o1.getDay().equals(o2.getDay())) return o1.getDay().compareTo(o2.getDay());
                return o1.getCourseth() - o2.getCourseth();
            }
        });

        System.out.println("list");

        request.setAttribute("list", list);
        System.out.println("--------------/teacher/getAllCourse---------------");
        return "teacherCourse";
    }

}
