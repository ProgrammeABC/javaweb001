package model;

import util.DBUtil;

import java.sql.*;
import java.util.Map;
import java.util.List;
import java.util.Map;
import util.DBUtil;

public class IPFilterService {

    private DBUtil db;

    public IPFilterService() {
        db = new DBUtil();
    }

    public boolean ip_query(String ip) {
        String sql = "select * from ipblacklist where IP=?";
        if(db.getMap(sql, new String[] { ip })!=null){
            return true;
        }else {
            return false;
        }
    }
    public int register(String username,String password,String email,String tel ,String address){
        int result = 0;
        String sql = "INSERT INTO user (username, password, email ,telephone, address) VALUES (? ,? ,? ,? ,?)";
        result = db.update(sql,new String[]{username , password , email , tel ,address});
        return result;
    }

}
