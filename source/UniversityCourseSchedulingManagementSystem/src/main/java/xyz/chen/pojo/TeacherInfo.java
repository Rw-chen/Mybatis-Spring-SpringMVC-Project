package xyz.chen.pojo;

import jdk.internal.org.objectweb.asm.tree.IincInsnNode;
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
public class TeacherInfo {
    private String workId; // 工号
    private String password; // 密码
    private String teacherName; // 老师名字
    private String gender; // 性别
    private Integer age; // 年龄
    private String title; // 老师职称
    private String academic; // 最高学历
    private String detail; // 老师主讲课程，特点等
}
