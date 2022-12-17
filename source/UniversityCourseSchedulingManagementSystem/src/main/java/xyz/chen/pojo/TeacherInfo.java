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
    private String workId; // ����
    private String password; // ����
    private String teacherName; // ��ʦ����
    private String gender; // �Ա�
    private Integer age; // ����
    private String title; // ��ʦְ��
    private String academic; // ���ѧ��
    private String detail; // ��ʦ�����γ̣��ص��
}
