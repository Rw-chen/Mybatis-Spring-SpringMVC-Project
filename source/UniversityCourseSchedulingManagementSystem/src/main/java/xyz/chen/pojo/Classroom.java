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
public class Classroom { // ������Ϣ
    private Integer id; // ���ұ��
    private String classroomName; // ��������
    private Integer capacity; // ��������
}
