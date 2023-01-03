package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1,"Áo", 10, "Đẹp", "HAT"));
        productList.add(new Product(2,"Quần", 20, "Bền", "HAT"));
        productList.add(new Product(3,"Mũ", 5, "Chất", "HAT"));
        productList.add(new Product(4,"Giày", 100, "Ngầu", "HAT"));
        productList.add(new Product(5,"Dép", 15, "Đẹp", "HAT"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public void update(int id, Product product) {
        int index = 0;
        for (int i = 0; i < productList.size(); i++) {
            if (id == productList.get(i).getId()) {
                index = i;
                break;
            }
        }
        productList.set(index, product);

    }

    @Override
    public void delete(int id) {
        productList.remove(id);
    }

    @Override
    public Product findById(int id) {
        for (Product p : productList) {
            if (id == p.getId()) {
                return p;
            }
        }
        return null;
    }
}

