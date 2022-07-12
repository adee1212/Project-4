/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Query;

/**
 *
 * @author Hudya
 */
public class TransactionQuery {
    public String get = "SELECT * FROM transactions";
    public String create = "INSERT INTO transactions (type, total_items) VALUES ( ?, ?)";
    public String getByName = "SELECT * FROM transactions where id LIKE ?";
}