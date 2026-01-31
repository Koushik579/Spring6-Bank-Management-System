package com.koushik.spring6Jdbc2.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koushik.spring6Jdbc2.dao.UserDao;
import com.koushik.spring6Jdbc2.model.Admin;
import com.koushik.spring6Jdbc2.model.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	@Autowired
	private UserDao userDao;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	@GetMapping("/login")
	public String login() {
		return "auth/login";
	}
	@GetMapping("/signup")
	public String signup() {
		return "auth/signup";
	}
	@GetMapping("/customers")
	public String customers(Model model) {
			model.addAttribute("users",userDao.findall());
			return "dashboard/admin/customers";
	}
	@GetMapping("/home")
	public String home(HttpSession session,Model model) {
		if(session.getAttribute("role").equals("customer")) {
			model.addAttribute("details",
					userDao.userdetatils(session.getAttribute("uname").toString()));
			return "dashboard/customer/custhome";
		}else {
			model.addAttribute("users",
					userDao.adminDetails(session.getAttribute("uname").toString()));
			return "dashboard/admin/home";
		}
	}
	@PostMapping("/home")
	public String home(
			@RequestParam("role")String role,
			@RequestParam("uname") String uname,
			@RequestParam("pass") String pass,
			Model model,
			RedirectAttributes redirectAttribute,
			HttpSession session) {
		System.out.print(role);
		boolean authenticate = false;
		if(role.equals("admin")) {
			authenticate = userDao.authenticate(uname, pass);
			
			if(authenticate) {
				model.addAttribute("users",userDao.adminDetails(uname));
				session.setAttribute("uname", uname);
				session.setAttribute("role", "admin");
				return "dashboard/admin/home";
			}else {
				redirectAttribute.addFlashAttribute("msg","Invalid Credentials");
				return "redirect:/login";
			}
		}else {
			authenticate = userDao.custauth(uname, pass);
			if(authenticate) {
				model.addAttribute("details",userDao.userdetatils(uname));
				session.setAttribute("uname", uname);
				session.setAttribute("role", "customer");
				return "dashboard/customer/custhome";
			}else {
				redirectAttribute.addFlashAttribute("msg","Invalid Credentials");
				return "redirect:/login";
			}
		}
			
	}
	@PostMapping("/register")
	public String register(
			User user,
			RedirectAttributes redirectAttribute,
			Model model) {
		int row = userDao.insert(user);
		if(row == 1) {
			redirectAttribute.addFlashAttribute("msg","Signup Successful");
			return "redirect:/login";
		}else {
			redirectAttribute.addFlashAttribute("error","Error Occured");
			return "redirect:/signup";
		}
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	@GetMapping("/deposit")
	public String deposit() {
		return "dashboard/customer/deposit";
	}
	@GetMapping("/withdraw")
	public String withdraw() {
		return "dashboard/customer/withdraw";
	}
	
	@GetMapping("/transactions")
	public String tran(HttpSession session,Model model) {
		model.addAttribute
		("transactions",userDao.allTxn((session.getAttribute("uname")).toString()));
		model.addAttribute("users",userDao.userdetatils((session.getAttribute("uname")).toString()));
		return "dashboard/customer/balance";
	}
	@PostMapping("/redeposit")
	public String redeposit(RedirectAttributes ra,
			@RequestParam("dipamount") double amount,
			@RequestParam("pass") String pass,
			HttpSession session,
			User user,
			Model model) {
		String txnType = "CREDIT";
		String uname = session.getAttribute("uname").toString();
		user = userDao.userdetatils(uname).get(0);
		boolean auth = userDao.custauth(uname, pass);
		if(auth) {
			if(amount <= 0) {
				ra.addFlashAttribute("amerror","Minimum Amount > 0");
				return "redirect:/deposit";
			}
			double newBalance = user.getBalance()+amount;
			user.setBalance(newBalance);
			userDao.inserttran(amount,newBalance,uname,txnType);
			userDao.updateAmount(uname, newBalance);
			ra.addFlashAttribute("success","Balance Updated");
			return "redirect:/deposit";
		}
		else {
			ra.addFlashAttribute("balerror","Incorrect Password");
			return "redirect:/deposit";
		}
	}
	@PostMapping("/rewith")
	public String rewith(RedirectAttributes ra,
			@RequestParam("withamount") double amount,
			@RequestParam("pass")String pass,
			HttpSession session,
			User user,
			Model model) {
		String txnType = "DEBIT";
		String uname = session.getAttribute("uname").toString();
		boolean auth = userDao.custauth(uname, pass);
		user = userDao.userdetatils(uname).get(0);
		if(auth) {
			if(amount < 100) {
				ra.addFlashAttribute("amerror","Minimum Amount "+"\u20B9"+"100");
				return "redirect:/withdraw";
			}
			if(amount > user.getBalance()) {
				ra.addFlashAttribute("balerror","Infufficient Balance");
				return "redirect:/withdraw";
			}
			if(amount == user.getBalance()) {
				ra.addFlashAttribute("balerror","Account Balance Cannnot Be 0");
				return "redirect:/withdraw";
			}
			double newBalance = user.getBalance()-amount;
			user.setBalance(newBalance);
			userDao.inserttran(amount,newBalance,uname,txnType);
			userDao.updateAmount(uname, newBalance);
			ra.addFlashAttribute("success","Balance Updated");
			return "redirect:/withdraw";
		}else {
			ra.addFlashAttribute("balerror","Password Incorrect");
			return "redirect:/withdraw";
		}
	}
	@PostMapping("/custDetails")
	public String custDetails(
			@RequestParam("uname") String uname,
			Model model) {
		model.addAttribute("details",userDao.userdetatils(uname));
		return "dashboard/admin/customerDetails";
	}
	@GetMapping("/custup")
	public String custUpdate(Model model,HttpSession session) {
		String uname = session.getAttribute("uname").toString();
		model.addAttribute("users",userDao.userdetatils(uname));
		return"dashboard/customer/custupdate";
	}
	@PostMapping("/updatecust")
	public String updateCust(HttpSession session,
			@RequestParam("fname") String fname,
			@RequestParam("lname") String lname,
			@RequestParam("email") String email,
			@RequestParam("phn") String phn,
			@RequestParam("address") String address,
			RedirectAttributes rs) {
		String uname = session.getAttribute("uname").toString();
		int update = userDao.updateCust(uname, fname, lname, email, phn, address);
		if(update > 0)
		{
			rs.addFlashAttribute("msg","Updated Successfully");
			return "redirect:/custup";
		}else {
			rs.addFlashAttribute("msg","An Error Occured");
			return "redirect:/custup";
		}
	}
}
