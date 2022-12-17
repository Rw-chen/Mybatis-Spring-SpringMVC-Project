package xyz.chen.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.chen.dao.AdministratorMapper;
import xyz.chen.pojo.Administrator;
import xyz.chen.service.AdministratorService;

/**
 * @author Rw-chen
 * @version 0.1
 */
@Service
public class AdministratorImpl implements AdministratorService {
    @Autowired
    AdministratorMapper administratorMapper;

    @Override
    public Administrator getAdministrator(String id, String password) {
        return administratorMapper.getAdministrator(id, password);
    }

    @Override
    public boolean checkLogin(String id, String password) {
        return administratorMapper.getAdministrator(id, password) != null;
    }

    @Override
    public Administrator getAdministratorById(String id) {
        return  administratorMapper.getAdministratorById(id);
    }

    @Override
    public void updateAdministrator(Administrator admin) {
        administratorMapper.updateAdministrator(admin);
    }
}
