package org.ramaniuk.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;

@Configuration
@ComponentScan(basePackages = {"org.ramaniuk.service","org.ramaniuk.repository"})
public class SpringConfig {

    @Bean
    public JdbcTemplate getJdbcTemplate() {
        return new JdbcTemplate(getDataSource());
    }

    @Bean
    public DataSource getDataSource() {
        BasicDataSource dataSources = new BasicDataSource();
        dataSources.setDriverClassName("org.postgresql.Driver");
        dataSources.setUrl("jdbc:postgresql://localhost:5432/auction_db");
        dataSources.setUsername("postgres");
        dataSources.setPassword("Wassart");
        return dataSources;
    }


//        DriverManagerConnectionFactory connectionFactory = new DriverManagerConnectionFactory("spring.datasource.url", "spring.datasource.user", "spring.datasource.password");
//        PoolableConnectionFactory poolableConnectionFactory = new PoolableConnectionFactory(connectionFactory, null);
//        ObjectPool<PoolableConnection> connectionPool = new GenericObjectPool<>(poolableConnectionFactory);
//        poolableConnectionFactory.setPool(connectionPool);
//        PoolingDataSource<PoolableConnection> dataSource = new PoolingDataSource<>(connectionPool);


//    @Bean
//    public DataSource getDataSource() {
//        DriverManagerDataSource dataSource = new DriverManagerDataSource();
//        dataSource.setUrl("jdbc:postgresql://localhost:5432/auction_db?useSll=false");
//        dataSource.setUsername("postgres");
//        dataSource.setPassword("Wassart");
//        dataSource.setDriverClassName("org.postgresql.Driver");
//        return dataSource;
//    }

//    @Bean
//    public UserDao getUserDao() {
//        return new UserDaoImpl(getJdbcTemplate());
//    }
//
//    @Bean
//    public UserService getUserService() {
//        return new UserServiceImpl();
//    }
}

