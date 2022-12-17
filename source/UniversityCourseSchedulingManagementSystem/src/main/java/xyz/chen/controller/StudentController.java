package xyz.chen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import xyz.chen.pojo.ClassSchedule;
import xyz.chen.pojo.CourseDetail;
import xyz.chen.pojo.StudentInfo;
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
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentInfoService studentInfoService;

    @Autowired
    private ClassInfoService classInfoService;

    @Autowired
    private CourseInfoService courseInfoService;

    @Autowired
    private ClassScheduleService classScheduleService;

    @Autowired
    private ClassroomService classroomService;

    @Autowired
    private TeacherInfoService teacherInfoService;

    @PostMapping("/login")
    String login(HttpServletRequest request) {
        System.out.println("---------------/student/login-----------------");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        StudentInfo student = studentInfoService.getStudentInfo(username, password);
        if (student != null) { // µÇÂ¼³É¹¦
            request.getSession().setAttribute("student", student);
        } else {
            request.setAttribute("msg", "µÇÂ¼Ê§°Ü£¬ÃÜÂë»òÕËºÅ´íÎó!!!");
            return "login";
        }
        return "studentMain";
    }

    @RequestMapping("toUpdate")
    String toUpdate(HttpServletRequest request) {
        System.out.println("----------student/toUpdate---------------------");
        request.setAttribute("allClassInfo", classInfoService.getAllClassInfo());
        System.out.println(classInfoService.getAllClassInfo());
        return "studentUpdate";
    }

    @PostMapping("/update")
    String update(HttpServletRequest request, StudentInfo student) {
        System.out.println("------------------/student/update-----------------");
        studentInfoService.updateStudent(student);
        student = studentInfoService.getStudentById(student.getStudentId());
        request.getSession().setAttribute("student", student); // ¸²¸Ç¸üÐÂ
        return "studentMain";
    }

    @RequestMapping("/getAllCourse")
    String getAllCourse(HttpServletRequest request) {
        StudentInfo student = (StudentInfo) request.getSession().getAttribute("student");
        List<ClassSchedule> classSchedules = classScheduleService.getClassSchedule(student);
        List<CourseDetail> list = new ArrayList<>();
        for (ClassSchedule cs : classSchedules) {
            CourseDetail courseDetail = new CourseDetail();
            courseDetail.setCourseName(courseInfoService.getCourseInfo(cs.getCourseArrangement().getCourseId()).getCourseName());
            courseDetail.setClassroom(classroomService.getClassroom(cs.getClassRoomId()).getClassroomName());
            courseDetail.setTeacherName(teacherInfoService.getTeacherById(cs.getCourseArrangement().getTeacherId()).getTeacherName());
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
        request.setAttribute("list", list);
        System.out.println("--------------/student/getAllCourse---------------");
        return "studentCourse";
    }

}
