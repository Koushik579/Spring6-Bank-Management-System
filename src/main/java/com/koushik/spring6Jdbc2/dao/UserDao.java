package com.koushik.spring6Jdbc2.dao;

import java.util.List;

import com.koushik.spring6Jdbc2.model.Admin;
import com.koushik.spring6Jdbc2.model.Transactions;
import com.koushik.spring6Jdbc2.model.User;

public interface UserDao {
	List<User> findall();
	List<Transactions> allTxn(String uname);
	List<Admin> adminDetails(String uname);
	int insert(User user);
	boolean authenticate(String uname,String pass);
	boolean custauth(String uname,String pass);
	List<User> userdetatils(String uname);
	int updateAmount(String uname,double balance);
	int inserttran(double amount,double balance,String uname,String type);
	int updateCust(String uname, String fname, String lname, String email, String phn, String Address);
}
