package com.fastrax.stayconnected.core;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fastrax.stayconnected.core.entity.Account;

@Service
public interface AccountService {
	public Account createAccount(Account account);
	public List<Account> getAllAccounts();
	public int deactivate(Account account);
	public Account getAccountByEmail(String email);
	public int getNumberOfAccounts();
	public int getNumberOfAccountsByRole(String role);
	public int activate(Account account);
	public String[] getRoles(Account account);
}
