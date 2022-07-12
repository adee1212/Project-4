/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Query.CategoriesQuery;
import java.sql.ResultSet;

/**
 *
 * @author RIFALDLEE
 */
public class CategoriesController extends BaseController {
    
    CategoriesQuery query = new CategoriesQuery();
    
    public ResultSet get(){
        String sql = this.query.get;
        return this.get(sql);
    }
}
