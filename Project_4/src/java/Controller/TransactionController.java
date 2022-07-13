package Controller;

import Helper.StringHelper;
import Model.TransactionModel;
import Query.TransactionQuery;
import java.sql.ResultSet;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

public class TransactionController extends BaseController {
    
    TransactionQuery query = new TransactionQuery();
    
    public ResultSet get() {
        String sql = this.query.get;
        return this.get(sql);
    }
    public boolean create(TransactionModel model) throws ParseException {
        
        Map<Integer, Object> map = new HashMap<>();
       
        map.put(1, model.getAdmin_id());
        map.put(2, model.getProduct_id());
        map.put(3, model.getType());
        map.put(4, model.getTotal_items());
        
        String sql = this.query.create;
        
        return this.preparedStatement(map, sql);
    }
    public ResultSet getByName(String name) {
        String sql = this.query.getByName;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, StringHelper.parseLikeQuery(name));
        
        return this.getWithParameter(map, sql);
    }
    public ResultSet getById(String id) {
        String sql = this.query.getById;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, id);
        
        return this.getWithParameter(map, sql);
    }
    
    public boolean delete(String id) throws ParseException {
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, id);
        
        String sql = this.query.delete;
        return this.preparedStatement(map, sql);
    }
}