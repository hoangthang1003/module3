package service.impl;

import model.User;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    UserRepository userRepository = new UserRepository();
    @Override
    public List<User> showList() {
        return userRepository.showList();
    }

    @Override
    public boolean add(User user) {
        return userRepository.add(user);
    }

    @Override
    public boolean update(User user) {
        return userRepository.update(user);
    }

    @Override
    public boolean delete(int id) {
        return userRepository.delete(id);
    }

    @Override
    public User findById(int id) {
        return userRepository.findById(id);
    }

    @Override
    public List<User> findByCountry(String country) {
        return userRepository.findByCountry(country);
    }
}
