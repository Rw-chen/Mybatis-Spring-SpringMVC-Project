package xyz.chen.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import xyz.chen.pojo.CourseArrangement;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
public interface CourseArrangementMapper {
    List<CourseArrangement> getAllCourseArrangement();

    @Select("select * from courseArrangement where teacherId = #{workId}")
    List<CourseArrangement> getCourseArrangementByTeacherId(String workId);

    @Select("select * from courseArrangement where courseId = #{id}")
    List<CourseArrangement> getCourseArrangementByCourseId(int id);

    @Select("select * from courseArrangement where id = #{id}")
    CourseArrangement getCourseArrangementById(int id);

    @Select("select * from courseArrangement where courseId = #{courseId} and classId = #{classId} and teacherId = #{teacherId}")
    CourseArrangement getCourseArrangementByCS(CourseArrangement courseArrangement);

    @Update("update courseArrangement set courseId = #{courseId}, classId = #{classId}, teacherId = #{teacherId} where id = #{id}")
    void updateCourseArrangement(CourseArrangement courseArrangement);

    @Delete("delete from courseArrangement where id = #{id}")
    void deleteCourseArrangement(int id);

    @Insert("insert into courseArrangement values(null, #{courseId}, #{classId}, #{teacherId})")
    void addCourseArrangement(CourseArrangement courseArrangement);
}
