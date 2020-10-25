package org.ramaniuk.service;

import org.ramaniuk.dao.DaoException;
import org.ramaniuk.dao.UserDao;
import org.ramaniuk.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public void save(User user) throws ServiceException {
        try {
            userDao.create(user);
        } catch (DaoException e) {
            throw new ServiceException("Service save cannot be completed", e);
        }
    }

    @Override
    public User findById(Long id) throws ServiceException {
        try {
            return userDao.getById(id);
        } catch (DaoException e) {
            throw new ServiceException("Service findById cannot be completed", e);
        }
    }

    @Override
    public List<User> findAll() throws ServiceException {
        try {
            return userDao.getAll();
        } catch (DaoException e) {
            throw new ServiceException("Service findById cannot be completed", e);
        }
    }

    @Override
    public void update(User user) throws ServiceException {
        try {
            userDao.update(user);
        } catch (DaoException e) {
            throw new ServiceException("Service findById cannot be completed", e);
        }
    }

    @Override
    public void delete(Long id) throws ServiceException {
        try {
            userDao.delete(id);
        } catch (DaoException e) {
            throw new ServiceException("Service findById cannot be completed", e);
        }
    }
}
