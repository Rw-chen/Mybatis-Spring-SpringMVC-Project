package xyz.chen.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.chen.dao.StudentInfoMapper;
import xyz.chen.pojo.StudentInfo;
import xyz.chen.service.StudentInfoService;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
@Service
public class StudentInfoServiceImpl implements StudentInfoService {
    @Autowired
    private StudentInfoMapper studentInfoMapper;

    @Override
    public StudentInfo getStudentInfo(String studentId, String password) {
        return studentInfoMapper.getStudentInfo(studentId,password);
    }

    @Override
    public boolean checkLogin(String studentId, String password) {
        return studentInfoMapper.getStudentInfo(studentId, password) != null;
    }

    @Override
    public StudentInfo getStudentById(String id) {
        return studentInfoMapper.getStudentById(id);
    }

    @Override
    public void updateStudent(StudentInfo studentInfo) {
        studentInfoMapper.updateStudent(studentInfo);
    }

    @Override
    public List<StudentInfo> getAllStudent() {
        return studentInfoMapper.getAllStudent();
    }

    @Override
    public void deleteStudent(String id) {
        studentInfoMapper.deleteStudent(id);
    }

    @Override
    public void addStudent(StudentInfo studentInfo) {
        studentInfoMapper.addStudent(studentInfo);
    }
}
