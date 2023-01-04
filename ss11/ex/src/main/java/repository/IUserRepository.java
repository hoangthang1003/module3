package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    public List<User> showList();
    public boolean add(User user);
    public boolean update(User user);
    public boolean delete(int id);
    public User findById(int id);
    public List<User> findByCountry(String country);

}
