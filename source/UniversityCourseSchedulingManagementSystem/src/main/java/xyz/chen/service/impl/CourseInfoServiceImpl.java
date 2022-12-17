package xyz.chen.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.chen.dao.CourseInfoMapper;
import xyz.chen.pojo.ClassInfo;
import xyz.chen.pojo.CourseInfo;
import xyz.chen.service.CourseInfoService;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
@Service
public class CourseInfoServiceImpl implements CourseInfoService {
    @Autowired
    private CourseInfoMapper courseInfoMapper;
    public CourseInfo getCourseInfo(int id) {
        return courseInfoMapper.getCourseInfo(id);
    }

    @Override
    public List<CourseInfo> getAllCourse() {
        return courseInfoMapper.getAllCourse();
    }

    @Override
    public void updateCourseInfo(CourseInfo courseInfo) {
        courseInfoMapper.updateCourseInfo(courseInfo);
    }

    @Override
    public void deleteCourseInfo(int id) {
        courseInfoMapper.deleteCourseInfo(id);
    }

    @Override
    public void addCourse(CourseInfo courseInfo) {
        courseInfoMapper.addCourse(courseInfo);
    }

    @Override
    public CourseInfo getCourseInfoByName(String courseName) {
        return courseInfoMapper.getCourseInfoByName(courseName);
    }
}
