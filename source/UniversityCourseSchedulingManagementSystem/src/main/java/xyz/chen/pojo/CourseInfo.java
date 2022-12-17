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
public class CourseInfo { // 课程信息
    private Integer id; // 编号
    private String courseName; // 课程名称
    private Double credit; // 学分
    private String detail; // 课程描述
}
