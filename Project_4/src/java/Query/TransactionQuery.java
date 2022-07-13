package Query;

public class TransactionQuery {
    public String get = "SELECT * FROM transactions";
    public String create = "INSERT INTO transactions (type, total_items) VALUES ( ?, ?)";
    public String getByName = "SELECT * FROM transactions where name LIKE ?";
    public String getById = "SELECT * FROM transactions where id = ?";   
    public String delete = "DELETE FROM transactions WHERE id = ?";

}