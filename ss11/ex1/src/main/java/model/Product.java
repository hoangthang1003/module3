package model;

public class Product {
    private int id;
    private String product;
    private double price;
    private String describeProduct;
    private String manufacturer;


    public Product() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescribeProduct() {
        return describeProduct;
    }

    public void setDescribeProduct(String describeProduct) {
        this.describeProduct = describeProduct;
    }

    public Product(int id, String product, double price, String describeProduct, String manufacturer) {
        this.id = id;
        this.product = product;
        this.price = price;
        this.describeProduct = describeProduct;
        this.manufacturer = manufacturer;
    }

    public Product(String product, double price, String describeProduct, String manufacturer) {
        this.product = product;
        this.price = price;
        this.describeProduct = describeProduct;
        this.manufacturer = manufacturer;
    }
}
