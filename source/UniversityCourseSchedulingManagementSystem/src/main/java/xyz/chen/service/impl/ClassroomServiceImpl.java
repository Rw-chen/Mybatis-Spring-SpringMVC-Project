package xyz.chen.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.chen.dao.ClassroomMapper;
import xyz.chen.pojo.Classroom;
import xyz.chen.service.ClassroomService;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
@Service
public class ClassroomServiceImpl implements ClassroomService {
    @Autowired
    private ClassroomMapper classroomMapper;

    @Override
    public Classroom getClassroom(int id) {
        return classroomMapper.getClassroom(id);
    }

    @Override
    public List<Classroom> getAllClassroom() {
        return classroomMapper.getAllClassroom();
    }

    @Override
    public void updateClassroom(Classroom classroom) {
        classroomMapper.updateClassroom(classroom);
    }

    @Override
    public void deleteClassroom(int id) {
        classroomMapper.deleteClassroom(id);
    }

    @Override
    public void addClassroom(Classroom classroom) {
        classroomMapper.addClassroom(classroom);
    }

    @Override
    public Classroom getClassroomByName(String classroomName) {
        return  classroomMapper.getClassroomByName(classroomName);
    }
}
