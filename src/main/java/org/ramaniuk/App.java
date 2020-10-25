package org.ramaniuk;

import org.ramaniuk.config.SpringConfig;
import org.ramaniuk.dao.DaoException;
import org.ramaniuk.domain.Role;
import org.ramaniuk.domain.User;
import org.ramaniuk.service.ServiceException;
import org.ramaniuk.service.UserServiceImpl;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

//
///**
// * Hello world!
// *
// */
public class App {


    public static void main( String[] args ) throws ServiceException {

        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(SpringConfig.class);
        UserServiceImpl bean = context.getBean(UserServiceImpl.class);

//        /* Create User */
//        User user = new User();
//        user.setLogin("Wassart");
//        user.setEmail("Wassart@gmail.com");
//        user.setPassword("Wassart");
////        user.setRole(Role.ADMIN);
////        user.setAction(Boolean.TRUE);
//        bean.save(user);

//        /* User update */
//        User existingUser = new User();
//        existingUser.setLogin("Wassart");
//        existingUser.setPassword("Wassart");
//        existingUser.setEmail("Wassart@gmail.com");
//        existingUser.setRole(Role.ADMIN);
////        existingUser.setAction(Boolean.TRUE);
//        existingUser.setId(1L);
//
//        if (existingUser.getId() != null) {
//            bean.update(existingUser);
//        }
//
//        bean.delete(4L);
//
        System.out.println(bean.findAll());
//
////        FactoryDao daoConfig = new FactoryDao();
////        daoConfig.getConnection();
//
//            UserDaoImpl userDaoImpl = new UserDaoImpl();
//
//            /* Create User */
//            User user = new User();
//            user.setLogin("Wassart");
//            user.setPassword("Wassart");
//            user.setEmail("Wassart@gmail.com");
//            user.setRole(Role.DEVELOPER);
//
//            userDaoImpl.create(user);
//
//
////        /* User readById */
////        System.out.println(userDaoImpl.readById(1L));
//
//
////        /* User update */
////        User existingUser = new User();
////        existingUser.setLogin("Smiles");
////        existingUser.setPassword("Smiles");
////        existingUser.setEmail("Smiles@gmail.com");
////        existingUser.setRole(Role.CLIENT);
////        existingUser.setId(2L);
////        if (existingUser.getId() != null) {
////            userDaoImpl.update(existingUser);
////        }
//
//
////        /* User delete */
////        userDaoImpl.delete(3L);
//
//
////        /* User receive */
////        System.out.println(userDaoImpl.readUser("Smiles", "Smiles"));
//        }
    }

}
