package com.smo.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;

@Document
public class SMOUser implements UserDetails, Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private String id;
	@Indexed(unique = true)
	private String username;
	private String password;
	private String fname;
	private String lname;
	private boolean accountNonExpired = true;
	private boolean accountNonLocked = true;
	private boolean registerationApproved = false;
	private boolean credentialsNonExpired = true;
	private boolean isHomePageCreated = false;
	private boolean isEmailVerified = false;
	private List<String> roles = new ArrayList<String>();
	private Date createdDate = new Date();
	private String profilePicture;
	private List<String> contact=new ArrayList<String>();
	private boolean loginViaInternalUser=false;
	private Object oldOAuth=null;
	
	
	

	public void addRole(String role) {
		this.roles.add(role);
	}

	public void removeRole(String role) {
		for (Iterator<String> iter = this.roles.iterator(); iter.hasNext();) {
			if (iter.next().equals(role))
				iter.remove();
		}
	}

	

	public String getRolesCSV() {
		StringBuilder sb = new StringBuilder();
		for (Iterator<String> iter = this.roles.iterator(); iter.hasNext();) {
			sb.append(iter.next());
			if (iter.hasNext()) {
				sb.append(',');
			}
		}
		return sb.toString();
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return AuthorityUtils.commaSeparatedStringToAuthorityList(this
				.getRolesCSV());
	}

	@Override
	public String getUsername() {
		return this.username;
	}

	@Override
	public boolean isEnabled() {
		return isAccountNonExpired() && isAccountNonLocked()
				&& isAccountNonLocked() && isCredentialsNonExpired()
				&& isEmailVerified();
	}

	@Override
	public String getPassword() {
		return this.password;
	}

	@Override
	public boolean isAccountNonExpired() {
		return this.accountNonExpired;
	}

	@Override
	public boolean isAccountNonLocked() {
		return this.accountNonLocked;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return this.credentialsNonExpired;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the isHomePageCreated
	 */
	public boolean isHomePageCreated() {
		return isHomePageCreated;
	}

	public boolean isRegisterationApproved() {
		return registerationApproved;
	}

	public void setRegisterationApproved(boolean registerationApproved) {
		this.registerationApproved = registerationApproved;
	}

	/**
	 * @param isHomePageCreated
	 *            the isHomePageCreated to set
	 */
	public void setHomePageCreated(boolean isHomePageCreated) {
		this.isHomePageCreated = isHomePageCreated;
	}

	/**
	 * @return the isEmailVerified
	 */
	public boolean isEmailVerified() {
		return isEmailVerified;
	}

	/**
	 * @param isEmailVerified
	 *            the isEmailVerified to set
	 */
	public void setEmailVerified(boolean isEmailVerified) {
		this.isEmailVerified = isEmailVerified;
	}

	/**
	 * @return the roles
	 */
	public List<String> getRoles() {
		return roles;
	}

	/**
	 * @param roles
	 *            the roles to set
	 */
	public void setRoles(List<String> roles) {
		this.roles = roles;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @param accountNonExpired
	 *            the accountNonExpired to set
	 */
	public void setAccountNonExpired(boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}

	/**
	 * @param accountNonLocked
	 *            the accountNonLocked to set
	 */
	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}

	/**
	 * @param credentialsNonExpired
	 *            the credentialsNonExpired to set
	 */
	public void setCredentialsNonExpired(boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}

	

	public void setUsername(String username) {
		this.username = username;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getProfilePicture() {
		return profilePicture;
	}

	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}

	public List<String> getContact() {
		return contact;
	}

	public void setContact(List<String> contact) {
		this.contact = contact;
	}

	public boolean isLoginViaInternalUser() {
		return loginViaInternalUser;
	}

	public void setLoginViaInternalUser(boolean loginViaInternalUser) {
		this.loginViaInternalUser = loginViaInternalUser;
	}

	public Object getOldOAuth() {
		return oldOAuth;
	}

	public void setOldOAuth(Object oldOAuth) {
		this.oldOAuth = oldOAuth;
	}


	

}
