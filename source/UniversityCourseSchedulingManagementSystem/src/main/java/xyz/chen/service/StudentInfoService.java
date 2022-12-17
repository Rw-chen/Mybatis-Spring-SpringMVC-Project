package xyz.chen.service;

import org.apache.ibatis.annotations.Param;
import xyz.chen.pojo.StudentInfo;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
public interface StudentInfoService {
    // �����˺������ȡ����
    StudentInfo getStudentInfo(String studentId, String password);

    // �����˻�����������Ƿ����
    boolean checkLogin(String studentId, String password);

    StudentInfo getStudentById(String id);

    void updateStudent(StudentInfo studentInfo);

    List<StudentInfo> getAllStudent();

    void deleteStudent(String id);

    void addStudent(StudentInfo studentInfo);
}
