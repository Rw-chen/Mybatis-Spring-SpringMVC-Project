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
    private String courseName;  // �γ�����
    private String teacherName; // ������ʦ
    private String className; // �༶����
    private Integer courseArrangementId;
    private Integer times; // �ڼ��ο�
    private Integer week;  // �ڼ���
    private String day;   // ���ڼ�
    private Integer courseth; // �ڼ��ڿ�
    private String classroom; // ����

    public void setDay(Integer day) {
        switch (day) {
            case 1: this.day = "��һ"; break;
            case 2: this.day = "�ܶ�"; break;
            case 3: this.day = "����"; break;
            case 4: this.day = "����"; break;
            case 5: this.day = "����"; break;
            case 6: this.day = "����"; break;
            case 7: this.day = "����"; break;
        }
    }
}
