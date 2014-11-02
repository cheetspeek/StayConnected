package com.fastrax.stayconnected.core.db;

import java.util.List;
import org.springframework.stereotype.Repository;


import com.fastrax.stayconnected.core.entity.Account;
@Repository
public interface AccountDao {
	public Account createAccount(Account account);
	public List<Account> getAllAccounts();
	public Account getAccountByUsername(String username);
	public int getNumberOfAccounts();
	public int getNumberOfAccountsByRole(String role);
	public int deactivate(Account account);
}
