package xyz.chen.service;

import xyz.chen.pojo.TeacherInfo;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
public interface TeacherInfoService {
    TeacherInfo getTeacherInfo(String workId, String password);

    boolean checkLogin(String wordId, String password);

    TeacherInfo getTeacherById(String id);

    void updateTeacher(TeacherInfo teacherInfo);

    List<TeacherInfo> getAllTeacher();

    void deleteTeacher(String workId);

    void addTeacher(TeacherInfo teacherInfo);
}
