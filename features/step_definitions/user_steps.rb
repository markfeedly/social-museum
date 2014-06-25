### UTILITY METHODS ###
Before do
  @user_sign_in_data = nil
  @user = nil
end

def create_user_sign_in_data(user_name="Testy McUserton")
  @user_sign_in_data ||= {:name => user_name, :email => "#{user_name.downcase.gsub(/ /,'.')}@example.com",
                          :password => "changeme", :password_confirmation => "changeme"}
end

def create_user(user_name="Testy McUserton")
  create_user_sign_in_data(user_name)
  sign_up
  confirm_via_emailed_link
end

def delete_user
  @user ||= User.where(email: @user_sign_in_data[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit '/users/sign_up'
  fill_in "Name", :with => @user_sign_in_data[:name]
  fill_in "Email", :with => @user_sign_in_data[:email]
  fill_in "user_password", :with => @user_sign_in_data[:password]
  fill_in "user_password_confirmation", :with => @user_sign_in_data[:password_confirmation]
  click_button "Sign up"
  #find_user
end

def confirm_via_emailed_link
  p User.all
  p @user_sign_in_data[:email]
  unread_emails_for(@user_sign_in_data[:email]).size.should == 1
  open_last_email
  click_email_link_matching /confirm/
end

def sign_in
  visit '/users/sign_in'
  fill_in "Email", :with => @user_sign_in_data[:email]
  fill_in "Password", :with => @user_sign_in_data[:password]
  click_button "Sign in"
end

### GIVEN ###
Given /^I am not signed in$/ do
  visit '/users/sign_out'
end

Given /^I have signed in with valid credentials$/ do
  create_user
  visit '/users/sign_out'    #TODO Email not found in the next line if I omit this, why?
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  create_user_sign_in_data
  delete_user
end

# Given /^I exist as an unconfirmed user$/ do
#   create_unconfirmed_user
# end

### AND ###

And(/^I sign up$/) do
  create_user_sign_in_data
  sign_up
end

And(/^I confirm my email identity$/) do
  confirm_via_emailed_link
end

### WHEN ###
When /^I sign in with valid credentials$/ do
  create_user_sign_in_data
  sign_in
end

When /^I try to sign in with invalid credentials$/ do
  create_user_sign_in_data
  sign_in
end

When /^I sign out$/ do
  visit '/users/sign_out'
end

When /^I sign up with valid user data$/ do
  create_user_sign_in_data
  sign_up
end

When /^I sign up with an invalid email$/ do
  create_user_sign_in_data
  @user_sign_in_data = @user_sign_in_data.merge(:email => "notanemail")
  sign_up
end

When /^I sign up without a password confirmation$/ do
  create_user_sign_in_data
  @user_sign_in_data = @user_sign_in_data.merge(:password_confirmation => "")
  sign_up
end

When /^I sign up without a password$/ do
  create_user_sign_in_data
  @user_sign_in_data = @user_sign_in_data.merge(:password => "")
  sign_up
end

When /^I sign up with a mismatched password confirmation$/ do
  create_user_sign_in_data
  @user_sign_in_data = @user_sign_in_data.merge(:password_confirmation => "changeme123")
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @user_sign_in_data = @user_sign_in_data.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @user_sign_in_data = @user_sign_in_data.merge(:password => "wrongpass")
  sign_in
end

When /^I edit my account details$/ do
  click_link "Edit account"
  fill_in "Name", :with => "newname"
  fill_in "user_current_password", :with => @user_sign_in_data[:password]
  click_button "Update"
end

When /^I look at the list of users$/ do
  visit '/'
end

### THEN ###

Then(/^I should have signed up successfully$/) do
  page.should have_content "Your account was successfully confirmed"
end

Then /^I should be signed in$/ do
  page.should have_content "Sign out"
  page.should_not have_content "Sign up"
  page.should_not have_content "Sign in"
end

Then /^I should be signed out$/ do
  page.should have_content "Sign up"
  page.should have_content "Sign in"
  page.should_not have_content "Sign out"
end

Then /^I see an unconfirmed account message$/ do
  page.should have_content "You have to confirm your account before continuing."
end

Then /^I see a successful sign in message$/ do
  page.should have_content "Sign out"
end

Then /^I should see a successful sign up message$/ do
  page.should have_content "Sign out"
end

Then /^I should see an invalid email message$/ do
  page.should have_content "Emailis invalid"
end

Then /^I should see a missing password message$/ do
  page.should have_content "Passwordcan't be blank"
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "doesn't match Password"
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "doesn't match Password"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I see an invalid sign in message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I should see an account edited message$/ do
  page.should have_content "You updated your account successfully."
end

Then /^I should see my name$/ do
  create_user
  page.should have_content @user[:name]
end

#------------------------------------


