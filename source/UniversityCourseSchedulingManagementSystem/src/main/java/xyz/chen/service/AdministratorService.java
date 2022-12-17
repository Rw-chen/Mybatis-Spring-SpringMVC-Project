package xyz.chen.service;

import xyz.chen.pojo.Administrator;

/**
 * @author Rw-chen
 * @version 0.1
 */
public interface AdministratorService {

    Administrator getAdministrator(String id, String password);

    boolean checkLogin(String id, String password);

    Administrator getAdministratorById(String id);

    void updateAdministrator(Administrator admin);
}
