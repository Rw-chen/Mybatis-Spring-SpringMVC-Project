package xyz.chen.dao;

import org.springframework.stereotype.Component;
import xyz.chen.pojo.ClassInfo;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
public interface ClassInfoMapper {
    List<ClassInfo> getAllClassInfo();

    ClassInfo getClassInfo(int id);
}
