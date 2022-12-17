package xyz.chen.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Rw-chen
 * @version 0.1
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CourseArrangement { // ¿Î³Ì°²ÅÅ
    private Integer id; // ¿Î³Ì°²ÅÅ±àºÅ
    private Integer courseId; // ¿Î³Ì±àºÅ
    private Integer classId; //  ÊÚ¿Î°à¼¶±àºÅ
    private String teacherId; // Ö÷½²½ÌÊ¦±àºÅ
    private CourseInfo courseInfo;
    private ClassInfo classInfo;
    private TeacherInfo teacherInfo;
}
