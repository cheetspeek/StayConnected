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
	/**
	 * Uses accountDAO to get all the accounts 
	 * @author Ben Degler
	 * @precondition Database has at least one account
	 * @postcondition a List of all accounts is returned
	 * @return the list of all accounts and statuses in database
	 */
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

	/**  
	 * Uses accountDAO to deactivate a user account
	 * @author Ben Degler
	 * @precondition Account exists in database
	 * @postcondition Account status has been changed to inactive
	 * @return true to show method completion
	 */
	public int deactivate(Account account) {
		return accountDao.deactivate(account);
	}
	
	/**  
	 * Uses accountDAO to activate a user account
	 * @author Ben Degler
	 * @precondition Account exists in database
	 * @postcondition Account status has been changed to active
	 * @return true to show method completion
	 */
	public int activate(Account account) {
		return accountDao.activate(account);		
	}

	/**  
	 * Uses accountDAO to get an account by a specific email
	 * @author Conner Simmons
	 * @precondition Account exists in database
	 * @postcondition Returns the account with the specified email
	 * @return true to show method completion
	 */
	public Account getAccountByEmail(String email) {
		return accountDao.getAccountByEmail(email);
	}

	/**
	 * Uses accountDAO to get all the roles of an Account
	 * @author Conner Simmons
	 * @precondition Account exists
	 * @postcondition Account's roles are returned
	 * @return The roles of the given Account
	 */
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
		return accountDao.updateAccount(account);
	}

	/**  
	 * Uses accountDAO to update a users roles
	 * @author Ben Degler
	 * @precondition Account exists in database
	 * @postcondition Authority has been updated
	 * @return true to show method completion
	 */
	@Override
	public int updateRoles(Account account) {
		return accountDao.updateRoles(account);
	}
}
