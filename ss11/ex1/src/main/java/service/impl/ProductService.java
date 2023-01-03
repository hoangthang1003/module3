package service.impl;

import model.Product;
import repository.impl.ProductRepository;
import service.IProductServise;

import java.util.List;

public class ProductService implements IProductServise {
    private ProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public void add(Product product) {
        productRepository.add(product);
    }

    @Override
    public void update(int id, Product product) {
        productRepository.update(id, product);

    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }
}
