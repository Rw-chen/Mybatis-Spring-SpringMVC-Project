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
public class Classroom { // 教室信息
    private Integer id; // 教室编号
    private String classroomName; // 教室名称
    private Integer capacity; // 教室容量
}
