package service;

import model.Product;

import java.util.List;

public interface IProductServise {
    List<Product> findAll();
    void add(Product product);
    void update(int id,Product product);
    void delete(int id);
    Product findById(int id);

}
