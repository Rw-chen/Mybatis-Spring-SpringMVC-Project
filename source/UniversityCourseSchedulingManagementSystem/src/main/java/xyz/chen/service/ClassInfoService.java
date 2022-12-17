package xyz.chen.service;

import org.springframework.stereotype.Service;
import xyz.chen.pojo.ClassInfo;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
public interface ClassInfoService {
    List<ClassInfo> getAllClassInfo();

    ClassInfo getClassInfo(int id);
}
