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
	public int uic(String email,String tel ,String address,String username){
		int result = 0;
		String sql = "UPDATE user SET email =?,telephone=?, address=? WHERE username=?";
		result = db.update(sql,new String[]{email , tel , address, username});
		return result;
	}
	public int change_password(String username ,String before_pwd,String after_pwd){
		int result = 0;
		String sql = "UPDATE user SET password=? WHERE username=? and password=?";
		result = db.update(sql,new String[]{after_pwd,username,before_pwd});
		return result;
	}
	public Map<String,String> query_info(String username){
		String sql = "select email from user where username=?";
		return db.getMap(sql,new String[]{username});
	}
}