Given /^I am not signed in$/ do
  sign_out
end

Given /^I exist as a user$/ do
  create_user
end

Then /^I should have a confirmation email$/ do

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
  visit users_path
end

When(/^I (?:am |have )?sign(?:ed)? in(?: with valid credentials)?$/) do
  sign_up
  confirm_via_emailed_link
  sign_in
end

When(/^I sign out$/) do
  sign_out
end

When(/^I (?:am )?sign(?:ed)? up(?: with valid user data)?$/) do
  sign_up
end

When(/^I (?:am |have )?sign(?:ed)? in as an admin(?:istrator)?$/) do
  sign_out
  create_user("admin")
  user = User.find_by_email(user_email("admin"))
  user.admin = true
  user.save!
  sign_in("admin")
end

When(/^I sign up with an invalid email$/) do
  create_user_data
  default_user[:email] = "notanemail"
  sign_up
end

When(/^I (?:am |have )?sign(?:ed)? in as a spammer$/) do
  sign_out
  create_user("viagra-test-123")
  sign_in("viagra-test-123")
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
  expect(page).to have_content "Your account was successfully confirmed"
end

Then(/^I should be signed out$/) do
  expect(page).to     have_css "[data-role='sign-up']"
  expect(page).to     have_css "[data-role='sign-in']"
  expect(page).to_not have_css "[data-role='sign-out']"
end

Then(/^I see a successful sign in message$/) do
  expect(page).to have_content I18n.t("devise.sessions.signed_in")
end

Then(/^I see an unconfirmed account message$/) do
  expect(page).to have_content "You have to confirm your account before continuing."
end

Then(/^I should see an 'is invalid' message$/) do
  expect(page).to have_content "is invalid"
end

Then (/^I should see a mismatched password message$/) do
  expect(page).to have_content "doesn't match Password"
end

Then(/^I should be signed in$/) do
  expect(page).to     have_css "[data-role='sign-out']"
  expect(page).to_not have_css "[data-role='sign-up']"
  expect(page).to_not have_css "[data-role='sign-in']"
end

Then(/^I should see a missing password message$/)do
  within_role("new-user") do
    within_role("password") do
      expect(page).to have_content "can't be blank"
    end
  end
end

Then(/^I should see a missing password confirmation message$/) do
  expect(page).to have_content "doesn't match Password"
end

Then(/^I should see a signed out message$/) do
  expect(page).to have_content "Signed out successfully."
end

Then(/^I should see a successful sign up message$/) do
  expect(page).to have_content I18n.t('devise.registrations.signed_up')
end

Then(/^I should see an account edited message$/) do
  expect(page).to have_content "You updated your account successfully."
end

Then(/^I see an invalid sign in message$/) do
  expect(page).to have_content "Invalid email or password."
end

Then(/^I should see my name$/) do
  expect(page).to have_content user_data[:current_user] || default_user_name
end