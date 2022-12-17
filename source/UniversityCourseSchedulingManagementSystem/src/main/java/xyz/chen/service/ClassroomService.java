package xyz.chen.service;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Update;
import xyz.chen.pojo.Classroom;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
public interface ClassroomService {
    Classroom getClassroom(int id);

    List<Classroom> getAllClassroom();

    void updateClassroom(Classroom classroom);

    void deleteClassroom(int id);

    void addClassroom(Classroom classroom);

    Classroom getClassroomByName(String classroomName);
}
