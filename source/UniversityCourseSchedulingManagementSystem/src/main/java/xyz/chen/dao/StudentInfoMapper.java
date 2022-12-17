package xyz.chen.dao;

import org.apache.ibatis.annotations.*;
import xyz.chen.pojo.StudentInfo;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
public interface StudentInfoMapper {
    StudentInfo getStudentInfo(@Param("id") String studentId, @Param("pw") String password);

    StudentInfo getStudentById(String id);

    @Update("update studentInfo set password = #{password}, studentName = #{studentName}, gender = #{gender}, " +
            "age = #{age}, classId = #{classId} where studentId = #{studentId}")
    void updateStudent(StudentInfo studentInfo);

    List<StudentInfo> getAllStudent();

    @Delete("delete from studentInfo where studentId = #{id}")
    void deleteStudent(String id);

    @Insert("insert into studentInfo values(#{studentId}, #{password}, #{studentName}, #{gender}, #{age}, #{classId})")
    void addStudent(StudentInfo studentInfo);
}
