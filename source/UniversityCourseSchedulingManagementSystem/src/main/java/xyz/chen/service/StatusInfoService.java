package xyz.chen.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.chen.pojo.StatusInfo;

import java.util.List;

/**
 * @author Rw-chen
 * @version 0.1
 */
public interface StatusInfoService {
    public List<StatusInfo> getAllStatusInfo();
}
