package com.fastrax.stayconnected.core.db;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.fastrax.stayconnected.core.entity.Account;

@Repository
public class AccountDaoImpl implements AccountDao {
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	//private DataSourceTransactionManager transactionManager;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplate = new JdbcTemplate(this.dataSource);
	}

	/**
	 * Creates a new user Account
	 * @author Michael Holmes
	 * @precondition account does not exist in database already
	 * @postcondition account is created in the account table on the database
	 * @param account	an Account object
	 * @return account	the new account with user's information
	 */
	public Account createAccount(Account account){
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setIsolationLevel(TransactionDefinition.ISOLATION_REPEATABLE_READ);
		//TransactionStatus status = transactionManager.getTransaction(def);
	
		try {
			String SQL = "insert into account (firstname, lastname, email, password, active) values "
					+ "(?,?,?,?,?)";
			String firstname = account.getFirstname();
			String lastname = account.getLastname();
			String email = account.getEmail();
			String password = account.getPassword();
			boolean active = account.isActive();
			
			jdbcTemplate.update(SQL,firstname,lastname,email,password,active);
			
			account.setId(getAccountID());
			//transactionManager.commit(status);
		} catch (DataAccessException e) {
			System.out.println("Error in creating Product record, rolling back");
			//transactionManager.rollback(status);
			throw e;
		}
		return account;
	}
	
	/**
	 * Gets the most recent account ID
	 * @author Michael Holmes
	 * @precondition Database has at least one account
	 * @postcondition ID of the most recently added to the database account is returned
	 * @return the ID of the most recently added account to the database
	 */
	private int getAccountID() {
		String sql = "select max(id) from account";
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public List<Account> getAllAccounts(){
		return null;
	}

	public Account getAccountByUsername(String username){
		return null;
	}
	
	public int getNumberOfAccounts(){
		return 0;
	}

	public int getNumberOfAccountsByRole(String role){
		return 0;
	}

	public int deactivate(Account account){
		return 0;
	}	
}
