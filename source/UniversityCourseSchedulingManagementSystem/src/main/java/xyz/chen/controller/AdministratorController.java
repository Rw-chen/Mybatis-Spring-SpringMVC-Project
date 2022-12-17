package xyz.chen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.chen.dao.ClassroomMapper;
import xyz.chen.pojo.*;
import xyz.chen.service.*;
import xyz.chen.service.impl.CourseArrangementServiceImpl;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
@Controller
@RequestMapping("/administrator")
public class AdministratorController {
    @Autowired
    private AdministratorService administratorService;
    @Autowired
    private TeacherInfoService teacherInfoService;
    @Autowired
    private StudentInfoService studentInfoService;
    @Autowired
    private CourseInfoService courseInfoService;
    @Autowired
    private ClassroomService classroomService;
    @Autowired
    private CourseArrangementService courseArrangementService;
    @Autowired
    private ClassScheduleService classScheduleService;
    @Autowired
    private ClassInfoService classInfoService;

    @PostMapping("/login")
    String login(HttpServletRequest request) {
        System.out.println("---------------/administrator/login-----------------");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Administrator administrator = administratorService.getAdministrator(username, password);
        if (administrator != null) { // 登录成功
            request.getSession().setAttribute("administrator", administrator);
        } else {
            request.setAttribute("msg", "登录失败，密码或账号错误!!!");
            return "login";
        }
        return "administratorMain";
    }

    @PostMapping("/update")
    String update(HttpServletRequest request, Administrator administrator) {
        System.out.println("------------------/administrator/update-----------------");
        administratorService.updateAdministrator(administrator);
        request.getSession().setAttribute("administrator", administrator); // 覆盖更新
        return "administratorMain";
    }

    @RequestMapping("/getAllTeacher")
    String getAllTeacher(HttpServletRequest request) {
        System.out.println("-------------/administrator/getAllTeacher/--------------------");
        List<TeacherInfo> list = teacherInfoService.getAllTeacher();
        request.setAttribute("list", list);
        return "allTeacherDetails";
    }

    @RequestMapping("/getAllStudent")
    String getAllStudent(HttpServletRequest request) {
        System.out.println("-------------/administrator/getAllStudent/--------------------");
        List<StudentInfo> list = studentInfoService.getAllStudent();
        request.setAttribute("list", list);
        return "allStudentDetails";
    }

    @RequestMapping("/getAllCourse")
    String getAllCourse(HttpServletRequest request) {
        System.out.println("-------------/administrator/getAllCourse/--------------------");
        List<CourseInfo> list = courseInfoService.getAllCourse();
        request.setAttribute("list", list);
        return "allCourseDetails";
    }

    @RequestMapping("/getAllClassroom")
    String getAllClassroom(HttpServletRequest request) {
        System.out.println("-------------/administrator/getAllClassroom/--------------------");
        List<Classroom> list = classroomService.getAllClassroom();
        request.setAttribute("list", list);
        return "allClassroomDetails";
    }

    @RequestMapping("/getAllCourseArrangement")
    String getAllCourseArrangement(HttpServletRequest request) {
        System.out.println("-------------/administrator/getAllCourseArrangement/--------------------");
        List<CourseArrangement> list = courseArrangementService.getAllCourseArrangement();
        request.setAttribute("list", list);
        return "allCourseArrangementDetails";
    }

