package xyz.chen.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import xyz.chen.pojo.TeacherInfo;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
public interface TeacherInfoMapper {
    TeacherInfo getTeacherInfo(@Param("id") String workId, @Param("pw") String password);

    @Select("select * from teacherInfo where workId = #{id}")
    TeacherInfo getTeacherById(String id);

    @Update("update teacherInfo set password = #{password}, teacherName = #{teacherName}, gender = #{gender}, " +
            "age = #{age}, title = #{title}, academic = #{academic}, detail = #{detail} where workId = #{workId}")
    void updateTeacher(TeacherInfo teacherInfo);

    @Select("select * from teacherInfo")
    List<TeacherInfo> getAllTeacher();

    @Select("delete from teacherInfo where workId = #{workId}")
    void deleteTeacher(String workId);

    @Insert("insert into teacherInfo values(#{workId}, #{password}, #{teacherName}, #{gender}, #{age}, #{title}, #{academic}, #{detail})")
    void addTeacher(TeacherInfo teacherInfo);
}
