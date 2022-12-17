package xyz.chen.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.chen.dao.TeacherInfoMapper;
import xyz.chen.pojo.TeacherInfo;
import xyz.chen.service.TeacherInfoService;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
@Service
public class TeacherInfoServiceImpl implements TeacherInfoService {
    @Autowired
    private TeacherInfoMapper teacherInfoMapper;

    @Override
    public TeacherInfo getTeacherInfo(String workId, String password) {
        return teacherInfoMapper.getTeacherInfo(workId, password);
    }

    @Override
    public boolean checkLogin(String wordId, String password) {
        return teacherInfoMapper.getTeacherInfo(wordId, password) != null;
    }

    @Override
    public TeacherInfo getTeacherById(String id) {
        return teacherInfoMapper.getTeacherById(id);
    }

    @Override
    public void updateTeacher(TeacherInfo teacherInfo) {
        teacherInfoMapper.updateTeacher(teacherInfo);
    }

    @Override
    public List<TeacherInfo> getAllTeacher() {
        return teacherInfoMapper.getAllTeacher();
    }

    @Override
    public void deleteTeacher(String workId) {
        teacherInfoMapper.deleteTeacher(workId);
    }

    @Override
    public void addTeacher(TeacherInfo teacherInfo) {
        teacherInfoMapper.addTeacher(teacherInfo);
    }
}
