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
public class CourseArrangement { // �γ̰���
    private Integer id; // �γ̰��ű��
    private Integer courseId; // �γ̱��
    private Integer classId; //  �ڿΰ༶���
    private String teacherId; // ������ʦ���
    private CourseInfo courseInfo;
    private ClassInfo classInfo;
    private TeacherInfo teacherInfo;
}
