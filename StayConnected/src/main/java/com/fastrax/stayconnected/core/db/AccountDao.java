package com.fastrax.stayconnected.core.db;

import java.util.List;
import org.springframework.stereotype.Repository;

import com.fastrax.stayconnected.core.entity.Account;

@Repository
public interface AccountDao {
	public Account createAccount(Account account);
	public List<Account> getAllAccounts();
	public Account getAccountByEmail(String email);
	public int getNumberOfAccounts();
	public int getNumberOfAccountsByRole(String role);
	public int deactivate(Account account);
	public int activate(Account account);	
	public String[] getRoles(Account account);
}
