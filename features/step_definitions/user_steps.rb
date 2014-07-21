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

def default_user
  @user_data['Testy McUserton']
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
  visit new_user_session_path

  fill_in "Email", :with => @user_data[user_name][:email]
  fill_in "Password", :with => @user_data[user_name][:password]
  click_button "Sign in"
end

def sign_out
  visit root_path
  if page.has_css?("[data-role='sign-out']")
    find(:css, "[data-role='sign-out']").click
  end
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

Given(/^I confirm my email identity$/) do
  confirm_via_emailed_link
end

When(/^I look at the list of users$/) do
  visit root_path
end

When(/^I sign in with valid credentials$/) do
  sign_out
  create_user_data
  sign_in
end

When(/^I sign out$/) do
  sign_out
end

When(/^I sign up$/) do
  create_user_data
  sign_up
end

When(/^I sign up with valid user data$/) do
  create_user_data
  sign_up
end

When(/^I become an admin$/) do
  user = User.find_by_email(user_email)
  user.admin = true
  user.save!
end

When(/^I have signed in with valid admin credentials$/) do
  steps %{
  When I sign up with valid user data
  And I sign in with valid credentials
  And I become an admin
  }
end

When(/^I turn an existing admin into a standard user$/) do
  user = User.find_by_email(user_email)
  user.admin = false
  user.save!
end

When(/^I sign up with an invalid email$/) do
  create_user_data
  default_user[:email] = "notanemail"
  sign_up
end

When(/^I sign up without a password confirmation$/) do
  create_user_data
  merge_into_user_data(:password_confirmation => "")
  sign_up
end

When(/^I sign up without a password$/) do
  create_user_data
  default_user[:password] = ""
  default_user[:password_confirmation] = ""
  sign_up
end

When(/^I sign up with a mismatched password confirmation$/) do
  create_user_data
  merge_into_user_data(:password_confirmation => "changeme123")
  sign_up
end

When(/^I return to the site$/) do
  root_path
end

When(/^I sign in with a wrong email$/) do
  merge_into_user_data(:email => "wrong@example.com")
  sign_in
end

When(/^I sign in with a wrong password$/) do
  merge_into_user_data(:password => "wrongpass")
  sign_in
end

When(/^I edit my account details$/) do
  click_link "Edit account"

  fill_in "Name", :with => "newname"
  fill_in "user_current_password", :with => @user_data[:password]
  click_button "Update"
end

Then(/^I should have signed up successfully$/) do
  page.should have_content "Your account was successfully confirmed"
end

Then(/^I should be signed out$/) do
  page.should have_content "Sign up"
  page.should have_content "Sign in"
  page.should_not have_content "Sign out"
end

Then(/^I see a successful sign in message$/) do
  page.should have_content I18n.t("devise.sessions.signed_in")
end

Then(/^I see an unconfirmed account message$/) do
  page.should have_content "You have to confirm your account before continuing."
end

Then(/^I should see an 'is invalid' message$/) do
  page.should have_content "is invalid"
end

Then (/^I should see a mismatched password message$/) do
  page.should have_content "doesn't match Password"
end

Then(/^I should be signed in$/) do
  page.should have_css "[data-role='sign-out']"
  page.should_not have_content "Sign up"
  page.should_not have_content "Sign in"
end

Then(/^I should see a missing password message$/)do
  within_role("new-user") do
    within_role("password") do
      page.should have_content "can't be blank"
    end
  end
end

Then(/^I should see a missing password confirmation message$/) do
  page.should have_content "doesn't match Password"
end

Then(/^I should see a signed out message$/) do
  page.should have_content "Signed out successfully."
end

Then(/^I should see a successful sign up message$/) do
  page.should have_content I18n.t('devise.registrations.signed_up')
end

Then(/^I should see an account edited message$/) do
  page.should have_content "You updated your account successfully."
end

Then(/^I see an invalid sign in message$/) do
  page.should have_content "Invalid email or password."
end

Then(/^I should see my name$/) do
  create_user
  page.should have_content @user[:name]
end