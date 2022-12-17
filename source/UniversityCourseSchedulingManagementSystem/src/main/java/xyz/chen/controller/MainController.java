package xyz.chen.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import xyz.chen.pojo.Administrator;
import xyz.chen.pojo.StudentInfo;
import xyz.chen.pojo.TeacherInfo;
import xyz.chen.service.AdministratorService;
import xyz.chen.service.StudentInfoService;
import xyz.chen.service.TeacherInfoService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author Rw-chen
 * @version 0.1
 */
@Controller
@RequestMapping("/main")
public class MainController {

    // 退出登录
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        System.out.println("-----------/main/logout---------------");
        session.invalidate(); // 销毁session
        return "login";
    }

    @PostMapping("/login")
    public String login(Integer flag) {
        System.out.println("-------/main/login----------");
        if (flag == 1) { // 管理员
            return "forward:/administrator/login"; // 转发请求
        } else if (flag == 2) { // 老师
            return "forward:/teacher/login";
        } else { // 学生
            return "forward:/student/login";
        }
    }

//    @RequestMapping("/personalDetails")
//    public String personalDetails(HttpSession session) {
//        System.out.println("---------------/main/personalDetails-------------------");
//        Object user = session.getAttribute("user");
//        if (user instanceof Administrator) {

//        } else if (user instanceof TeacherInfo) {
//            String id = ((TeacherInfo)user).getWorkId();
//            session.setAttribute("teacher", teacherInfoService.getTeacherById(id));
//            return "teacherDetails";
//        } else if (user instanceof StudentInfo) {
//            String id = ((StudentInfo)user).getStudentId();
//            session.setAttribute("student", studentInfoService.getStudentById(id));
//            return "studentDetails";
//        } else { // error
//            System.out.println("????????????");
//        }
//        return "welcome"; // error
//    }

//    @RequestMapping("/toAdminModify")
//    public String toAdminModify() { // 进入修改界面
//        System.out.println("---------------/main/toAdminModify-----------------");
//        return "adminUpdate";
//    }
//
//    @RequestMapping("/adminModify")
//    public String adminModify(HttpSession session, Administrator admin) {
//        System.out.println("------------/main/adminModify----------------");
//        System.out.println(admin);
//        administratorService.updateAdministrator(admin);
//        session.setAttribute("name", admin.getAdminName());
//        return "main";
//    }
//
//    @RequestMapping("/toTeacherModify")
//    public String toTeacherModify() { // 进入修改界面
//        System.out.println("---------------/main/toTeacherModify-----------------");
//        return "TeacherUpdate";
//    }
//
//    @RequestMapping("/teacherModify")
//    public String teacherModify(HttpSession session, TeacherInfo teacher) {
//        System.out.println("------------/main/teacherModify----------------");
//        System.out.println(teacher);
////        teacherInfoService
////        session.setAttribute("name", admin.getAdminName());
//        return "main";
//    }

}
