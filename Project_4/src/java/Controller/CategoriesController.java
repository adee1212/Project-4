package Controller;

import Query.CategoriesQuery;
import java.sql.ResultSet;

public class CategoriesController extends BaseController {
    
    CategoriesQuery query = new CategoriesQuery();
    
    public ResultSet get(){
        String sql = this.query.get;
        return this.get(sql);
    }
}
