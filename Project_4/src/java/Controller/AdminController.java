package Controller;

import Query.AdminQuery;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

public class AdminController extends BaseController {
    AdminQuery query = new AdminQuery();
    
    public ResultSet getByUsername(String username) {
        String sql = this.query.getByUsername;
        
        Map<Integer, Object> map = new HashMap<>();
        map.put(1, username);
        
        return this.getWithParameter(map, sql);
    }
}