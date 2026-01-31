package com.koushik.spring6Jdbc2.dao;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.koushik.spring6Jdbc2.model.Admin;
import com.koushik.spring6Jdbc2.model.Transactions;
import com.koushik.spring6Jdbc2.model.User;

@Repository
public class UserDaoImpl implements UserDao {
	private final JdbcTemplate jt;

	public UserDaoImpl(JdbcTemplate jt) {
		this.jt = jt;
	}

	@Override
	public List<User> findall() {
		String sql = "select * from customers";
		RowMapper<User> mapper = (rs, rowCount) -> {
			User u = new User();
			u.setUser(rs.getString("uname"));
			u.setFname(rs.getString("fname"));
			u.setLname(rs.getString("lname"));
			u.setEmail(rs.getString("email"));
			u.setPass(rs.getString("pass"));
			u.setPhn(rs.getString("phn"));
			u.setRole(rs.getString("role"));
			u.setStatus(rs.getString("status"));
			u.setAccNum(rs.getString("accountnum"));
			u.setAccType(rs.getString("accounttype"));
			u.setAddress(rs.getString("address"));
			u.setOpenDate(rs.getString("open_date"));
			u.setBalance(rs.getDouble("balance"));
			u.setDob(rs.getString("dob"));
			return u;
		};
		return jt.query(sql, mapper);
	}
	
	@Override
	public List<Transactions> allTxn(String uname) {
		String sql = "select * from transactions where uname=?";
		RowMapper<Transactions> mapper = (rs,num)->{
			Transactions t = new Transactions();
			t.setTxnId(rs.getString("txn_id"));
			t.setUname(rs.getString("uname"));
			t.setTxnType(rs.getString("txn_type"));
			t.setBalance(rs.getDouble("balance"));
			t.setAmount(rs.getDouble("amount"));
			t.setDate(rs.getString("txn_date"));
			return t;
		};
		return jt.query(sql, mapper,uname);
	}

	@Override
	public int insert(User user) {
		String sql = "insert into customers(uname,fname,lname,pass,email,phn) values(?,?,?,?,?,?)";
		return jt.update(sql, 
				user.getUser(),
				user.getFname(),
				user.getLname(),
				user.getPass(),
				user.getEmail(),
				user.getPhn());
	}

	@Override
	public boolean authenticate(String uname,String pass) {
		String sql="select count(*) from admins where uname=? and pass=?";
		Integer count = jt.queryForObject(sql,Integer.class,uname,pass);
		return (count != null && count==1);
	}

	@Override
	public boolean custauth(String uname, String pass) {
		String sql = "select count(*) from customers where uname=? and pass=?";
		Integer count = jt.queryForObject(sql, Integer.class,uname,pass);
		return (count != null && count == 1);
	}

	@Override
	public List<User> userdetatils(String uname) {
		String sql = "select * from customers where uname=?";
		RowMapper<User> mapper = (rs,rowCount)->{
			User u = new User();
			u.setUser(rs.getString("uname"));
			u.setFname(rs.getString("fname"));
			u.setLname(rs.getString("lname"));
			u.setEmail(rs.getString("email"));
			u.setPass(rs.getString("pass"));
			u.setPhn(rs.getString("phn"));
			u.setRole(rs.getString("role"));
			u.setStatus(rs.getString("status"));
			u.setAccNum(rs.getString("accountnum"));
			u.setAccType(rs.getString("accounttype"));
			u.setAddress(rs.getString("address"));
			u.setOpenDate(rs.getString("open_date"));
			u.setBalance(rs.getDouble("balance"));
			u.setDob(rs.getString("dob"));
			return u;
		};
		return jt.query(sql,mapper,uname);
	}

	@Override
	public int updateAmount(
			String uname,
			double balance) {
		String sql = "update customers set balance =? where uname=?";
		return jt.update(sql,balance,uname);
	}
	

	@Override
	public int inserttran(double amount,double balance,String uname,String type) {
		String sql = "insert into transactions(uname,amount,balance,txn_type) values(?,?,?,?)";
		return jt.update(sql,
				uname,
				amount,
				balance,
				type);
	}

	@Override
	public List<Admin> adminDetails(String uname) {
		String sql = "select * from admins where uname=?";
		RowMapper<Admin> mapper = (rs,num)->{
			Admin a = new Admin();
			a.setUname(uname);
			a.setFname(rs.getString("fname"));
			a.setLname(rs.getString("lname"));
			a.setId(rs.getString("govt_id"));
			a.setDesignation(rs.getString("designation"));
			a.setAddress(rs.getString("address"));
			a.setEmail(rs.getString("email"));
			a.setPhn(rs.getString("phn"));
			a.setJnDate(rs.getString("joining"));
			return a;
		};
		return jt.query(sql, mapper,uname);
	}

	@Override
	public int updateCust(String uname,
			String fname,
			String lname,
			String email,
			String phn,
			String address) {
		String sql = "update customers set fname=?,lname=?,email=?,phn=?,address=? where uname=?";
		return jt.update(sql,fname,lname,email,phn,address,uname);
	}
	
	
}
