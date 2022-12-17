package xyz.chen.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Service;
import xyz.chen.pojo.Classroom;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
public interface ClassroomMapper {
    Classroom getClassroom(int id);

    @Select("select * from classroom")
    List<Classroom> getAllClassroom();

    @Update("update classroom set classroomName = #{classroomName}, capacity = #{capacity} where id = #{id}")
    void updateClassroom(Classroom classroom);

    @Delete("delete from classroom where id = #{id}")
    void deleteClassroom(int id);

    @Insert("insert into classroom value(null, #{classroomName}, #{capacity})")
    void addClassroom(Classroom classroom);

    @Select("select * from classroom where classroomName = #{classroomName}")
    Classroom getClassroomByName(String classroomName);
}
