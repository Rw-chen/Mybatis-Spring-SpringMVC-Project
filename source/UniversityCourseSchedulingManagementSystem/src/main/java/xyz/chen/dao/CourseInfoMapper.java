package xyz.chen.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import xyz.chen.pojo.CourseInfo;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
public interface CourseInfoMapper {
    // 根据课程编号查课程
    CourseInfo getCourseInfo(int id);

    @Select("select * from courseInfo where courseName = #{courseName}")
    CourseInfo getCourseInfoByName(String courseName);

    @Select("select * from courseInfo")
    List<CourseInfo> getAllCourse();

    @Update("update courseInfo set courseName = #{courseName}, credit = #{credit}, detail = #{detail} where id = #{id}")
    void updateCourseInfo(CourseInfo courseInfo);

    @Delete("delete from courseInfo where id = #{id}")
    void deleteCourseInfo(int id);

    @Insert("insert into courseInfo values(null, #{courseName}, #{credit}, #{detail})")
    void addCourse(CourseInfo courseInfo);
}
