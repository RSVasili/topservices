package org.ramaniuk.dao;

import org.ramaniuk.domain.Entity;

public interface EntityDao <T extends Entity> {

    void create(T entity) throws DaoException;

    T getById(Long id) throws DaoException;

    void update(T entity) throws DaoException;

    void delete(Long id) throws DaoException;
}
