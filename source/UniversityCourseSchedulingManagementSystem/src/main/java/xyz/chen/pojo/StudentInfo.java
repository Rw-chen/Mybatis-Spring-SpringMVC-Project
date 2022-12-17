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
public class StudentInfo {
    private String studentId;
    private String password;
    private String studentName;
    private String gender;
    private Integer age;
    private Integer classId;
    private ClassInfo classInfo;
}
