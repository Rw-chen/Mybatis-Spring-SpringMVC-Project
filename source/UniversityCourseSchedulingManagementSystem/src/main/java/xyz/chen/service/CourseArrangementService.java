package xyz.chen.service;

import org.apache.ibatis.annotations.Delete;
import xyz.chen.pojo.CourseArrangement;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
public interface CourseArrangementService {
    List<CourseArrangement> getAllCourseArrangement();

    List<CourseArrangement> getCourseArrangementByTeacherId(String workId);

    List<CourseArrangement> getCourseArrangementByCourseId(int id);

    CourseArrangement getCourseArrangementById(int id);

    CourseArrangement getCourseArrangementByCS(CourseArrangement courseArrangement);

    void updateCourseArrangement(CourseArrangement courseArrangement);

    void deleteCourseArrangement(int id);

    void addCourseArrangement(CourseArrangement courseArrangement);
}
