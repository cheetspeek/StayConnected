package com.fastrax.stayconnected.web;

import java.security.Principal;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fastrax.stayconnected.core.AccountService;
import com.fastrax.stayconnected.core.JobListingService;
import com.fastrax.stayconnected.core.entity.Account;
import com.fastrax.stayconnected.core.entity.JobListing;
import com.fastrax.stayconnected.core.entity.Role;

@Controller
public class AccountController {
	private static final Logger logger = LoggerFactory
			.getLogger(HomeController.class);
	@Autowired
	private AccountService accountService;
	private List<JobListing> jobItems;
	@Autowired
	private JobListingService jobListingService;

	/**
	 * Controls the user home page mapping
	 * @author Ben Degler, Louis Balzani
	 * @param principal		Used to access security interface and get current users name
	 * @param model			properties of the Model object
	 * @return AccountHome 	account home page of logged in user
	 */
	@RequestMapping(value = { "/", "/accounthome" }, method = RequestMethod.GET)
	public String home(Principal principal, Model model) {
		logger.info("login ID via Controller is: " + principal.getName());
		logger.info("login ID via AuthenticationContext is: " + getLoginId());		
		jobItems = jobListingService.getRecentJobListings();
		model.addAttribute("listing", jobItems);
		return "account/AccountHome";
	}