    @RequestMapping("/getAllClassSchedule")
    String getAllClassSchedule(HttpServletRequest request) {
        System.out.println("-------------/administrator/getAllClassSchedule/--------------------");
        List<ClassSchedule> classSchedules = classScheduleService.getAllClassSchedule();
        List<CourseDetail> list = new ArrayList<>();
        for (ClassSchedule cs : classSchedules) {
            CourseDetail courseDetail = new CourseDetail();
            courseDetail.setCourseName(courseInfoService.getCourseInfo(cs.getCourseArrangement().getCourseId()).getCourseName());
            courseDetail.setClassroom(classroomService.getClassroom(cs.getClassRoomId()).getClassroomName());
            courseDetail.setTeacherName(teacherInfoService.getTeacherById(cs.getCourseArrangement().getTeacherId()).getTeacherName());
            courseDetail.setClassName(classInfoService.getClassInfo(cs.getCourseArrangement().getClassId()).getClassName());
            courseDetail.setCourseArrangementId(cs.getClassArrangementId());
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
        return "allClassScheduleDetails";
    }

    @RequestMapping("/toTeacherUpdate")
    String toTeacherUpdate(HttpServletRequest request) {
        System.out.println("-------------/administrator/toTeacherUpdate/--------------------");
        request.setAttribute("teacher", teacherInfoService.getTeacherById(request.getParameter("workId")));
        return "administratorTeacherUpdate";
    }

    @RequestMapping("/toStudentUpdate")
    String toUpdateCourse(HttpServletRequest request) {
        System.out.println("-------------/administrator/toUpdateCourse/--------------------");
        request.setAttribute("student", studentInfoService.getStudentById(request.getParameter("studentId")));
        request.setAttribute("allClassInfo", classInfoService.getAllClassInfo());
        return "administratorStudentUpdate";
    }

    @RequestMapping("/toCourseUpdate")
    String toCourseUpdate(HttpServletRequest request) {
        System.out.println("-------------/administrator/toCourseUpdate/--------------------");
        request.setAttribute("course", courseInfoService.getCourseInfo(Integer.parseInt(request.getParameter("courseId"))));
        return "administratorCourseUpdate";
    }

    @RequestMapping("/toClassroomUpdate")
    String toClassroomUpdate(HttpServletRequest request) {
        System.out.println("-------------/administrator/toClassroomUpdate/--------------------");
        request.setAttribute("classroom", classroomService.getClassroom(Integer.parseInt(request.getParameter("classroomId"))));
        return "administratorClassroomUpdate";
    }

    @RequestMapping("/toCourseArrangementUpdate")
    String toCourseArrangementUpdate(HttpServletRequest request) {
        System.out.println("-------------/administrator/toCourseArrangementUpdate/--------------------");
        int id = Integer.parseInt(request.getParameter("id"));
        List<CourseInfo> allCourse = courseInfoService.getAllCourse();
        List<TeacherInfo> allTeacher = teacherInfoService.getAllTeacher();
        List<ClassInfo> allClassInfo = classInfoService.getAllClassInfo();
        CourseArrangement courseArrangement = courseArrangementService.getCourseArrangementById(id);
        request.setAttribute("courseArrangement", courseArrangement);
        request.setAttribute("allCourse", allCourse);
        request.setAttribute("allTeacher", allTeacher);
        request.setAttribute("allClassInfo", allClassInfo);
        return "administratorCourseArrangementUpdate";
    }

    @RequestMapping("/toClassScheduleUpdate")
    String toClassScheduleUpdate(HttpServletRequest request) {
        System.out.println("-------------/administrator/toClassScheduleUpdate/--------------------");
        int caId = Integer.parseInt(request.getParameter("caId"));
        int times = Integer.parseInt(request.getParameter("times"));
        List<Classroom> allClassroom = classroomService.getAllClassroom();
        ClassSchedule cs = classScheduleService.getClassScheduleByCaIdAndTimes(caId, times);
        System.out.println(cs);
        CourseDetail courseDetail = new CourseDetail();
        courseDetail.setCourseName(courseInfoService.getCourseInfo(cs.getCourseArrangement().getCourseId()).getCourseName());
        courseDetail.setClassroom(classroomService.getClassroom(cs.getClassRoomId()).getClassroomName());
        courseDetail.setTeacherName(teacherInfoService.getTeacherById(cs.getCourseArrangement().getTeacherId()).getTeacherName());
        courseDetail.setClassName(classInfoService.getClassInfo(cs.getCourseArrangement().getClassId()).getClassName());
        courseDetail.setCourseArrangementId(cs.getClassArrangementId());
        courseDetail.setTimes(cs.getTimes());
        courseDetail.setWeek(cs.getWeekth());
        courseDetail.setDay(cs.getDayth());
        courseDetail.setCourseth(cs.getCourseth());
        request.setAttribute("allClassroom", allClassroom);
        request.setAttribute("courseDetail", courseDetail);
        request.setAttribute("cs", cs);
        return "administratorClassScheduleUpdate";
    }

    // 对用户名进行ajax验证
    @RequestMapping("/checkHaveCourse")
    @ResponseBody // 返回真实数据
    public boolean checkHaveCourse(String workId) { // 检查老师是否还有授课
        System.out.println("---------------/administrator/checkHaveCourse------------------");
        List<CourseArrangement> list = courseArrangementService.getCourseArrangementByTeacherId(workId);
        return list.isEmpty(); // 是空才能删
    }

    @RequestMapping("/canDeleteCourse")
    @ResponseBody // 返回真实数据
    public boolean canDeleteCourse(String courseId) { // 检查老师是否还有授课
        System.out.println("---------------/administrator/canDeleteCourse------------------");
        List<CourseArrangement> list = courseArrangementService.getCourseArrangementByCourseId(Integer.parseInt(courseId));
        return list.isEmpty(); // 是空才能删
    }

    @RequestMapping("/canDeleteRoom")
    @ResponseBody // 返回真实数据
    public boolean canDeleteRoom(String roomId) { // 检查老师是否还有授课
        System.out.println("---------------/administrator/canDeleteRoom------------------");
        int id = Integer.parseInt(roomId);
        List<ClassSchedule> list = classScheduleService.getClassScheduleByClassroomId(id);
        return list.isEmpty(); // 是空才能删
    }

    @RequestMapping("/canDeleteCourseArrangement")
    @ResponseBody // 返回真实数据
    public boolean canDeleteCourseArrangement(String courseArrangementId) { // 检查老师是否还有授课
        System.out.println("---------------/administrator/canDeleteCourseArrangement------------------");
        int id = Integer.parseInt(courseArrangementId);
        List<ClassSchedule> list = classScheduleService.getClassScheduleByCourseArrangementId(id);
        return list.isEmpty(); // 是空才能删
    }

    @RequestMapping("/canUseRoom")
    @ResponseBody // 返回真实数据
    public boolean canUseRoom(ClassSchedule classSchedule) { // 检查教室是否被占用
        System.out.println("---------------/administrator/canUseRoom------------------");

        int csId = classSchedule.getClassRoomId();
        int weekTh = classSchedule.getWeekth();
        int dayTh = classSchedule.getDayth();
        int courseth = classSchedule.getCourseth();
        ClassSchedule res = classScheduleService.getClassScheduleByPara4(csId, weekTh, dayTh, courseth);
        if (res == null) return true;
//        System.out.println(classSchedule);
//        System.out.println(res);
        if (res.getClassArrangementId().equals(classSchedule.getClassArrangementId()) && res.getTimes().equals(classSchedule.getTimes())) {
            return true;
        }
        return false;
    }

    @RequestMapping("/isTeacherFree")
    @ResponseBody // 返回真实数据
    public boolean isTeacherFree(ClassSchedule classSchedule) { // 检查教室是否被占用
        System.out.println("---------------/administrator/isTeacherFree------------------");
        String teacherId = courseArrangementService.getCourseArrangementById((classSchedule.getClassArrangementId())).getTeacherId();
        int classArrangementId = classSchedule.getClassArrangementId();
        int times = classSchedule.getTimes();
        int weekTh = classSchedule.getWeekth();
        int dayTh = classSchedule.getDayth();
        int courseTh = classSchedule.getCourseth();
        List<ClassSchedule> list = classScheduleService.getClassScheduleByTime(weekTh, dayTh, courseTh);
        System.out.println(classSchedule);
        System.out.println(list);
        if (list.isEmpty()) return true;
        for (ClassSchedule cs : list) {
            if (cs.getCourseArrangement().getTeacherId().equals(teacherId)) { // 该老师正在上课
                if (cs.getClassArrangementId().equals(classArrangementId) && cs.getTimes().equals(times)) {
                    return true;
                } else {
                    return false;
                }
            }
        }
        return true;
    }

    @RequestMapping("/isExistTeacher")
    @ResponseBody
    public boolean isExistTeacher(String workId) {
        System.out.println("-----------administrator/isExistTeacher----------------");
        System.out.println("workId");
        return teacherInfoService.getTeacherById(workId) != null;
    }


    @RequestMapping("/isExistStudent")
    @ResponseBody
    public boolean isExistStudent(String studentId) {
        System.out.println("-----------administrator/isExistStudent----------------");
        System.out.println(studentId);
        return studentInfoService.getStudentById(studentId) != null;
    }

    @RequestMapping("/isExistCourse")
    @ResponseBody
    public boolean isExistCourse(String courseName) {
        System.out.println("-----------administrator/isExistCourse----------------");
        System.out.println(courseName);
        return courseInfoService.getCourseInfoByName(courseName) != null;
    }

    @RequestMapping("/isExistClassroom")
    @ResponseBody
    public boolean isExistClassroom(String classroomName) {
        System.out.println("-----------administrator/isExistClassroom----------------");
        System.out.println(classroomName);
        return classroomService.getClassroomByName(classroomName) != null;
    }

    @RequestMapping("/isExistCourseArrangement")
    @ResponseBody
    public boolean isExistCourseArrangement(CourseArrangement courseArrangement) {
        System.out.println("-----------administrator/isExistCourseArrangement----------------");
        System.out.println(courseArrangement);
        return courseArrangementService.getCourseArrangementByCS(courseArrangement) != null;
    }

    @RequestMapping("/haveOtherCourse")
    @ResponseBody // 返回真实数据
    public boolean haveOtherCourse(ClassSchedule classSchedule) { // 检查当前时间该班级是否在上课
        System.out.println("---------------/administrator/haveOtherCourse------------------");
        int courseArrangementId = classSchedule.getClassArrangementId();
        int times = classSchedule.getTimes();
        int weekTh = classSchedule.getWeekth();
        int dayTh = classSchedule.getDayth();
        int courseTh = classSchedule.getCourseth();
        int classId = courseArrangementService.getCourseArrangementById(courseArrangementId).getClassId(); // 班级id
        List<ClassSchedule> list = classScheduleService.getClassScheduleByTime(weekTh, dayTh, courseTh);
        for (ClassSchedule cs : list) {
            if (cs.getCourseArrangement().getClassId() == classId) { // 当前班在上课
                if (!cs.getClassArrangementId().equals(courseArrangementId)) { // 不是当前课程
                    return false;
                }
                if (!cs.getTimes().equals(times)) { // 是当前课程但是不是当前次数
                    return false;
                }
            }
        }
        return true;
    }

    @RequestMapping("/canSchedule")
    @ResponseBody // 返回真实数据
    public boolean canSchedule(ClassSchedule classSchedule) { // 检查老师是否还有授课
        System.out.println("---------------/administrator/canSchedule------------------");
        ClassSchedule cs = classScheduleService.getClassScheduleByCaIdAndTimes(classSchedule.getClassArrangementId(), classSchedule.getTimes());
        return cs == null;
    }


    @RequestMapping("toDeleteTeacher")
    String toDeleteTeacher(HttpServletRequest request) {
        System.out.println("-------------/administrator/toDeleteTeacher/--------------------");
        teacherInfoService.deleteTeacher(request.getParameter("workId"));
        return "redirect:/administrator/getAllTeacher";
    }

    @RequestMapping("toDeleteCourse")
    String toDeleteCourse(HttpServletRequest request) {
        System.out.println("-------------/administrator/toDeleteCourse/--------------------");
        courseInfoService.deleteCourseInfo(Integer.parseInt(request.getParameter("courseId")));
        return "redirect:/administrator/getAllCourse";
    }

    @RequestMapping("toDeleteClassroom")
    String toDeleteClassroom(HttpServletRequest request) {
        System.out.println("-------------/administrator/toDeleteClassroom/--------------------");
        int id = Integer.parseInt(request.getParameter("roomId"));
        classroomService.deleteClassroom(id);
        return "redirect:/administrator/getAllClassroom";
    }

    @RequestMapping("toDeleteStudent")
    String toDeleteStudent(HttpServletRequest request) {
        System.out.println("-------------/administrator/toDeleteStudent/--------------------");
        System.out.println(request.getParameter("studentId"));
        studentInfoService.deleteStudent(request.getParameter("studentId"));
        return "redirect:/administrator/getAllStudent";
    }

    @RequestMapping("toDeleteCourseArrangement")
    String toDeleteCourseArrangement(HttpServletRequest request) {
        System.out.println("-------------/administrator/toDeleteCourseArrangement/--------------------");
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        courseArrangementService.deleteCourseArrangement(id);
        return "redirect:/administrator/getAllCourseArrangement";
    }

    @RequestMapping("toDeleteClassSchedule")
    String toDeleteClassSchedule(HttpServletRequest request) {
        System.out.println("-------------/administrator/toDeleteClassSchedule/--------------------");
        int caId = Integer.parseInt(request.getParameter("caId"));
        int times = Integer.parseInt(request.getParameter("times"));
        classScheduleService.deleteClassSchedule(caId, times);
        return "redirect:/administrator/getAllClassSchedule";
    }

    @RequestMapping("/teacherUpdate")
    String teacherUpdate(HttpServletRequest request, TeacherInfo teacherInfo) {
        System.out.println("-------------/administrator/teacherUpdate/--------------------");
        teacherInfoService.updateTeacher(teacherInfo);
        return "redirect:/administrator/getAllTeacher";
    }

    @RequestMapping("/studentUpdate")
    String studentUpdate(HttpServletRequest request, StudentInfo studentInfo) {
        System.out.println("-------------/administrator/studentUpdate/--------------------");
        studentInfoService.updateStudent(studentInfo);
        return "redirect:/administrator/getAllStudent";
    }

    @RequestMapping("/courseUpdate")
    String courseUpdate(HttpServletRequest request, CourseInfo courseInfo) {
        System.out.println("-------------/administrator/courseUpdate/--------------------");
        courseInfoService.updateCourseInfo(courseInfo);
        return "redirect:/administrator/getAllCourse";
    }

    @RequestMapping("/classroomUpdate")
    String classroomUpdate(HttpServletRequest request, Classroom room) {
        System.out.println("-------------/administrator/classroomUpdate/--------------------");
        classroomService.updateClassroom(room);
        return "redirect:/administrator/getAllClassroom";
    }

    @RequestMapping("/courseArrangementUpdate")
    String courseArrangementUpdate(HttpServletRequest request, CourseArrangement courseArrangement) {
        System.out.println("-------------/administrator/courseArrangementUpdate/--------------------");
        System.out.println(courseArrangement);
        courseArrangementService.updateCourseArrangement(courseArrangement);
        return "redirect:/administrator/getAllCourseArrangement";
    }

    @RequestMapping("/classScheduleUpdate")
    String classScheduleUpdate(HttpServletRequest request, ClassSchedule classSchedule) {
        System.out.println("-------------/administrator/classScheduleUpdate/--------------------");
        System.out.println(classSchedule);
        classScheduleService.classScheduleUpdate(classSchedule);
        return "redirect:/administrator/getAllClassSchedule";
    }

    @RequestMapping("/addTeacher")
    String addTeacher(TeacherInfo teacherInfo) {
        System.out.println("------------administrator/addTeacher---------------");
        System.out.println(teacherInfo);
        teacherInfoService.addTeacher(teacherInfo);
        return "redirect:/administrator/getAllTeacher";
    }

    @RequestMapping("/toAddStudent")
    String toAddStudent(HttpServletRequest request) {
        List<ClassInfo> allClassInfo = classInfoService.getAllClassInfo();
        request.setAttribute("allClassInfo", allClassInfo);
        return "addStudent";
    }

    @RequestMapping("/addStudent")
    String addStudent(StudentInfo studentInfo) {
        System.out.println("------------administrator/addStudent---------------");
        System.out.println(studentInfo);
        studentInfoService.addStudent(studentInfo);
        return "redirect:/administrator/getAllStudent";
    }

    @RequestMapping("/addCourse")
    String addCourse(CourseInfo courseInfo) {
        System.out.println("------------administrator/addCourse---------------");
        System.out.println(courseInfo);
        courseInfoService.addCourse(courseInfo);
        return "redirect:/administrator/getAllCourse";
    }

    @RequestMapping("/addClassroom")
    String addCourse(Classroom classroom) {
        System.out.println("------------administrator/addClassroom---------------");
        System.out.println(classroom);
        classroomService.addClassroom(classroom);
        return "redirect:/administrator/getAllClassroom";
    }


    @RequestMapping("/toAddCourseArrangement")
    String toAddCourseArrangement(HttpServletRequest request) {
        System.out.println("------------administrator/toAddCourseArrangement---------------");
        List<ClassInfo> allClassInfo = classInfoService.getAllClassInfo();
        List<CourseInfo> allCourseInfo = courseInfoService.getAllCourse();
        List<TeacherInfo> allTeacherInfo = teacherInfoService.getAllTeacher();
        request.setAttribute("allClassInfo", allClassInfo);
        request.setAttribute("allCourseInfo", allCourseInfo);
        request.setAttribute("allTeacherInfo", allTeacherInfo);
        return "addCourseArrangement";
    }

    @RequestMapping("/addCourseArrangement")
    String addCourseArrangement(CourseArrangement courseArrangement) {
        System.out.println("------------administrator/addCourseArrangement---------------");
        System.out.println(courseArrangement);
        courseArrangementService.addCourseArrangement(courseArrangement);
        return "redirect:/administrator/getAllCourseArrangement";
    }

    @RequestMapping("/toAddClassSchedule")
    String toAddClassSchedule(HttpServletRequest request) {
        System.out.println("------------administrator/toAddClassSchedule---------------");
        List<CourseArrangement> allCourseArrangement = courseArrangementService.getAllCourseArrangement();
        List<Classroom> allClassroom = classroomService.getAllClassroom();
        request.setAttribute("allCourseArrangement", allCourseArrangement);
        request.setAttribute("allClassroom", allClassroom);
        return "addClassSchedule";
    }

    @RequestMapping("/addClassSchedule")
    String addClassSchedule(ClassSchedule classSchedule) {
        System.out.println("------------administrator/addClassSchedule---------------");
        System.out.println(classSchedule);
        classScheduleService.addClassSchedule(classSchedule);
        return "redirect:/administrator/getAllClassSchedule";
    }

}
