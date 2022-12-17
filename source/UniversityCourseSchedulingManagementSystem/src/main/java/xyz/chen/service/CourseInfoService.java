package xyz.chen.service;

import xyz.chen.pojo.CourseInfo;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
public interface CourseInfoService {
    CourseInfo getCourseInfo(int id);

    List<CourseInfo> getAllCourse();

    void updateCourseInfo(CourseInfo courseInfo);

    void deleteCourseInfo(int id);

    void addCourse(CourseInfo courseInfo);

    CourseInfo getCourseInfoByName(String courseName);
}
