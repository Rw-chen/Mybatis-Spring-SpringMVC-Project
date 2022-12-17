package xyz.chen.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.chen.dao.StatusInfoMapper;
import xyz.chen.pojo.StatusInfo;
import xyz.chen.service.StatusInfoService;
import java.util.List;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
@Service
public class StatusInfoServiceImpl implements StatusInfoService {

    @Autowired
    private StatusInfoMapper statusInfoMapper;

    @Override
    public List<StatusInfo> getAllStatusInfo() {
        return statusInfoMapper.getAllStatus();
    }
}
