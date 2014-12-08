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
	
	/**
	 * Uses accountDAO to create an account in the database 
	 * @author Conner Simmons
	 * @precondition Account entity exists and passed in as an argument
	 * @postcondition Account is created in the database and passed back with updated information
	 * @param Account	an account object
	 * @return Account	the new account with the updated information
	 */
	public Account createAccount(Account account) {
		return accountDao.createAccount(account);
	}

	public List<Account> getAllAccounts() {
		return accountDao.getAllAccounts();
	}
	
	/**
	 * Uses accountDAO to get all active accounts in the database 
	 * @author Conner Simmons
	 * @precondition An active account is in the database
	 * @postcondition Active accounts in the database are returned
	 * @return List of all active accounts in the database
	 */
	public List<Account> getActiveAccounts() {
		return accountDao.getActiveAccounts();
	}

	public int deactivate(Account account) {
		return accountDao.deactivate(account);
	}
	
	public int activate(Account account) {
		return accountDao.activate(account);		
	}

	public Account getAccountByEmail(String email) {
		Account account = accountDao.getAccountByEmail(email);
		if (account == null) {
			account = new Account();
		}
		return account;
	}

	@Override
	public String[] getRoles(Account account) {
		return accountDao.getRoles(account);
	}

	/**
	 * Uses accountDAO to update an account in the database 
	 * @author Conner Simmons
	 * @precondition Account entity exists and passed in as an argument
	 * @postcondition Account is updated in the database
	 * @param Account	an account object
	 * @return Account	the account with the updated information
	 */
	public int updateAccount(Account account) {
		//account.setId();
		return accountDao.updateAccount(account);
	}

	@Override
	public int updateRoles(Account account) {
		return accountDao.updateRoles(account);
	}
}
