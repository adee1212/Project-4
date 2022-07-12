package Query;

public class ProductQuery {
    public String get = "SELECT * FROM products";
    public String getByName = "SELECT * FROM products where name LIKE ?";    
    public String create = "INSERT INTO products (category_id, name, stock, price) VALUES (?, ?, ?, ?)";
    public String getById = "SELECT * FROM products where id = ?";   
    public String update = "UPDATE products SET name = ?, stock = ?, price = ? WHERE id = ?";
    public String delete = "DELETE FROM products WHERE id = ?";
}
