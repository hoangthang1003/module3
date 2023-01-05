package service;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    void insertUser(User user) throws SQLException;

    User selectUser(int id);

    List<User> selectAllUsers();

    boolean deleteUser(int id) throws SQLException;

    boolean updateUser(User user) throws SQLException;

    List<User> searchUser(String country);

    User getUserById(int id);

    void insertUserStore(User user);

    List<User> displayList();

    boolean editUser(User user);

    boolean removeUser(int id);}
