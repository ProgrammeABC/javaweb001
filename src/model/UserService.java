package model;

import java.sql.SQLDataException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;
import java.util.Map;
import util.DBUtil;

public class UserService {

	private DBUtil db;

	public UserService() {
		db = new DBUtil();
	}

	public Map<String, String> login(String username, String password) {
		String sql = "select * from user where username=? and password=?";
		return db.getMap(sql, new String[] { username, password });
//		return db.getMap(sql, new String[] { "张三", "123" });
	}
	public int register(String username,String password,String email,String tel ,String address){
		int result = 0;
		String sql = "INSERT INTO user (username, password, email ,telephone, address) VALUES (? ,? ,? ,? ,?)";
		result = db.update(sql,new String[]{username , password , email , tel ,address});
		return result;
	}

}