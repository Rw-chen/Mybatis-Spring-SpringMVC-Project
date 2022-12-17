package xyz.chen.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.chen.dao.CourseArrangementMapper;
import xyz.chen.pojo.CourseArrangement;
import xyz.chen.service.CourseArrangementService;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
@Service
public class CourseArrangementServiceImpl implements CourseArrangementService {
    @Autowired
    private CourseArrangementMapper courseArrangementMapper;

    @Override
    public List<CourseArrangement> getAllCourseArrangement() {
        return courseArrangementMapper.getAllCourseArrangement();
    }

    @Override
    public List<CourseArrangement> getCourseArrangementByTeacherId(String workId) {
        return courseArrangementMapper.getCourseArrangementByTeacherId(workId);
    }

    @Override
    public List<CourseArrangement> getCourseArrangementByCourseId(int id) {
        return courseArrangementMapper.getCourseArrangementByCourseId(id);
    }

    @Override
    public CourseArrangement getCourseArrangementById(int id) {
        return courseArrangementMapper.getCourseArrangementById(id);
    }

    @Override
    public CourseArrangement getCourseArrangementByCS(CourseArrangement courseArrangement) {
        return courseArrangementMapper.getCourseArrangementByCS(courseArrangement);
    }

    @Override
    public void updateCourseArrangement(CourseArrangement courseArrangement) {
        courseArrangementMapper.updateCourseArrangement(courseArrangement);
    }

    @Override
    public void deleteCourseArrangement(int id) {
        courseArrangementMapper.deleteCourseArrangement(id);
    }

    @Override
    public void addCourseArrangement(CourseArrangement courseArrangement) {
        courseArrangementMapper.addCourseArrangement(courseArrangement);
    }
}
