package xyz.chen.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.chen.dao.ClassInfoMapper;
import xyz.chen.pojo.ClassInfo;
import xyz.chen.service.ClassInfoService;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
@Service
public class ClassInfoServiceImpl implements ClassInfoService {
    @Autowired // ×Ô¶¯×¢Èë
    ClassInfoMapper classInfoMapper;
    @Override
    public List<ClassInfo> getAllClassInfo() {
        return classInfoMapper.getAllClassInfo();
    }

    @Override
    public ClassInfo getClassInfo(int id) {
        return classInfoMapper.getClassInfo(id);
    }
}
