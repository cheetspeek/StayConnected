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

	public int deactivate(Account account) {
		return accountDao.deactivate(account);
	}

	public Account getAccountByEmail(String email) {
		Account account = accountDao.getAccountByEmail(email);
		if (account == null) {
			account = new Account();
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
