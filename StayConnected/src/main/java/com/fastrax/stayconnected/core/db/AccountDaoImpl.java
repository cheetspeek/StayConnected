package com.fastrax.stayconnected.core.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.fastrax.stayconnected.core.entity.Account;

@Repository
public class AccountDaoImpl implements AccountDao {
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	private DataSourceTransactionManager transactionManager;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplate = new JdbcTemplate(this.dataSource);
	}
	
	@Autowired
	public void setDataSourceTransactionManager(
			DataSourceTransactionManager txManager) {
		this.transactionManager = txManager;
	}

	/**
	 * Creates a new user Account
	 * @author Michael Holmes, Ben Degler
	 * @precondition account does not exist in database already
	 * @postcondition account is created in the account table on the database
	 * @param account	an Account object
	 * @return account	the new account with user's information
	 */
	public Account createAccount(Account account){
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setIsolationLevel(TransactionDefinition.ISOLATION_REPEATABLE_READ);
		TransactionStatus status = transactionManager.getTransaction(def);

		try {
			String SQL = "insert into account (firstname, lastname, address, city,"+
					" country, state, phone, email, password) values "
					+ "(?,?,?,?,?,?,?,?,?)";
			String SQL2 = "insert into authority (email, role) values (?,?)";
			
			String firstname = account.getFirstname();
			String lastname = account.getLastname();
			String address = account.getAddress();
			String city = account.getCity();
			String country = account.getCountry();
			String state = account.getState();
			String phone = account.getPhone();
			String email = account.getEmail();
			String password = account.getPassword();
			String[] roles = account.getRoleList();

			jdbcTemplate.update(SQL, firstname, lastname, address, city, 
					country, state, phone, email, password);
			for(int i = 0; i < roles.length; i++)
			{
				jdbcTemplate.update(SQL2,email,roles[i]);
			}

			transactionManager.commit(status);
		} catch (DataAccessException e) {
			System.out.println("Error in creating AccountDao record, rolling back");
			transactionManager.rollback(status);
			throw e;
		}
		return account;
	}

	/**
	 * Gets the most recent account 
	 * @author Michael Holmes
	 * @precondition Database has at least one account
	 * @postcondition ID of the most recently added to the database account is returned
	 * @return the ID of the most recently added account to the database
	 */
	public String getRecentAccountEmail() {
		String sql = "(select max(id), email from authority)";
		List<String> emailList = jdbcTemplate.query(sql, new AccountEmailHelperMapper());
		String email = emailList.get(0);
		return email;
	}

	/**
	 * Gets the accounts 
	 * @author Ben Degler
	 * @precondition Database has at least one account
	 * @postcondition a List of all accounts is returned
	 * @return the list of all accounts and statuses in database
	 */
	public List<Account> getAllAccounts(){
		String SQL = "select * from account";
		List<Account> accounts = jdbcTemplate.query(SQL, new AccountMapper());
		return accounts;
	}
	
	/**
	 * Gets all the roles of an Account
	 * @author Conner Simmons
	 * @precondition Account exists
	 * @postcondition Account's roles are returned
	 * @return The roles of the given Account
	 */
	public String[] getRoles(Account account) {
		String sql = "select role from authority where email = " + 
					"\"" + account.getEmail() + "\"";
		List<String> rolesList = jdbcTemplate.queryForList(sql, String.class); 
		String[] roles = rolesList.toArray(new String[rolesList.size()]);
		return roles;
	}
	
	/**  
	 * Deactivate a user account
	 * @author Ben Degler
	 * @precondition Account exists in database
	 * @postcondition Account status has been changed to inactive
	 * @return true to show method completion
	 */
	@Override
	public int deactivate(Account account) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setIsolationLevel(TransactionDefinition.ISOLATION_REPEATABLE_READ);
		TransactionStatus status = transactionManager.getTransaction(def);

		try {
			String SQL = "UPDATE account "
					   + "SET active=false "
					   + "WHERE email=?";
			String email = account.getEmail();
			jdbcTemplate.update(SQL,email);

			transactionManager.commit(status);
		} catch (DataAccessException e) {
			System.out.println("Error in updating AccountDao active, rolling back");
			transactionManager.rollback(status);
			throw e;
		}
		return 1; 
	}

	/**  
	 * Activate a user account
	 * @author Ben Degler
	 * @precondition Account exists in database
	 * @postcondition Account status has been changed to active
	 * @return true to show method completion
	 */
	@Override
	public int activate(Account account) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setIsolationLevel(TransactionDefinition.ISOLATION_REPEATABLE_READ);
		TransactionStatus status = transactionManager.getTransaction(def);

		try {
			String SQL = "UPDATE account "
					   + "SET active=true "
					   + "WHERE email=?";
			String email = account.getEmail();
			jdbcTemplate.update(SQL,email);

			transactionManager.commit(status);
		} catch (DataAccessException e) {
			System.out.println("Error in updating AccountDao active, rolling back");
			transactionManager.rollback(status);
			throw e;
		}
		return 1; 
	}
	
	public Account getAccountByEmail(String email){
		String SQL = "select * from account where email=\"" + email + "\"";
		List<Account> account = jdbcTemplate.query(SQL, new AccountMapper());
		return account.get(0);
	}

	/**  
	 * Update a user account
	 * @author Conner Simmons
	 * @precondition Account exists in database
	 * @postcondition Account has been updated
	 * @return true to show method completion
	 */
	public int updateAccount(Account account) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setIsolationLevel(TransactionDefinition.ISOLATION_REPEATABLE_READ);
		TransactionStatus status = transactionManager.getTransaction(def);
		System.out.println("in update account");
		System.out.println(account.getId());
		try {
		String sql = "UPDATE account SET firstname = ?, lastname = ?, "
				+ "address = ?, city = ?, country = ?, state = ?, phone = ?, "
				+ "email = ? WHERE id = ?";
		
		Object[] params = {account.getFirstname(), account.getLastname(),
				account.getAddress(), account.getCity(), account.getCountry(),
				account.getState(), account.getPhone(), account.getEmail(),
				account.getId()};
		
		jdbcTemplate.update(sql, params);
		transactionManager.commit(status);
		System.out.println("Updated Record with ID = " + account.getId());
		} catch (DataAccessException e) {
			System.out.println("Error in updating Account record, rolling back");
			transactionManager.rollback(status);
			throw e;
		}
		return 1;
	}

	/**  
	 * Update a users roles
	 * @author Ben Degler
	 * @precondition Account exists in database
	 * @postcondition Authority has been updated
	 * @return true to show method completion
	 */
	@Override
	public int updateRoles(Account account) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setIsolationLevel(TransactionDefinition.ISOLATION_REPEATABLE_READ);
		TransactionStatus status = transactionManager.getTransaction(def);

		try {
			String SQL = "DELETE FROM authority WHERE email=?";
			String SQL2 = "insert into authority (email, role) values (?,?)";
			
			String email = account.getEmail();
			jdbcTemplate.update(SQL,email);			
			
			if(!(account.getRoleList()==null))
			{
				String[] roles = account.getRoleList();			
			
				System.out.println("in update roles");
				System.out.println(account.getEmail());
				for(int i = 0; i < roles.length; i++)
				{
					System.out.println("Role: " + roles[i]);
					jdbcTemplate.update(SQL2,email,roles[i]);
				}
				transactionManager.commit(status);
			}
		} catch (DataAccessException e) {
			System.out.println("Error in updating Account roles, rolling back");
			transactionManager.rollback(status);
			throw e;
		}
		return 1; 
	}
}

//Helper class to extract the most recent email
class AccountEmailHelperMapper implements RowMapper<String> {
	public String mapRow(ResultSet rs, int rowNum) throws SQLException {
		String email = rs.getString("email");
		return email;
	}
}

class AccountMapper implements RowMapper<Account> {
	public Account mapRow(ResultSet rs, int rowNum) throws SQLException {
		Account account = new Account();
		account.setFirstname(rs.getString("firstname"));
		account.setLastname(rs.getString("lastname"));
		account.setAddress(rs.getString("address"));
		account.setCity(rs.getString("city"));
		account.setCountry(rs.getString("country"));
		account.setState(rs.getString("state"));
		account.setPhone(rs.getString("phone"));
		account.setEmail(rs.getString("email"));
		account.setEmailConfirm(rs.getString("email"));
		account.setActive(rs.getBoolean("active"));
		account.setId(rs.getInt("id"));
		account.setPasswordConfirm(rs.getString("password"));
		return account;
	}
}