	/**
	 * Controls the user registration page mapping
	 * @author Ben Degler, Conner Simmons
	 * @param locale 		a new Locale object
	 * @param model			properties of the Model object
	 * @return AccountRegistration	account register page for new user
	 */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Locale locale, Model model) {
		Account acct = new Account();
		model.addAttribute("account", acct);
		return "account/AccountRegistration";
	}

	/**
	 * Controls the user confirmation page mapping
	 * @author Ben Degler
	 * @param locale	a new Locale object
	 * @param model		properties of the Model object
	 * @return AccountConfirmation	account confirm page of registering user
	 */
	@RequestMapping(value = "/registerConfirmation", method = RequestMethod.POST)
	public String processSubmit(
			@Valid @ModelAttribute("account") Account newAccount,
			BindingResult result, Model model) {
		if (!newAccount.getEmail().equals(newAccount.getEmailConfirm()))
			return "account/AccountRegistration";
		else if (!newAccount.getPassword().equals(
				newAccount.getPasswordConfirm()))
			return "account/AccountRegistration";
		else if (result.hasErrors())
			return "account/AccountRegistration";
		else {
			String password = newAccount.getPassword();
			password = encodePassword(password);
			newAccount.setPassword(password);
			accountService.createAccount(newAccount);
			return "account/AccountConfirmation";
		}
	}

	/**
	 * Controls the account status page mapping
	 * @author Ben Degler
	 * @param locale 		a new Locale object
	 * @param model			properties of the Model object
	 * @return AccountStatus	account status page of registering user
	 */
	@RequestMapping(value = "/accountstatus", method = RequestMethod.GET)
	public String accountStatus(Locale locale, Model model) {
		List<Account> acctList = accountService.getAllAccounts();
		Account account;
		for (int i = 0; i < acctList.size(); i++) {
			account = acctList.get(i);
			account.setRoleList(accountService.getRoles(account));
		}
		model.addAttribute("accounts", acctList);
		return "account/AccountStatus";
	}

	/**
	 * Controls the account status confirmation page mapping
	 * @author Ben Degler
	 * @param account		a new Account object with new user data
	 * @param locale		a new Locale object
	 * @param model			properties of the Model object
	 * @return AccountStatusConfirmation	account confirm page of registering user
	 */
	@RequestMapping(value = "/accountstatusconfirmation", method = RequestMethod.POST)
	public String accountStatusConfirmation(@Valid @ModelAttribute("account") Account account, BindingResult result, Model model) {
		if (account.isActive()) {
			accountService.activate(account);
		} else {
			accountService.deactivate(account);
		}
		model.addAttribute("accounts");
		return "account/AccountStatusConfirmation";
	}

	/**
	 * Will display all users account profile
	 * @author Ben Degler
	 * @param locale		a new Locale object
	 * @param model			properties of the Model object
	 * @return ViewProfile 	shows profiles of all public users
	 */
	@RequestMapping(value = "/viewallprofiles", method = RequestMethod.GET)
	public String viewAllProfiles(Locale locale, Model model) {
		model.addAttribute("profiles", accountService.getActiveAccounts());
		return "account/ViewAllProfiles";
	}

	/**
	 * Will display a users account profile to be edited
	 * @author Ben Degler
	 * @param locale		a new Locale object
	 * @param model			properties of the Model object
	 * @param account		contains the account data the user entered from the source page
	 * @return EditProfile 	JSP for editing an account profile
	 */
	@RequestMapping(value = "/editmyprofile", method = RequestMethod.POST)
	public String editProfile(Principal principal, @Valid @ModelAttribute("profile") Account account,  BindingResult result, Model model) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		Account getPass = accountService.getAccountByEmail(principal.getName());

		if (!passwordEncoder.matches(account.getPassword(),
				getPass.getPasswordConfirm())) {
			return "account/EditProfilePasswordCheck";
		}
		else{
			return "account/EditProfile";
		}
	}

	/**
	 * Will display a users account profile
	 * @author Ben Degler
	 * @param principal		STS Security function to access logged in user's name
	 * @param locale		a new Locale object
	 * @param model			properties of the Model object
	 * @return EditProfilePasswordCheck JSP for editing an account profile
	 */
	@RequestMapping(value = "/editprofilepasswordcheck", method = RequestMethod.GET)
	public String editProfilePassCheck(Principal principal, Locale locale, Model model) {
		Account account = accountService.getAccountByEmail(principal.getName());
		model.addAttribute("profile", account);
		return "account/EditProfilePasswordCheck";
	}

	/**
	 * Controls the update profile confirmation page mapping
	 * @author Ben Degler, Conner Simmons
	 * @param account		a new Account object with new user data
	 * @param locale		a new Locale object
	 * @param model			properties of the Model object
	 * @return EditProfileConfirmation	profile confirm page of updated profile
	 */
	@RequestMapping(value = "/editprofileconfirmation", method = RequestMethod.POST)
	public String editProfileConfirmation(@Valid @ModelAttribute("profile") Account account, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "account/EditProfile";
		}
		accountService.updateAccount(account);

		UsernamePasswordAuthenticationToken auth2 = new UsernamePasswordAuthenticationToken(
				account.getEmail(), account.getPassword());
		auth2.setDetails(account);
		SecurityContextHolder.getContext().setAuthentication(auth2);
		return "account/EditProfileConfirmation";
	}

	/**
	 * Controls the account roles page mapping
	 * @author Ben Degler
	 * @param model			properties of the Model object
	 * @return AccountRoles account role update page for registered user
	 */
	@RequestMapping(value = "/accountroles", method = RequestMethod.GET)
	public String accountRoles(Model model) {
		List<Account> acctList = accountService.getAllAccounts();
		Account account;
		
		for (int i = 0; i < acctList.size(); i++) {
			Role x = new Role();
			account = acctList.get(i);
			String[] list = accountService.getRoles(account);
			
			for(int j = 0; j < list.length; j++) {
				if(list[j].equals("Admin")) {
					x.setAdminChecked(true);
				}
				else if(list[j].equals("Faculty")) {
					x.setFacultyChecked(true);
				}
				else if(list[j].equals("Alumni")) {
					x.setAlumniChecked(true);
				}
				else {
					x.setStudentChecked(true);
				}
			}
			acctList.get(i).setRole(x);
		}
		model.addAttribute("accounts", acctList);
		return "account/AccountRoles";
	}

	/**
	 * Controls the account role confirmation page mapping
	 * @author Ben Degler
	 * @param account		a new Account object with new user data
	 * @param model			properties of the Model object
	 * @return AccountRoleConfirmation	account role update confirm page of registering user
	 */
	@RequestMapping(value = "/accountroleconfirmation", method = RequestMethod.POST)
	public String accountRolesConfirmation(@Valid @ModelAttribute("account") Account account, BindingResult result, Model model) {
		String[] list = account.getRoleList();
		if(accountService.updateRoles(account)==1){
			model.addAttribute("account", account);
			model.addAttribute("roleList", list);
			return "account/AccountRoleConfirmation";
		}
		else{
			return accountRoles(model);
		}				
	}
	
	//Returns the login name of the current session's logged in user.
	private String getLoginId() {
		String currentPrincipalName = "none";
		Authentication authentication = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
			currentPrincipalName = authentication.getName();
		}
		return currentPrincipalName;
	}
	
	/**
	 * Controls the account role confirmation page mapping
	 * @author Ben Degler
	 * @return roleList	list of accounts for jsp 
	 */
	@ModelAttribute("rolelist")
	public Map<String, String> getRoleList() {
		Map<String, String> roleList = new LinkedHashMap<String, String>();
		roleList.put("Faculty", "Faculty");
		roleList.put("Alumni", "Alumni");
		roleList.put("Student", "Student");
		return roleList;
	}

	//Encrypts the password using STS encryption
	public static String encodePassword(String rawPassword) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encryptedPassword = passwordEncoder.encode(rawPassword);
		return encryptedPassword;
	}
}
