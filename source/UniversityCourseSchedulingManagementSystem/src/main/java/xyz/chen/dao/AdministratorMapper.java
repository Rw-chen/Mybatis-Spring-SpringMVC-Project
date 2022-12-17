package xyz.chen.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import xyz.chen.pojo.Administrator;

/**
 * @author Rw-chen
 * @version 0.1
 */
public interface AdministratorMapper {
    Administrator getAdministrator(@Param("id") String id, @Param("pw") String password);

    @Select("select * from administrator where id = #{id}")
    Administrator getAdministratorById(String id);

    @Update("update administrator set password = #{password}, adminName = #{adminName} where id = #{id}")
    void updateAdministrator(Administrator admin);
}
