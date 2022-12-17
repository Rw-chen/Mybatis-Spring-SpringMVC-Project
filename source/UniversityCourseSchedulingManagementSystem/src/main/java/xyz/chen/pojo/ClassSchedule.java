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
// �γ̾����ʱ��ͽ��Ұ���
public class ClassSchedule { // �γ̾����ʱ����Ұ���
    private Integer classArrangementId; // �γ̰���id
    private Integer times; // �ÿγ̵ڼ��ο�
    private Integer classRoomId; // ����id
    private Integer weekth; // �ڼ���
    private Integer dayth; // ���ܵĵڼ���
    private Integer courseth; // �ڼ��ڿ�
    private CourseArrangement courseArrangement; // �༶����ʦ
}
