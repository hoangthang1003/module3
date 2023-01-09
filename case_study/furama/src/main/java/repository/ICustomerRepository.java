package repository;

import model.customer.Customer;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerRepository {
    public List<Customer> showList();
    public boolean update(Customer customer);
    public boolean delete(int id);
    public boolean add(Customer customer) throws SQLException;
    public Customer findById(int id);
}
