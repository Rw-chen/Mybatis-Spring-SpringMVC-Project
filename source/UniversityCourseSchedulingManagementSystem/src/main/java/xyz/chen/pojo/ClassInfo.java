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
public class ClassInfo { // 班级信息
    private Integer id; // 编号
    private String className; // 班级名称
    private Integer classSize; // 班级人数
}
