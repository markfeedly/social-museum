### UTILITY METHODS ###
Before do
  @user_data = {}
end

def create_user_data(user_name="Testy McUserton")
  @user_data[user_name] ||= {:name => user_name, :email => "#{user_name.downcase.gsub(/ /,'.')}@example.com",
                          :password => "changeme", :password_confirmation => "changeme"}
end

def user_exists?(user_name="Testy McUserton")
  @user_data.each{|name, data| return true if data[:name] == user_name }
  return false
end

def merge_into_user_data(merge_data, user_name="Testy McUserton")
  @user_data[user_name] = @user_data[user_name].merge(merge_data)
end

def user_email(user_name="Testy McUserton") #TODO cld refactor to use this and similar methods in this file
  @user_data[user_name][:email]
end

def all_user_emails
  @user_data.collect{ |u| u[1][:email] }
end

def create_user(user_name="Testy McUserton")
  sign_up(user_name)
  confirm_via_emailed_link(user_name)
end

def delete_user(user_name="Testy McUserton")
  if @user_data[user_name]
    u = User.where(email: @user_data[user_name][:email]).first
    u.destroy unless u.nil?
    @user_data[user_name] = nil
  end
end

def sign_up(user_name="Testy McUserton")
  delete_user(user_name)
  create_user_data(user_name)

  visit new_user_registration_path
  
  fill_in "Name", :with => @user_data[user_name][:name]
  fill_in "Email", :with => @user_data[user_name][:email]
  fill_in "user_password", :with => @user_data[user_name][:password]
  fill_in "user_password_confirmation", :with => @user_data[user_name][:password_confirmation]
  click_button "Sign up"
end

def confirm_via_emailed_link(user_name="Testy McUserton")
  unread_emails_for(@user_data[user_name][:email]).size.should == 1
  open_last_email
  click_email_link_matching /confirm/
end

def sign_in(user_name="Testy McUserton")
  sign_out
  visit '/users/sign_in'
  page.should have_content 'Sign in'
  fill_in "Email", :with => @user_data[user_name][:email]
  fill_in "Password", :with => @user_data[user_name][:password]
  click_button "Sign in"
end

def sign_out
  visit '/users/sign_out'
end

Given /^I am not signed in$/ do
  sign_out
end

Given /^I have signed in with valid credentials$/ do
  create_user
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  create_user_data
  delete_user
end


# -----------------------------------------------------------------

And(/^I confirm my email identity$/) do
  confirm_via_emailed_link
end

When /^I look at the list of users$/ do
  visit '/'
end

When /^I sign in with valid credentials$/ do
  sign_out
  create_user_data
  sign_in
end

When /^I sign out$/ do
  sign_out
end

And(/^I sign up$/) do
  create_user_data
  sign_up
end

When /^I sign up with valid user data$/ do
  create_user_data
  sign_up
end

When /^I sign up with an invalid email$/ do
  create_user_data
  @user_data = @user_data.merge(:email => "notanemail")
  sign_up
end

When /^I sign up without a password confirmation$/ do
  create_user_data
  merge_into_user_data(:password_confirmation => "")
  sign_up
end

When /^I sign up without a password$/ do
  create_user_data
  merge_into_user_data(:password => "")
  sign_up
end

When /^I sign up with a mismatched password confirmation$/ do
  create_user_data
  merge_into_user_data(:password_confirmation => "changeme123")
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  merge_into_user_data(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  merge_into_user_data(:password => "wrongpass")
  sign_in
end

When /^I edit my account details$/ do
  click_link "Edit account"
  fill_in "Name", :with => "newname"
  fill_in "user_current_password", :with => @user_data[:password]
  click_button "Update"
end

Then(/^I should have signed up successfully$/) do
  page.should have_content "Your account was successfully confirmed"
end

Then /^I should be signed out$/ do
  page.should have_content "Sign up"
  page.should have_content "Sign in"
  page.should_not have_content "Sign out"
end

Then /^I see a successful sign in message$/ do
  page.should have_content "Sign out"
  end

Then /^I see an unconfirmed account message$/ do
  page.should have_content "You have to confirm your account before continuing."
end

Then /^I should see an invalid email message$/ do
  page.should have_content "is invalid"
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "doesn't match Password"
end

Then /^I should be signed in$/ do
  page.should have_content "Sign out"
  page.should_not have_content "Sign up"
  page.should_not have_content "Sign in"
end

Then /^I should see a missing password message$/ do
  page.should have_content "Passwordcan't be blank"
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "doesn't match Password"
end


Then /^I should see a signed out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I should see a successful sign up message$/ do
  page.should have_content "Sign out"
end

Then /^I should see an account edited message$/ do
  page.should have_content "You updated your account successfully."
end

Then /^I see an invalid sign in message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I should see my name$/ do
  create_user
  page.should have_content @user[:name]
end

When /^I try to sign in with invalid credentials$/ do
  create_user_data
  sign_in
end


