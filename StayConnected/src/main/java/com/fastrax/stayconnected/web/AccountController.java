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
import com.fastrax.stayconnected.core.entity.Account;
import com.fastrax.stayconnected.core.entity.JobListing;

@Controller
public class AccountController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private AccountService accountService;
	/**
	 * Controls the user home page mapping
	 * @author Ben Degler
	 * @param principal		Used to access security interface and get current users name
	 * @param model			properties of the Model object	
	 * @return AccountHome	account home page of logged in user
	 */
	@RequestMapping(value = {"/","/accounthome"}, method = RequestMethod.GET)
	public String home(Principal principal, Model model) {
		logger.info("login ID via Controller is: "+ principal.getName());
		logger.info("login ID via AuthenticationContext is: "+ getLoginId());
		return "account/AccountHome";
	}

	/**
	 * Controls the user registration page mapping
	 * @author Ben Degler, Conner Simmons
	 * @param locale				a new Locale object
	 * @param model					properties of the Model object	
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
	 * @param locale				a new Locale object
	 * @param model					properties of the Model object	
	 * @return AccountConfirmation	account confirm page of registering user
	 */
	@RequestMapping(value = "/registerConfirmation", method = RequestMethod.POST)
	public String processSubmit(@Valid @ModelAttribute("account") Account newAccount, BindingResult result, Model model) {
		if(!newAccount.getEmail().equals(newAccount.getEmailConfirm()))
			return "account/AccountRegistration";
		else if(!newAccount.getPassword().equals(newAccount.getPasswordConfirm()))
			return "account/AccountRegistration";
		else if(result.hasErrors())
			return "account/AccountRegistration";
		else
		{
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
	 * @param locale				a new Locale object
	 * @param model					properties of the Model object	
	 * @return AccountStatus	account confirm page of registering user
	 */
	@RequestMapping(value = "/accountstatus", method = RequestMethod.GET)
	public String accountStatus(Locale locale, Model model) {
		List<Account> acctList = accountService.getAllAccounts();
		Account account;
		for(int i=0; i<acctList.size(); i++) {
			account = acctList.get(i);
			account.setRoleList(accountService.getRoles(account));
		}
		model.addAttribute("accounts", acctList);
		return "account/AccountStatus";
	}

	/**
	 * Controls the account status confirmation page mapping
	 * @author Ben Degler
	 * @param account				a new Account object with new user data
	 * @param locale				a new Locale object
	 * @param model					properties of the Model object	
	 * @return AccountStatusConfirmation	account confirm page of registering user
	 */
	@RequestMapping(value = "/accountstatusconfirmation", method = RequestMethod.POST)
	public String accountStatusConfirmation(@Valid @ModelAttribute("account") Account account, BindingResult result, Model model) {
		System.out.println("Email: " + account.getEmail());
		System.out.println("Active: " + account.isActive());
		if(account.isActive())
		{
			accountService.activate(account);
		}
		else
		{
			accountService.deactivate(account);
		}
		model.addAttribute("accounts");
		return "account/AccountStatusConfirmation";
	}

	private String getLoginId() {
		String currentPrincipalName = "none";
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (!(authentication instanceof AnonymousAuthenticationToken)) {
			currentPrincipalName = authentication.getName();
		}
		return currentPrincipalName;
	}
	
	@ModelAttribute("rolelist")
	public Map<String,String> getRoleList() {
		Map<String,String> roleList = new LinkedHashMap<String,String>();
		roleList.put("Faculty", "Faculty");
		roleList.put("Alumni", "Alumni");
		roleList.put("Student", "Student");
		return roleList;
	}
	public static String encodePassword(String rawPassword) {
	   BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	   String encryptedPassword = passwordEncoder.encode(rawPassword);
	   return encryptedPassword;
	}
	
	/**
	 * Will display a users account profile
	 * @author Ben Degler
	 * @param locale				a new Locale object
	 * @param model					properties of the Model object	
	 * @return ViewProfile			account confirm page of registering user
	 */
	@RequestMapping(value = "/viewallprofiles", method = RequestMethod.GET)
	public String viewAllProfiles(Locale locale, Model model) {
		model.addAttribute("profiles", accountService.getAllAccounts());
		return "account/ViewAllProfiles";
	}
	
	/**
	 * Will display a users account profile
	 * @author Ben Degler
	 * @param locale				a new Locale object
	 * @param model					properties of the Model object	
	 * @return ViewProfile			JSP for editing an account profile
	 */
	@RequestMapping(value = "/editmyprofile", method = RequestMethod.GET)
	public String editProfile(Principal principal, Locale locale, Model model) {
		Account account = accountService.getAccountByEmail(principal.getName());
		model.addAttribute("profile", account);
		return "account/EditProfile";
	}
	
	/**
	 * Controls the update profile confirmation page mapping
	 * @author Ben Degler
	 * @param account				a new Account object with new user data
	 * @param locale				a new Locale object
	 * @param model					properties of the Model object	
	 * @return AccountStatusConfirmation	account confirm page of registering user
	 */
	@RequestMapping(value = "/editprofileconfirmation", method = RequestMethod.POST)
	public String editProfileConfirmation(@Valid @ModelAttribute("profile") Account account, BindingResult result, Model model) {
		model.addAttribute("profile");
		return "account/EditProfileConfirmation";
	}
}
