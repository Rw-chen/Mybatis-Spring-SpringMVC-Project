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
public class CourseInfo { // �γ���Ϣ
    private Integer id; // ���
    private String courseName; // �γ�����
    private Double credit; // ѧ��
    private String detail; // �γ�����
}
