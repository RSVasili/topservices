package org.ramaniuk.dao;

import org.ramaniuk.domain.User;

import java.util.List;

public interface UserDao extends EntityDao<User> {

        List<User> getAll() throws DaoException;
}
