package org.ramaniuk.mapper;

import org.ramaniuk.domain.Role;
import org.ramaniuk.domain.User;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper implements RowMapper<User> {

    @Override
    public User mapRow(ResultSet resultSet, int i) throws SQLException {
        User user = new User();
        user.setId(resultSet.getLong("id"));
        user.setLogin(resultSet.getString("login"));
        user.setEmail(resultSet.getString("email"));
        user.setPassword(resultSet.getString("password"));
        user.setRole(Role.values()[resultSet.getInt("role")]);
//        user.setAction(resultSet.getBoolean("action"));
        return user;
    }
}
