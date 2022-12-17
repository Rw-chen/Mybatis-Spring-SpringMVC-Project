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
public class CourseDetail {
    private String courseName;  // 课程名称
    private String teacherName; // 主讲老师
    private String className; // 班级名称
    private Integer courseArrangementId;
    private Integer times; // 第几次课
    private Integer week;  // 第几周
    private String day;   // 星期几
    private Integer courseth; // 第几节课
    private String classroom; // 教室

    public void setDay(Integer day) {
        switch (day) {
            case 1: this.day = "周一"; break;
            case 2: this.day = "周二"; break;
            case 3: this.day = "周三"; break;
            case 4: this.day = "周四"; break;
            case 5: this.day = "周五"; break;
            case 6: this.day = "周六"; break;
            case 7: this.day = "周日"; break;
        }
    }
}
