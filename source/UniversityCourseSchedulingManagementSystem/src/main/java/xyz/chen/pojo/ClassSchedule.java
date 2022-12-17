package xyz.chen.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Rw-chen
 * @version 0.1
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
// 课程具体的时间和教室安排
public class ClassSchedule { // 课程具体的时间教室安排
    private Integer classArrangementId; // 课程安排id
    private Integer times; // 该课程第几次课
    private Integer classRoomId; // 教室id
    private Integer weekth; // 第几周
    private Integer dayth; // 这周的第几天
    private Integer courseth; // 第几节课
    private CourseArrangement courseArrangement; // 班级和老师
}
