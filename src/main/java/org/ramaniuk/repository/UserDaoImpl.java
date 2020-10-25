package org.ramaniuk.repository;

import org.ramaniuk.dao.DaoException;
import org.ramaniuk.dao.UserDao;
import org.ramaniuk.domain.User;
import org.ramaniuk.mapper.UserMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class UserDaoImpl implements UserDao {

    private final JdbcTemplate jdbcTemplate;

    public UserDaoImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private Map<Long, User> cache = new HashMap<>();

    @Override
    public List<User> getAll() throws DaoException{
        String sql = "SELECT * FROM \"user\"";
        try {
            return jdbcTemplate.query(sql, new UserMapper());
        }catch (Exception e) {
            throw new DaoException("Users cannot to received", e);
        }
    }

    @Override
    public void create(User user) throws DaoException {
        String sql = "INSERT INTO \"user\" (\"login\", \"email\", \"password\") VALUES (?, ?, ?)";
        try {
            jdbcTemplate.update(sql, user.getLogin(), user.getEmail(), user.getPassword());
        }catch (Exception e) {
            throw new DaoException("User cannot to create", e);
        }
    }

//    @Override
//    public void create(User user) throws DaoException {
//        String sql = "INSERT INTO \"user\" (\"login\", \"password\", \"email\", \"role\", \"action\") VALUES (?, ?, ?, ?, ?)";
//        try {
//            jdbcTemplate.update(sql, user.getLogin(), user.getPassword(), user.getEmail(), user.getRole().ordinal(), user.getAction());
//        }catch (Exception e) {
//            throw new DaoException("User cannot to create", e);
//        }
//    }

    @Override
    public User getById(Long id) throws DaoException {
        String sql = "SELECT * FROM \"user\" WHERE \"id\"=?";
        try {
            return jdbcTemplate.queryForObject(sql, new UserMapper(), id);
        }catch (Exception e) {
            throw new DaoException("User cannot to received by ID", e);
        }
    }

    @Override
    public void update(User user) throws DaoException {
        String sql = "UPDATE \"user\" SET \"login\" = ?, \"email\" = ?, \"password\" = ?, \"role\" = ? WHERE \"id\" = ?";
        try {
            jdbcTemplate.update(sql, user.getLogin(), user.getEmail(), user.getPassword(), user.getRole().ordinal(), user.getId());
        }catch (Exception e) {
            throw new DaoException("User cannot to update", e);
        }
    }

//    @Override
//    public void update(User user) throws DaoException {
//        String sql = "UPDATE \"user\" SET \"login\" = ?, \"password\" = ?, \"email\" = ?, \"role\" = ?, \"action\" = ? WHERE \"id\" = ?";
//        try {
//            jdbcTemplate.update(sql, user.getLogin(), user.getPassword(), user.getEmail(), user.getRole().ordinal(), user.getAction(), user.getId());
//        }catch (Exception e) {
//            throw new DaoException("User cannot to update", e);
//        }
//    }

    @Override
    public void delete(Long id) throws DaoException {
        String sql = "DELETE FROM \"user\" WHERE \"id\" = ?";
        try {
            jdbcTemplate.update(sql, id);
        }catch (Exception e) {
            throw new DaoException("User cannot to delete", e);
        }
    }
}
