package service;

import model.User;

import java.util.List;

public interface IUserService {
    public List<User> showList();
    public boolean add(User user);
    boolean update(User user);
    public boolean delete(int id);
    public User findById(int id);
    public List<User> findByCountry(String country);


}
