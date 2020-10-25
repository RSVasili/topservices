package org.ramaniuk.service;

import org.ramaniuk.domain.User;

import java.util.List;

public interface UserService {

    void save(User user) throws ServiceException;

    User findById(Long id) throws ServiceException;

    List<User> findAll() throws ServiceException;

    void update(User user) throws ServiceException;

    void delete(Long id) throws ServiceException;
}
