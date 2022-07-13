package Model;

public class ProductModel {
       
    private String name;
    private String stock;
    private String price;
    private String category;

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPrice() {
        return price;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getStock() {
        return stock;
    }
    public void setCategory(String category) {
        this.category = category;
    }

    public String getCategory() {
        return category;
    }
}