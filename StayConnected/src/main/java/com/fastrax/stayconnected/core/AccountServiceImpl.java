package com.fastrax.stayconnected.core;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fastrax.stayconnected.core.db.AccountDao;
import com.fastrax.stayconnected.core.entity.Account;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	private AccountDao accountDao;

	public Account createAccount(Account account) {
		return accountDao.createAccount(account);
	}

	public List<Account> getAllAccounts() {
		return accountDao.getAllAccounts();
	}

	public int delete(Account account) {
		return accountDao.delete(account);
	}

	public Account getAccountByUsername(String username) {
		Account account = accountDao.getAccountByUsername(username);
		if (account == null) {
			account = new Account();
			account.setId(0);
		}
		return account;
	}

	public int getNumberOfAccounts() {
		return accountDao.getNumberOfAccounts();
	}

	public int getNumberOfAccountsByRole(String role) {
		return accountDao.getNumberOfAccountsByRole(role);
	}
}
