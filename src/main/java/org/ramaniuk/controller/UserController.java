package org.ramaniuk.controller;

import org.ramaniuk.domain.User;
import org.ramaniuk.service.ServiceException;
import org.ramaniuk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/")
public class UserController {

    @Autowired
    public UserService userService;

    @GetMapping("/")
    public String index() {
        return "home";
    }

    @GetMapping("/home")
    public String home() {
        return "home";
    }

    @GetMapping("/users")
    public String getAllUsers(Model model) throws ServiceException {
        model.addAttribute("users", userService.findAll());
        return "usersList";
    }

//    @GetMapping("/user/{id}")
//    public String getById(@PathVariable("id") long id, Model model) throws ServiceException {
//        model.addAttribute("user", userService.findById(id));
//        return "userPage";
//    }

    @GetMapping("/addUser")
    public String createUser() {
        return "loginRegistrationPage";
    }

    @PostMapping("/addUser")
    public String addUser(@ModelAttribute("user") User user) throws ServiceException {
        userService.save(user);
        return "redirect:/users";
    }

    @PostMapping("/updateUser")
    public String updateUser(@ModelAttribute("user") User user) throws ServiceException {
        userService.update(user);
        return "redirect:/users";
    }

    @GetMapping("/update/{id}")
    public String editUser(@PathVariable("id") long id, Model model) throws ServiceException {
        model.addAttribute("user", userService.findById(id));
        return "userPage";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") long id) throws ServiceException {
        userService.delete(id);
        return "redirect:/users";
    }
}
